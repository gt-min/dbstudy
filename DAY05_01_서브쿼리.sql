/*
  서브 쿼리
  1. 메인 쿼리에 포함되는 하위 쿼리를 의미한다.
  2. 실행 순서
    서브 쿼리 → 메인 쿼리
  3. 종류
    1) SELECT 절 : 스칼라 서브 쿼리
    2)   FROM 절 : 인라인 뷰
    3)  WHERE 절 : 서브 쿼리
      (1) 단일 행 서브 쿼리 : 서브 쿼리 실행 결과가 1행이다. 메인 쿼리에서 연산자 =, !=, >, <, >=, <= 를 사용할 수 있다.
      (2) 다중 행 서브 쿼리 : 서브 쿼리 실행 결과가 N행이다. 메인 쿼리에서 연산자 IN, ALL, ANY 등을 사용할 수 있다.
*/

-- 1. 사원번호가 1004인 사원의 직책을 가진 모든 사원을 조회하기
SELECT *
  FROM employee_t
 WHERE position = (SELECT position 
                     FROM employee_t
                    WHERE emp_no = 1004);

-- 2. 모든 사원들의 평균연봉보다 높은 연봉을 받는 사원을 조회하기
SELECT *
  FROM employee_t
 WHERE salary > (SELECT AVG(salary)
                   FROM employee_t);

-- 3. 부서의 지역명이 '대구'인 부서에 근무하는 사원을 조회하기
SELECT *
  FROM employee_t
 WHERE depart IN(SELECT dept_no
                   FROM department_t
                  WHERE location = '대구');

-- 4. N번째로 입사한 사원을 조회하기
/*
  1) 입사일자 순으로 오름차순 정렬을 한다. (가장 먼저 입사한 사원이 1행에 나타난다.)
  2) 정렬 결과에 행 번호(ROWNUM)를 붙인다.
    (1) ROWNUM 자체는 1을 포함한 조건만 지정이 가능하다.
    (2) ROWNUM 의 ALIAS(별명)을 이용하면 모든 조건 지정이 가능하다.
  3) N번째 행을 조회한다.
*/

-- 1) ROWNUM 가상 칼럼 이용하기
SELECT emp_no, name, depart, position, gender, hire_date, salary
  FROM (SELECT ROWNUM AS rnum, emp_no, name, depart, position, gender, hire_date, salary
          FROM (SELECT emp_no, name, depart, position, gender, hire_date, salary
                  FROM employee_t
                 ORDER BY hire_date ASC))
 WHERE rnum = 4;

-- 2) ROW_NUMBER 함수 이용하기
SELECT emp_no, name, depart, position, gender, hire_date, salary
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY hire_date ASC) AS rnum, emp_no, name, depart, position, gender, hire_date, salary
          FROM employee_t)
 WHERE rnum = 3;

-- 5. 연봉 2~3번째 사원 조회하기
SELECT emp_no, name, depart, position, gender, hire_date, salary
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY salary DESC) AS rnum, emp_no, name, depart, position, gender, hire_date, salary
          FROM employee_t)
 WHERE rnum BETWEEN 2 AND 3;

-- 6. 부서번호, 부서명, 사원수를 조회하시오.
SELECT dept_no
     , dept_name
     , (SELECT COUNT(*)
          FROM employee_t e
         WHERE d.depart = d.dept_no)
  FROM department_t d;
