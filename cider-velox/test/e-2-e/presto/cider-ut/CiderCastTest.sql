DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a TinyInt, col_b TinyInt);
INSERT INTO test VALUES 
 (cast(52 as tinyint),cast(-43 as tinyint)), 
 (cast(-23 as tinyint),null), 
 (cast(51 as tinyint),null), 
 (cast(65 as tinyint),null), 
 (cast(-70 as tinyint),null), 
 (cast(-63 as tinyint),cast(-50 as tinyint)), 
 (cast(44 as tinyint),cast(98 as tinyint)), 
 (cast(80 as tinyint),cast(-33 as tinyint)), 
 (cast(-98 as tinyint),null), 
 (cast(-23 as tinyint),cast(-60 as tinyint)), 
 (cast(-66 as tinyint),null), 
 (cast(-43 as tinyint),null), 
 (cast(-79 as tinyint),null), 
 (cast(-72 as tinyint),cast(-82 as tinyint)), 
 (cast(36 as tinyint),null), 
 (cast(-47 as tinyint),null), 
 (cast(-15 as tinyint),cast(86 as tinyint)), 
 (cast(-39 as tinyint),cast(-43 as tinyint)), 
 (cast(90 as tinyint),cast(34 as tinyint)), 
 (cast(85 as tinyint),cast(-61 as tinyint)) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a SmallInt, col_b SmallInt);
INSERT INTO test VALUES 
 (cast(-100 as smallint),null), 
 (cast(69 as smallint),cast(-29 as smallint)), 
 (cast(-59 as smallint),cast(-31 as smallint)), 
 (cast(-44 as smallint),null), 
 (cast(19 as smallint),cast(-20 as smallint)), 
 (cast(-8 as smallint),cast(-32 as smallint)), 
 (cast(-79 as smallint),cast(88 as smallint)), 
 (cast(96 as smallint),cast(-54 as smallint)), 
 (cast(-14 as smallint),cast(-81 as smallint)), 
 (cast(-19 as smallint),null), 
 (cast(-8 as smallint),null), 
 (cast(30 as smallint),cast(-80 as smallint)), 
 (cast(23 as smallint),cast(-17 as smallint)), 
 (cast(72 as smallint),null), 
 (cast(-100 as smallint),cast(-48 as smallint)), 
 (cast(28 as smallint),null), 
 (cast(-5 as smallint),cast(-76 as smallint)), 
 (cast(-47 as smallint),cast(94 as smallint)), 
 (cast(-43 as smallint),cast(-11 as smallint)), 
 (cast(-79 as smallint),null) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a Double, col_b Double);
INSERT INTO test VALUES 
 (-63.907372,-87.596802), 
 (-54.334137,-26.753349), 
 (-34.677948,21.944221), 
 (-75.310928,null), 
 (67.587982,-55.733414), 
 (-62.466576,null), 
 (-1.488914,null), 
 (49.410828,null), 
 (-46.897213,-75.644608), 
 (78.015381,-92.217644), 
 (76.051727,null), 
 (54.459244,85.325439), 
 (-68.419731,null), 
 (29.964371,null), 
 (23.400047,-6.355721), 
 (52.261978,null), 
 (-97.717575,-90.859314), 
 (-54.741383,38.959457), 
 (-91.977631,-49.428719), 
 (67.283005,68.269379) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a Float, col_b Float);
INSERT INTO test VALUES 
 (0.199219,-73.745689), 
 (27.930359,null), 
 (80.181961,null), 
 (-93.339951,null), 
 (8.856476,null), 
 (-85.176285,68.736877), 
 (-7.416679,-98.715706), 
 (32.154007,null), 
 (-64.243790,null), 
 (-89.635323,null), 
 (-47.848011,-88.156273), 
 (-26.870064,41.177048), 
 (-56.998760,null), 
 (-78.088272,88.566940), 
 (-58.864395,null), 
 (-82.860023,null), 
 (20.586349,null), 
 (31.706329,null), 
 (-0.563286,-25.010567), 
 (70.634216,null) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a BigInt, col_b BigInt);
INSERT INTO test VALUES 
 (76,-96), 
 (11,-55), 
 (20,null), 
 (63,-30), 
 (-41,-77), 
 (97,null), 
 (18,null), 
 (-16,92), 
 (7,null), 
 (-6,-27), 
 (76,72), 
 (-37,82), 
 (-67,null), 
 (-68,null), 
 (45,null), 
 (-25,19), 
 (37,99), 
 (-100,-1), 
 (0,59), 
 (-89,53) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_a Integer, col_b Integer);
