-- 1. EMPLOYEES 테이블에서 JOB_ID를 조회하시오. 동일한 JOB_ID는 한 번만 출력하고 알파벳 순으로 정렬하여 조회하시오.
SELECT DISTINCT job_id
  FROM employees
 ORDER BY job_id;

-- 2. EMPLOYEES 테이블에서 DEPARTMENT_ID가 50인 사원 중에서 SALARY가 5000 이상인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE department_id = 50
   AND salary >= 5000;

-- 3. EMPLOYEES 테이블에서 FIRST_NAME이 'Steven', LAST_NAME이 'King'인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE first_name = 'Steven'
   AND last_name = 'King';

-- 4. EMPLOYEES 테이블에서 EMPLOYEE_ID가 151 ~ 200인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE employee_id BETWEEN 151 AND 200;

-- 5. EMPLOYEES 테이블에서 JOB_ID가 'IT_PROG', 'ST_MAN'인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE job_id IN('IT_PROG', 'ST_MAN');

-- 6. EMPLOYEES 테이블에서 HIRE_DATE가 2005년도인 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE TO_DATE(hire_date) BETWEEN TO_DATE('2005/01/01', 'YYYY/MM/DD') AND TO_DATE('2005/12/31', 'YYYY/MM/DD');  -- TO_DATE(문자열) : 문자열 형식의 날짜를 날짜 형식으로 변환

SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE EXTRACT(YEAR FROM hire_date) = 2005;  -- EXTRACT(YEAR FROM hire_date) : 고용일에서 년도만 추출

-- 7. EMPLOYEES 테이블에서 MANAGER_ID가 없는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE manager_id IS NULL; 

-- 8. EMPLOYEES 테이블에서 COMMISSION_PCT를 받는 사원들의 실제 커미션을 조회하시오. 커미션은 COMMISSION_PCT * SALARY로 계산하시오.
SELECT employee_id, first_name, last_name, commission_pct * salary AS commission
  FROM employees
 WHERE commission_pct IS NOT NULL;

-- 9. EMPLOYEES 테이블에서 FIRST_NAME이 'J'로 시작하는 사원을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 WHERE first_name LIKE 'J' || '%';

-- 10. EMPLOYEES 테이블에서 JOB_ID가 'MAN'으로 끝나는 사원들의 MANAGER_ID를 중복을 제거하여 조회하시오.
SELECT DISTINCT manager_id
  FROM employees
 WHERE job_id LIKE '%' || 'MAN';

-- 11. EMPLOYEES 테이블에서 전체 사원을 DEPARTMENT_ID의 오름차순으로 조회하되, 동일한 DEPARTMENT_ID 내에서는 HIRE_DATE의 오름차순으로 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM employees
 ORDER BY department_id ASC, TO_DATE(hire_date) ASC;

-- 12. EMPLOYEES 테이블에서 DEPARTMENT_ID가 80인 사원들을 높은 SALARY순으로 조회하시오. SALARY는 9,000처럼 천 단위 구분기호를 표기해서 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, TO_CHAR(salary, '99,999') AS salary, commission_pct, manager_id, department_id  -- TO_CHAR(salary, '99,999') : 연봉을 최대 5자리로 표시, 천 단위 구분 기호 표시
  FROM employees
 WHERE department_id = 80
 ORDER BY salary DESC;

-- 13. EMPLOYEES 테이블에서 전체 사원의 근무 개월 수를 정수로 조회하시오. 1개월 1일을 근무했다면 2개월을 근무한 것으로 처리해서 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
     , CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) || '개월' AS 근무개월수  -- CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) : 고용일부터 오늘까지 경과한 개월수를 정수로 올림 처리
  FROM employees;

-- 14. EMPLOYEES 테이블에서 PHONE_NUMBER에 따른 지역(REGION)을 조회하시오.
-- PHONE_NUMBER가 011로 시작하면 'MOBILE', 515로 시작하면 'EAST', 590으로 시작하면 'WEST', 603으로 시작하면 'SOUTH', 650으로 시작하면 'NORTH'로 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
     , DECODE(SUBSTR(phone_number, 1, 3)  -- DECODE(표현식, 결과1, 반환1, 결과2, 반환2, ...)
        , '011', 'MOBILE'
        , '515', 'EAST'
        , '590', 'WEST'
        , '603', 'SOUTH'
        , '650', 'NORTH') AS region
  FROM employees;

-- 15. EMPLOYEES 테이블에서 근무 개월 수가 240개월 이상이면 '퇴직금정산대상', 아니면 빈 문자열('')을 조회하시오.
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
     , FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) AS 근무개월수  -- FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) : 고용일부터 오늘까지 경과한 개월수를 정수로 내림 처리
     , CASE  -- CASE WHEN 조건식1 THEN 반환1 WHEN 조건식2 THEN 반환2 ... ELSE 반환N 
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date) >= 240 THEN '정산대상'
            ELSE ''
       END AS 퇴직금정산대상유무
  FROM employees;

-- 16. EMPLOYEES 테이블에서 SALARY 평균이 10000 이상인 부서의 DEPARTMENT_ID와 SALARY 평균을 조회하시오. 평균은 정수로 내림처리하시오.
SELECT department_id
     , FLOOR(AVG(salary)) AS 부서평균연봉
  FROM employees
 GROUP BY department_id
HAVING AVG(salary) >= 10000;

-- 17. EMPLOYEES 테이블에서 DEPARTMENT_ID와 JOB_ID가 모두 같은 사원들을 그룹화하여 각 그룹의 사원수를 조회하시오. DEPARTMENT_ID가 NULL인 사원은 제외하시오.
SELECT department_id, job_id
     , COUNT(*) AS 사원수
  FROM employees
 WHERE department_id IS NOT NULL
 GROUP BY department_id, job_id
 ORDER BY 사원수;

-- 18. EMPLOYEES 테이블에서 전체 사원들의 부서내 연봉 순위를 조회하시오. 
SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
     , RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS 부서내연봉순위
  FROM employees
 ORDER BY department_id ASC;

-- 19. DEPARTMENTS 테이블에서 LOCATION_ID로 그룹화하여 각 그룹의 부서수를 조회하시오. MANAGER_ID가 없는 지역은 제외하시오.
SELECT location_id
     , COUNT(*) AS 부서수
  FROM departments
 WHERE manager_id IS NOT NULL
 GROUP BY location_id;

-- 20. DEPARTMENTS 테이블에서 DEPARTMENT_NAME의 첫 2글자로 그룹화하여 각 그룹의 부서수를 조회하시오. 'IT'와 'Co'인 부서만 조회하시오.
SELECT SUBSTR(department_name, 1, 2)
     , COUNT(*) AS 부서수
  FROM departments
 WHERE SUBSTR(department_name, 1, 2) IN('IT', 'Co')
 GROUP BY SUBSTR(department_name, 1, 2);

SELECT SUBSTR(department_name, 1, 2)
     , COUNT(*) AS 부서수
  FROM departments
 WHERE department_name LIKE 'IT' || '%'
    OR department_name LIKE 'Co' || '%'
 GROUP BY SUBSTR(department_name, 1, 2);