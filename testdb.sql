--
-- Initialization of Test DB
--
SET search_path = public,pgstrom;

DROP EXTENSION IF EXISTS pg_strom CASCADE;
DROP TABLE IF EXISTS t0;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;
DROP TABLE IF EXISTS t4;
DROP TABLE IF EXISTS t5;
DROP TABLE IF EXISTS t6;
DROP TABLE IF EXISTS t7;
DROP TABLE IF EXISTS t8;
DROP TABLE IF EXISTS t9;

-- all the setup shall be atomic
BEGIN;

-- initialize random seed
SELECT setseed(0.20180124);

-- create extension
CREATE EXTENSION pg_strom;

-- general putpose large table
CREATE TABLE t0 (id int primary key,
                 cat text,
                 aid int,
                 bid int,
                 cid int,
                 did int,
                 eid int,
                 fid int,
                 gid int,
                 hid int,
                 iid int,
                 ymd date);
CREATE TABLE t1 (aid int primary key, atext text, ax float, ay float);
CREATE TABLE t2 (bid int, btext text, bx float, by float);
CREATE TABLE t3 (cid int primary key, ctext text, cx float, cy float);
CREATE TABLE t4 (did int, dtext text, dx float, dy float);
CREATE TABLE t5 (eid int primary key, etext text, ex float, ey float);
CREATE TABLE t6 (fid int, ftext text, fx float, fy float);
CREATE TABLE t7 (gid int primary key, gtext text, gx float, gy float);
CREATE TABLE t8 (hid int, htext text, hx float, hy float);
CREATE TABLE t9 (iid int primary key, itext text, ix float, iy float);

INSERT INTO t0 (SELECT x, random_text(0.5),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_int(0.5, 1, 100000),
                       random_date(0.5)
                  FROM generate_series(1,1000000) x);
INSERT INTO t1 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t2 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t3 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t4 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t5 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t6 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t7 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t8 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);
INSERT INTO t9 (SELECT x,md5((x+1)::text),
                       random_float(0.5, 1.0, 1000.0),
                       random_float(0.5, 1.0, 1000.0)
                  FROM generate_series(1, 100000) x);

-- Mark TestDB construction completed
COMMIT;
-- vacuum tables
VACUUM ANALYZE;