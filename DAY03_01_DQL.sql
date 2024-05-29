/*
  DQL
  1. Data Query Language
  2. 데이터 조회어
  3. 테이블의 데이터(테이블의 행, Row)를 조회할 때 사용한다.
  4. 어떤 값(함수 결과 등)을 조회할 때 사용한다.
  5. SELECT FROM WHERE
*/

-- 테이블의 데이터 조회
SELECT stu_no, stu_name FROM student_t;

-- 어떤 값 조회 (테이블이 필요 없을 때 사용하는 테이블 : DUAL)
SELECT sysdate FROM dual;

-- 참고) 테이블 구조 확인하기
DESCRIBE dual;

/*
SELECT 열이름1, 열이름2, ...
  FROM 테이블명
 WHERE 조건식
 GROUP BY 그룹화열1, 그룹화열2, ...
HAVING 그룹조건식
 ORDER BY 1차정렬 ASC|DESC, 2차정렬 ASC|DESC, ...
*/

-- 1. 모든 칼럼 조회하기
SELECT *           -- 모든 칼럼을 의미하는 * 는 실무 사용 금지
  FROM student_t;

-- 2. 칼럼 ALIAS(별명) 조회하기
SELECT stu_no   AS 학번
     , stu_name AS "학생 명"
  FROM student_t;

-- 3. 테이블과 칼럼 함께 조회하기
SELECT student_t.stu_no
     , student_t.stu_name
  FROM student_t;

-- 4. 테이블 ALIAS(별명) 조회하기
SELECT s.stu_no
     , s.stu_name
  FROM student_t s;  -- 테이블의 별명은 공백으로 구분해서 작성

-- 5. 칼럼의 중복을 제거한 뒤 조회하기
SELECT DISTINCT stu_no  -- DISTINCT 를 중복을 제거할 칼럼 앞에 작성
  FROM enroll_t;

/*
  주요 조건식 (WHERE 절에서 사용)
  1. 칼럼 = 값 | 칼럼 != 값 | 칼럼 > 값 | 칼럼 < 값 | 칼럼 >= 값 | 칼럼 <= 값
  2. 칼럼 BETWEEN 값1 AND 값2
  3. 칼럼 IN(값1, 값2)
  4. 칼럼 IS NULL | 칼럼 IS NOT NULL
  5. 칼럼 LIKE 값
*/