INSERT INTO test VALUES 
 (-71,null), 
 (-38,null), 
 (-81,-74), 
 (4,null), 
 (-28,-44), 
 (-6,null), 
 (22,37), 
 (53,91), 
 (-66,null), 
 (-53,60), 
 (22,null), 
 (-29,null), 
 (-57,-42), 
 (1,null), 
 (87,null), 
 (-72,-100), 
 (59,-86), 
 (45,30), 
 (38,11), 
 (27,-36) 
;
SELECT CAST(col_a as TINYINT), CAST(col_b as TINYINT) FROM test;
SELECT CAST(col_a as SMALLINT), CAST(col_b as SMALLINT) FROM test;
SELECT CAST(col_a as INTEGER), CAST(col_b as INTEGER) FROM test;
SELECT CAST(col_a as BIGINT), CAST(col_b as BIGINT) FROM test;
SELECT CAST(col_a as FLOAT), CAST(col_b as FLOAT) FROM test;
SELECT CAST(col_a as DOUBLE), CAST(col_b as DOUBLE) FROM test;
SELECT CAST(col_a as DOUBLE)  FROM test where CAST(col_b as INTEGER) > 20 ;
SELECT CAST(col_a as INTEGER), count(col_b) FROM test GROUP BY col_a;
SELECT CAST(col_a as INTEGER) + CAST(col_b as INTEGER) FROM test;
DROP TABLE iF EXISTS test;
CREATE TABLE test(col_1 TINYINT, col_2 INTEGER, col_3 VARCHAR(10), col_4 BOOLEAN NOT NULL, col_5 DATE);
INSERT INTO test VALUES 
 (cast(0 as tinyint),0,'0000000000',cast(0 as BOOLEAN),from_unixtime(0)), 
 (cast(1 as tinyint),1,'1111111111',cast(1 as BOOLEAN),from_unixtime(86400)), 
 (cast(2 as tinyint),2,'2222222222',cast(0 as BOOLEAN),from_unixtime(172800)), 
 (cast(3 as tinyint),3,'3333333333',cast(1 as BOOLEAN),from_unixtime(259200)), 
 (cast(4 as tinyint),4,'4444444444',cast(0 as BOOLEAN),from_unixtime(345600)), 
 (cast(5 as tinyint),5,'5555555555',cast(1 as BOOLEAN),from_unixtime(432000)), 
 (cast(6 as tinyint),6,'6666666666',cast(0 as BOOLEAN),from_unixtime(518400)), 
 (cast(7 as tinyint),7,'7777777777',cast(1 as BOOLEAN),from_unixtime(604800)), 
 (cast(8 as tinyint),8,'8888888888',cast(0 as BOOLEAN),from_unixtime(691200)), 
 (cast(9 as tinyint),9,'9999999999',cast(1 as BOOLEAN),from_unixtime(777600)), 
 (cast(10 as tinyint),10,'AAAAAAAAAA',cast(0 as BOOLEAN),from_unixtime(864000)), 
 (cast(11 as tinyint),11,'BBBBBBBBBB',cast(1 as BOOLEAN),from_unixtime(950400)), 
 (cast(12 as tinyint),12,'CCCCCCCCCC',cast(0 as BOOLEAN),from_unixtime(1036800)), 
 (cast(13 as tinyint),13,'DDDDDDDDDD',cast(1 as BOOLEAN),from_unixtime(1123200)), 
 (cast(14 as tinyint),14,'EEEEEEEEEE',cast(0 as BOOLEAN),from_unixtime(1209600)), 
 (cast(15 as tinyint),15,'FFFFFFFFFF',cast(1 as BOOLEAN),from_unixtime(1296000)), 
 (cast(16 as tinyint),16,'GGGGGGGGGG',cast(0 as BOOLEAN),from_unixtime(1382400)), 
 (cast(17 as tinyint),17,'HHHHHHHHHH',cast(1 as BOOLEAN),from_unixtime(1468800)), 
 (cast(18 as tinyint),18,'IIIIIIIIII',cast(0 as BOOLEAN),from_unixtime(1555200)), 
 (cast(19 as tinyint),19,'JJJJJJJJJJ',cast(1 as BOOLEAN),from_unixtime(1641600)) 
;
SELECT CAST(col_4 as TINYINT) FROM test;
SELECT CAST(col_4 as INTEGER) FROM test;