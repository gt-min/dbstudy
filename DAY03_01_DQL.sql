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

-- 1. 데이터 1개 조회하기
SELECT stu_no
     , stu_name
  FROM student_t
 WHERE stu_no = 10103;  -- 중복 없는 칼럼(PK, UNIQUE)의 동등 비교

-- 2. 데이터 여러 개 조회하기
SELECT enr_no
     , stu_no
     , subj_no
  FROM enroll_t
 WHERE stu_no = 10103;  -- 중복 없는 칼럼(PK, UNIQUE)이 사용되지 않는 경우

-- 3. 사이 값 조회하기
SELECT stu_no
     , stu_name
  FROM student_t
 WHERE stu_no BETWEEN 10101 AND 10103;  -- WHERE stu_no >= 10101
                                        --   AND stu_no <= 10103

-- 4. 다중 값 조회하기
SELECT stu_no
     , stu_name
  FROM student_t
 WHERE stu_no IN(10101, 10102, 10103);  -- WHERE stu_no = 10101
                                        --    OR stu_no = 10102
                                        --    OR stu_no = 10103

-- 5. NULL 조회하기
SELECT enr_no
     , stu_no
     , subj_no
  FROM enroll_t
 WHERE stu_no IS NULL;

-- 6. 와일드 카드를 이용해 조회하기
/*
  와일드 카드 (wild card)
  1. 만능 문자를 의미한다.
  2. 와일드 카드 연산자 : LIKE
  3. 종류
    1) % : 글자수에 제한이 없는 만능문자
    2) _ : 1글자로 제한이 있는 만능문자
  4. 대부분 와일드 카드와 값을 연결하는 문자열 연결 연산자(||)를 함께 사용한다.
*/
SELECT subj_no
     , subj_name
  FROM subject_t
 WHERE subj_name LIKE '%' || '어' || '%';  -- 어를 포함하는 subj_name 조회
-- WHERE subj_name LIKE '%' || '학';  -- 학으로 끝나는 subj_name 조회
-- WHERE subj_name LIKE '영' || '%';  -- 영으로 시작하는 subj_name 조회