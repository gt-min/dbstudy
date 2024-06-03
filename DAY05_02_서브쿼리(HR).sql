-- 1. 사원번호가 110인 사원과 동일한 직책(JOB_ID)을 가진 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE job_id = (SELECT job_id
                   FROM employees
                  WHERE employee_id = 110);

-- 2. 부서명이 'IT'인 부서에 근무하는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE department_id IN (SELECT department_id
                           FROM departments
                          WHERE department_name = 'IT');

-- 3. 가장 높은 연봉를 받는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE salary = (SELECT MAX(salary)
                   FROM employees);

-- 4. 평균 연봉 미만인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE salary < (SELECT AVG(salary)
                   FROM employees);

-- 5. 평균 근속 개월 수 이상인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE MONTHS_BETWEEN(SYSDATE, hire_date) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, hire_date))  -- MONTHS_BETWEEN(SYSDATE, hire_date) : 고용일부터 오늘까지 경과한 개월 수
                                                FROM employees);

-- 6. 'Seattle'에서 근무하는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE department_id IN (SELECT department_id
                           FROM departments
                          WHERE location_id IN (SELECT location_id
                                                  FROM locations
                                                 WHERE city = 'Seattle'));

-- 7. 가장 먼저 입사한 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE hire_date = (SELECT MIN(hire_date)
                      FROM employees);

-- 8. 부서번호가 50인 부서와 같은 국가(COUNTRY_ID)에 있는 부서 정보를 조회하시오.
SELECT department_id, department_name, manager_id, location_id
  FROM departments
 WHERE location_id IN (SELECT location_id
                         FROM locations
                        WHERE country_id IN (SELECT country_id
                                               FROM locations
                                              WHERE location_id = (SELECT location_id
                                                                     FROM departments
                                                                    WHERE department_id = 50)));

-- 9. 부서명이 'Marketing'인 부서에서 가장 높은 연봉를 받는 사람보다 더 높은 연봉를 받는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE salary > (SELECT MAX(salary)
                   FROM employees
                  WHERE department_id IN (SELECT department_id
                                            FROM departments
                                           WHERE department_name = 'Marketing'));

-- 10. 11 ~ 20번째로 입사한 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY hire_date ASC) AS rnum, employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
          FROM employees)
 WHERE rnum BETWEEN 11 AND 20;