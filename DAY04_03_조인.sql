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







