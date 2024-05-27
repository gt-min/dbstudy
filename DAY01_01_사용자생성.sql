-- single-line comment
/*
  multiple-line comment
*/

/*
  쿼리문 (SQL) 실행
  1. 일부 실행 : 선택 후 Ctrl + Enter
  2. 전체 스크립트 실행 : 선택 없이 F5
*/

-- 18c 의 경우 모든 계정 이름이 C## 으로 시작해야 한다. (이 설정을 없애기)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 기존 계정 삭제
DROP USER GREEN CASCADE;

-- 새 계정 추가 (사용 계정)
CREATE USER GREEN IDENTIFIED BY 1111;

-- 새 계정에 권한 부여 (관리자 권한)
GRANT DBA TO GREEN;