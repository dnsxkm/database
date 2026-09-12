-- =========================================================
-- 1장 SQL 실습 문제
-- setup.sql 을 먼저 실행한 뒤, 각 문제 아래 빈 줄에 SQL 을 작성하세요.
-- =========================================================

-- ---------- [SELECT] ----------
-- 1. 모든 사원의 이름(ename)과 급여(salary)를 조회하시오.
SELECT emp.ename, emp.salary
FROM emp;

-- 2. 급여가 350 이상인 사원의 사번, 이름, 급여를 조회하시오.
SELECT emp.empid, emp.ename, emp.salary
FROM emp
WHERE emp.salary >= 350;

-- 3. 부서번호(deptid)가 200 인 사원의 이름과 담당업무(job)를 조회하시오.
SELECT emp.ename, emp.job
FROM emp
WHERE emp.deptid = 200;

-- 4. 부서번호별 사원 수를 조회하시오. (deptid, 사원수)
SELECT emp.deptid, COUNT(emp.empid) AS 사원수
FROM emp
GROUP BY emp.deptid;

-- 5. 부서번호별 평균 급여를 조회하시오. (deptid, 평균급여)
SELECT emp.deptid, AVG(salary) AS 평균급여
FROM emp
GROUP BY emp.deptid;

-- 6. 모든 사원의 이름과 그 사원이 속한 부서 이름(dname)을 조회하시오. (조인)
SELECT emp.ename, dept.dname
FROM emp, dept
WHERE emp.deptid = dept.deptid;

-- 7. '곽희준' 사원이 속한 부서의 예산(budget)을 조회하시오. (조인 + 조건)
SELECT dept.budget
FROM emp, dept -- 테이블만 올 수 있다
WHERE emp.deptid = dept.deptid
and emp.ename = '곽희준';

-- ---------- [INSERT] ----------
-- 8. 사번 1006, 이름 '강윤호', 부서 200, 입사일 2001-01-10,
--    담당업무 '연말정산', 급여 400 인 사원을 삽입하시오.
INSERT INTO emp (empid, ename, deptid, hire_date, job, salary)
VALUES (1006, '강윤호', '200', '2001-01-10', '연말정산', '400');

-- 9. 사번 1007, 이름 '남진선', 급여 500 만 지정하여 삽입하시오. (나머지 컬럼 생략)
INSERT INTO emp (empid, ename, salary)
VALUES (1007, '남진선', 500);


-- ---------- [UPDATE] ----------
-- 10. '박성범' 사원의 급여를 350 으로 변경하시오.
UPDATE emp
SET salary=350
WHERE ename='박성범';

-- 11. 관리부(deptid = 200) 소속 사원의 급여를 10% 인상하시오.
UPDATE emp
SET salary = salary * 1.1
WHERE deptid = (SELECT deptid
                FROM dept
                WHERE dname = '관리부');

-- ---------- [DELETE] ----------
-- 12. 담당업무(job)가 '수입자재' 인 사원을 삭제하시오.
DELETE FROM emp
WHERE emp.job = '수입자재';

-- ---------- [CREATE] ----------
-- 13. 위 실습에서 사용한 EMP, DEPT 테이블을
--     기본키(PK)와 외래키(FK)를 포함하여 직접 CREATE 문으로 작성하시오.
--     (힌트: 참조되는 dept 를 먼저 만들어야 FK 가 걸린다)
CREATE TABLE dept
(   deptid int(10) NOT NULL,
    dname char(20),
    budget char(5),
    PRIMARY KEY(deptid)
);

CREATE TABLE emp
(   empid int(10) NOY NULL,
    ename char(20),
    deptid int(5),
    hire_date date,
    job char(20),
    salary int(10) NOT NULL,
    PRIMARY KEY(empid).
    FOREIGN KEY (deptid) REFERENCES dept(deptid);
)

