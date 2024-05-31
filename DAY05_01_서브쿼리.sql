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
  FROM EMPLOYEE_T
 WHERE POSITION = (SELECT POSITION 
                     FROM EMPLOYEE_T
                    WHERE EMP_NO = 1004);

-- 2. 모든 사원들의 평균연봉보다 높은 연봉을 받는 사원을 조회하기
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEE_T);

-- 3. 부서의 지역명이 '대구'인 부서에 근무하는 사원을 조회하기
SELECT *
  FROM EMPLOYEE_T
 WHERE DEPART IN(SELECT DEPT_NO
                   FROM DEPARTMENT_T
                  WHERE LOCATION = '대구');
