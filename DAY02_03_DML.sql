/*
  DML
  1. Data Manipulation Language
  2. 데이터 조작어
  3. 데이터(테이블의 행, Row)을 다루는 언어이다.
  4. 종류
    1) INSERT INTO VALUES : 삽입
    2) UPDATE SET WHERE   : 수정
    3) DELETE FROM WHERE  : 삭제
  5. 트랜잭션 처리가 필요하다.
*/
/*
  트랜잭션
  1. Transaction
  2. 데이터베이스 작업 단위를 의미한다.
    예시) BankAccount의 이체 : 출금과 입금으로 구성
  3. 트랜잭션 속성
    1) A : Atomicity,   원자성 - 작업을 분리할 수 없다. (All or Nothing)
    2) C : Consistency, 일관성 - 제약 조건의 유지 등
    3) I : Isolation,   고립성 - 다른 트랜잭션의 개입 방지
    4) D : Durability,  지속성 - 트랜잭션 결과 유지
*/
/*
  TCL
  1. Transaction Control Language
  2. 트랜잭션 처리를 위한 언어이다.
  3. 종류
    1) COMMIT   : 트랜잭션이 성공했다.
    2) ROLLBACK : 트랜잭션이 실패했다.
*/

/*
  데이터 삽입
  INSERT INTO 테이블명(열이름1, 열이름2, 열이름3, ...) VALUES(값1, 값2, 값3, ...)
  INSERT INTO 테이블명 VALUES(값1, 값2, 값3, ...)
*/

INSERT INTO student_t(stu_no, stu_name) VALUES(10101, '강백호');
INSERT INTO student_t(stu_no, stu_name) VALUES(10102, '서태웅');
INSERT INTO student_t(stu_no, stu_name) VALUES(10103, '채치수');
COMMIT;




