/*
 * Copyright (c) 2022 Intel Corporation.
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#include "CiderOperator.h"

#include <cstdint>
#include <memory>
#include <vector>

#include "Allocator.h"
#include "velox/exec/Task.h"

#include "CiderJoinBuild.h"
#include "CiderStatefulOperator.h"
#include "CiderStatelessOperator.h"
#include "DataConvertor.h"

namespace facebook::velox::plugin {

CiderOperator::CiderOperator(int32_t operatorId,
                             exec::DriverCtx* driverCtx,
                             const std::shared_ptr<const CiderPlanNode>& ciderPlanNode)
    : Operator(driverCtx,
               ciderPlanNode->outputType(),
               operatorId,
               ciderPlanNode->id(),
               "CiderOp")
    , planNode_(ciderPlanNode) {
  // Set up exec option and compilation option
  if (!ciderPlanNode->isKindOf(CiderPlanNodeKind::kJoin)) {
    const auto plan = ciderPlanNode->getSubstraitPlan();
    auto exec_option = CiderExecutionOption::defaults();
    auto compile_option = CiderCompilationOption::defaults();

    ciderCompileModule_ = CiderCompileModule::Make();
    auto ciderCompileResult =
        ciderCompileModule_->compile(plan, compile_option, exec_option);
    auto allocator = std::make_shared<PoolAllocator>(operatorCtx_->pool());
    ciderRuntimeModule_ = std::make_shared<CiderRuntimeModule>(
        ciderCompileResult, compile_option, exec_option, allocator);
    outputSchema_ = std::make_shared<CiderTableSchema>(
        ciderCompileResult->getOutputCiderTableSchema());
  }
  // hardcode, init a DataConvertor here.
  dataConvertor_ = DataConvertor::create(CONVERT_TYPE::DIRECT);
}

std::unique_ptr<CiderOperator> CiderOperator::Make(
    int32_t operatorId,
    exec::DriverCtx* driverCtx,
    const std::shared_ptr<const CiderPlanNode>& ciderPlanNode) {
  auto isStateful = ciderPlanNode->isKindOf(CiderPlanNodeKind::kAggregation);
  if (isStateful) {
    auto ciderOperator = std::unique_ptr<CiderOperator>(
        new CiderStatefulOperator(operatorId, driverCtx, ciderPlanNode));
    return std::move(ciderOperator);
  } else {
    auto ciderOperator = std::unique_ptr<CiderOperator>(
        new CiderStatelessOperator(operatorId, driverCtx, ciderPlanNode));
    return std::move(ciderOperator);
  }
}

bool CiderOperator::needsInput() const {
  return !noMoreInput_ && !input_ && !buildSideEmpty_;
}

void CiderOperator::addInput(RowVectorPtr input) {
  if (planNode_->isKindOf(CiderPlanNodeKind::kJoin)) {
    // In getOutput(), we are going to wrap input in dictionaries a few rows at a
    // time. Since lazy vectors cannot be wrapped in different dictionaries, we
    // are going to load them here.
    for (auto& child : input->children()) {
      child->loadedVector();
    }
  }

  input_ = std::move(input);
  auto inBatch =
      dataConvertor_->convertToCider(input_, input_->size(), &convertorInternalCounter);
  ciderRuntimeModule_->processNextBatch(inBatch);
}

exec::BlockingReason CiderOperator::isBlocked(ContinueFuture* future) {
  if (planNode_->isKindOf(CiderPlanNodeKind::kJoin)) {
    if (buildTableFed_) {
      return exec::BlockingReason::kNotBlocked;
    }
    auto joinBridge = operatorCtx_->task()->getCustomJoinBridge(
        operatorCtx_->driverCtx()->splitGroupId, planNodeId());
    auto ciderJoinBridge = std::dynamic_pointer_cast<CiderJoinBridge>(joinBridge);
    auto buildData = ciderJoinBridge->dataOrFuture(future);

    if (!buildData.has_value()) {
      return exec::BlockingReason::kWaitForJoinBuild;
    }

    buildData_ = std::move(buildData);

    if (buildData_->empty()) {
      // Build side is empty. Return empty set of rows and terminate the pipeline
      // early.
      buildSideEmpty_ = true;
    }

    ciderCompileModule_ = CiderCompileModule::Make();

    // TODO: add vector<RowVectorPtr> -> CiderBatch converter
    auto buildBatch = dataConvertor_->convertToCider(
        buildData_->data()[0], buildData_->data()[0]->size(), &convertorInternalCounter);

    ciderCompileModule_->feedBuildTable(std::move(buildBatch));
    auto compileResult = ciderCompileModule_->compile(planNode_->getSubstraitPlan());

    auto compile_option = CiderCompilationOption::defaults();
    auto exec_option = CiderExecutionOption::defaults();
    auto allocator = std::make_shared<PoolAllocator>(operatorCtx_->pool());
    ciderRuntimeModule_ = std::make_shared<CiderRuntimeModule>(
        compileResult, compile_option, exec_option, allocator);

    outputSchema_ =
        std::make_shared<CiderTableSchema>(compileResult->getOutputCiderTableSchema());
    buildTableFed_ = true;
  }
  return exec::BlockingReason::kNotBlocked;
}

bool CiderOperator::isFinished() {
  return finished_;
}

void CiderOperator::close() {
  buildData_.reset();
  Operator::close();
}

}  // namespace facebook::velox::plugin
