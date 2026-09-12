-- =========================================================
-- 1장 실습용 데이터베이스 셋업 (EMP, DEPT)
-- 교재 <그림 1.13> 사원/부서 테이블 기준
-- MySQL 기준. SQLite 로 연습하려면 INT(n) -> INTEGER, CHAR(n) -> TEXT 로 바꾸면 됨.
-- 실행 순서: 이 파일을 먼저 실행 -> practice.sql 에서 문제 풀이
-- =========================================================

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- 부서 테이블 (참조되는 쪽이므로 반드시 먼저 생성)
CREATE TABLE dept (
    deptid  INT(10)   NOT NULL,
    dname   CHAR(20),
    budget  CHAR(5),
    PRIMARY KEY (deptid)
);

-- 사원 테이블 (deptid 가 dept(deptid) 를 참조하는 외래키)
CREATE TABLE emp (
    empid      INT(10)  NOT NULL,
    ename      CHAR(20),
    deptid     INT(5),
    hire_date  DATE,
    job        CHAR(20),
    salary     INT(10)  NOT NULL,
    PRIMARY KEY (empid),
    FOREIGN KEY (deptid) REFERENCES dept(deptid)
);

-- 부서 데이터
INSERT INTO dept (deptid, dname, budget) VALUES
(100, '영업부', '100k'),
(200, '관리부', '300k'),
(300, '구매부', '220k'),
(400, '생산부', '500k');

-- 사원 데이터
INSERT INTO emp (empid, ename, deptid, hire_date, job, salary) VALUES
(1001, '홍성길', 100, '2001-02-01', '특수영업', 350),
(1002, '곽희준', 100, '1999-01-01', '영업관리', 400),
(1003, '김동준', 200, '2000-09-01', '품질관리', 300),
(1004, '성재규', 300, '1997-02-01', '급여',     450),
(1005, '박성범', 200, '2000-02-01', '수입자재', 320);

-- 확인용
SELECT * FROM dept;
SELECT * FROM emp;
