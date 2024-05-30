-- 부서-사원 데이터베이스 (기초 데이터)

DROP TABLE employee_t;
DROP TABLE department_t;

CREATE TABLE department_t (
    dept_no   NUMBER            NOT NULL PRIMARY KEY
  , dept_name VARCHAR2(15 BYTE) NOT NULL
  , location  VARCHAR2(15 BYTE) NOT NULL
);
CREATE TABLE employee_t (
    emp_no    NUMBER            NOT NULL PRIMARY KEY
  , name      VARCHAR2(20 BYTE) NOT NULL
  , depart    NUMBER REFERENCES department_t(dept_no)
  , position  VARCHAR2(20 BYTE)
  , gender    CHAR(2 BYTE)
  , hire_date DATE
  , salary    NUMBER
);

INSERT INTO department_t VALUES(1, '영업부', '대구');
INSERT INTO department_t VALUES(2, '인사부', '서울');
INSERT INTO department_t VALUES(3, '총무부', '대구');
INSERT INTO department_t VALUES(4, '기획부', '서울');

INSERT INTO employee_t VALUES(1001, '구창민', 1, '과장', 'M', '95/05/01', 5000000);
INSERT INTO employee_t VALUES(1002, '김민서', 1, '사원', 'M', '17/09/01', 2500000);
INSERT INTO employee_t VALUES(1003, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO employee_t VALUES(1004, '한성일', 2, '과장', 'M', '93/04/01', 5000000);

COMMIT;

/*
  조인
  1. 2개 이상의 테이블을 조회하는 방식이다.
  2. 일대다 관계를 맺고 있는 테이블처럼 서로 관계가 있어야 올바른 조인 결과를 얻을 수 있다.
  3. 종류
    1) 내부 조인
      (1) 조인하는 테이블에 모두 존재하는 데이터를 조회하는 방식
      (2) 형식
        SELECT 칼럼, ...
          FROM 테이블1 INNER JOIN 테이블2
            ON 테이블1.칼럼 = 테이블2.칼럼
    2) 외부 조인
      (1) 조인하는 테이블의 어느 한 곳에만 존재하는 데이터도 함께 조회하는 방식
      (2) 형식
        SELECT 칼럼, ...
          FROM 테이블1 LEFT|RIGHT OUTER JOIN 테이블2
            ON 테이블1.칼럼 = 테이블2.칼럼
*/

-- 1. 사원정보와 부서정보를 모두 조회하시오.
SELECT e.emp_no, e.name, d.dept_no, d.dept_name
  FROM department_t d INNER JOIN employee_t e
    ON d.dept_no = e.depart;

-- 2. 부서별로 평균 연봉을 조회하시오. (부서번호, 부서명, 평균연봉)
SELECT d.dept_no, d.dept_name, AVG(e.salary)
  FROM department_t d INNER JOIN employee_t e
    ON d.dept_no = e.depart
 GROUP BY d.dept_no, d.dept_name;
