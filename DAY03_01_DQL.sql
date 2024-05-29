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



