-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오.
SELECT E.employee_id
     , E.first_name
     , D.department_name
  FROM departments D INNER JOIN employees E
    ON D.department_id = E.department_id
 WHERE D.location_id = 1700;

-- 2. DEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오.
SELECT E.employee_id
     , E.first_name
  FROM departments D INNER JOIN employees E
    ON D.department_id = E.department_id
 WHERE D.department_name = 'Executive';

-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, STREET_ADDRESS, CITY를 조회하시오.
SELECT E.employee_id
     , E.first_name
     , D.department_name
     , L.street_address
     , L.city
  FROM locations L INNER JOIN departments D
    ON L.location_id = D.location_id RIGHT JOIN employees E
    ON D.department_id = E.department_id;

-- 4. 사원이 근무 중인 부서를 대상으로 DEPARTMENT_NAME과 근무 중인 사원 수와 평균 연봉을 조회하시오.
SELECT D.department_name
     , COUNT(*)
     , AVG(E.salary)
  FROM departments D INNER JOIN employees E
    ON D.department_id = E.department_id
 GROUP BY D.department_id, D.department_name;

-- 5. JOB_HISTORY 테이블에 존재하는 사원들을 대상으로 사원번호, 현재 JOB_ID, 예전 JOB_ID를 조회하시오.
SELECT E.employee_id
     , E.job_id
     , H.job_id
  FROM employees E INNER JOIN job_history H
    ON E.employee_id = H.employee_id
 WHERE E.job_id != H.job_id;

-- 6. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오. 부서가 없는 사원의 부서명은 'None'으로 조회되도록 처리하시오.
SELECT E.employee_id
     , E.first_name
     , nvl(D.department_name, 'None')
  FROM departments D RIGHT OUTER JOIN employees E
    ON D.department_id = E.department_id;

-- 7. 모든 부서의 DEPARTMENT_NAME과 근무 중인 사원 수를 조회하시오. 근무하는 사원이 없으면 0으로 조회하시오.
SELECT D.department_name
     , COUNT(E.employee_id)
  FROM departments D LEFT JOIN employees E
    ON D.department_id = E.department_id
 GROUP BY D.department_id, D.department_name
 ORDER BY D.department_id;

-- 8. 모든 부서의 DEPARTMENT_ID, DEPARTMENT_NAME, STATE_PROVINCE, COUNTRY_NAME, REGION_NAME을 조회하시오.
SELECT D.department_id
     , D.department_name
     , L.state_province
     , C.country_name
     , R.region_name
  FROM regions R INNER JOIN countries C
    ON R.region_id = C.region_id INNER JOIN locations L
    ON C.country_id = L.country_id INNER JOIN departments D
    ON L.location_id = D.location_id;