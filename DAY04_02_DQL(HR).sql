-- 1. 사원 테이블에서 동일한 부서번호를 가진 사원들을 그룹화하여 각 그룹별로 몇 명의 사원이 있는지 조회하시오.
SELECT department_id
     , COUNT(*)
  FROM employees
 GROUP BY department_id;

-- 2. 사원 테이블에서 같은 직업을 가진 사원들을 그룹화하여 각 그룹별로 연봉의 평균이 얼마인지 조회하시오.
SELECT job_id
     , FLOOR(AVG(salary))  -- FLOOR(값) : 값을 내림 처리
  FROM employees
 GROUP BY job_id;

-- 3. 사원 테이블에서 전화번호 앞 3자리가 같은 사원들을 그룹화하여 각 그룹별로 연봉의 합계가 얼마인지 조회하시오.
SELECT SUBSTR(phone_number, 1, 3)  -- phone_number 의 1번째 글자부터 3글자를 의미함
     , SUM(salary)
  FROM employees
 GROUP BY SUBSTR(phone_number, 1, 3);

-- 4. 사원 테이블에서 각 부서별 사원수가 20명 이상인 부서를 조회하시오.
SELECT department_id
     , COUNT(*)
  FROM employees
 GROUP BY department_id
HAVING COUNT(*) >= 20;

-- 5. 사원 테이블에서 각 부서별 사원수를 조회하시오. 단, 부서번호가 없는 사원은 제외하시오.
SELECT department_id
     , COUNT(*)
  FROM employees
 WHERE department_id IS NOT NULL
 GROUP BY department_id;