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

INSERT INTO subject_t(subj_no, subj_name) VALUES(1, '국어');
INSERT INTO subject_t(subj_no, subj_name) VALUES(2, '영어');
INSERT INTO subject_t(subj_no, subj_name) VALUES(3, '수학');
COMMIT;

INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(1, 10101, 1);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(2, 10101, 2);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(3, 10101, 3);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(4, 10102, 1);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(5, 10102, 2);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(6, 10102, 3);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(7, 10103, 1);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(8, 10103, 2);
INSERT INTO enroll_t(enr_no, stu_no, subj_no) VALUES(9, 10103, 3);
COMMIT;

/*
  데이터 수정
  UPDATE 테이블명 SET 열이름1=값1, 열이름2=값2, ... WHERE 조건식
*/

UPDATE student_t 
   SET stu_name = '송태섭'  -- 등호(=)는 대입 연산자
 WHERE stu_no = 10103;      -- 조건절의 등호(=)는 동등 비교 연산자
COMMIT;

/*
  데이터 삭제
  DELETE FROM 테이블명 WHERE 조건절
*/

-- STUDENT_T 부모키 먼저 삭제하기 (ON DELETE SET NULL)
DELETE FROM student_t WHERE stu_no = 10101;

-- SUBJECT_T 부모키 먼저 삭제하기 (ON DELETE CASCADE)
DELETE FROM subject_t WHERE subj_no = 1;

COMMIT;