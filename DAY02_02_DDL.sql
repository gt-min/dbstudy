/*
  DDL
  1. Data Definition Language
  2. 데이터 정의어
  3. 데이터베이스 객체(테이블, 시퀀스, 사용자 등)를 다루는 언어이다.
  4. 종류
    1) CREATE   : 생성
    2) ALTER    : 수정
    3) DROP     : 삭제 (완전 삭제)
    4) TRUNCATE : 삭제 (구조 남기고 데이터만 삭제)
  5. 트랜잭션 처리 대상이 아니다.
*/

-- 테이블 삭제
DROP TABLE customer_t;
DROP TABLE bank_t;

-- 테이블 생성
CREATE TABLE bank_t (
    bank_code VARCHAR2(20 BYTE) NOT NULL,
    bank_name VARCHAR2(30 BYTE),
    -- PK 제약조건의 이름을 pk_bank 로 지정
    CONSTRAINT pk_bank PRIMARY KEY(bank_code)
);
CREATE TABLE customer_t (
    cust_no    NUMBER            NOT NULL,
    cust_name  VARCHAR2(30 BYTE) NOT NULL,
    cust_phone VARCHAR2(30 BYTE) UNIQUE,
    cust_age   NUMBER(3)         CHECK(cust_age >= 0 AND cust_age <= 120),
                             --  CHECK(cust_age BETWEEN 0 AND 120),
    bank_code  VARCHAR2(20 BYTE),
    -- PK 제약조건의 이름을 pk_customer 로 지정
    CONSTRAINT pk_customer PRIMARY KEY(cust_no),
    -- FK 제약조건의 이름을 fk_customer_bank 로 지정
    CONSTRAINT fk_customer_bank FOREIGN KEY(bank_code) REFERENCES bank_t(bank_code)
);

/*
    테이블 수정하기
    1. 칼럼 추가하기      : ALTER TABLE 테이블명 ADD           칼럼명 데이터타입 제약조건
    2. 칼럼 수정하기      : ALTER TABLE 테이블명 MODIFY        칼럼명 데이터타입 제약조건
    3. 칼럼 삭제하기      : ALTER TABLE 테이블명 DROP COLUMN   칼럼명
    4. 칼럼 이름 바꾸기   : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼명
    5. 테이블 이름 바꾸기 : ALTER TABLE 테이블명 RENAME TO     신규테이블명
*/

-- 1. bank_t에 연락처(bank_tel) 칼럼을 추가하시오.
ALTER TABLE bank_t ADD bank_tel VARCHAR2(15 BYTE);

-- 2. bank_t의 은행명(bank_name) 칼럼을 VARCHAR2(15 BYTE)로 바꾸고 필수 제약조건을 지정하시오.
ALTER TABLE bank_t MODIFY bank_name VARCHAR2(15 BYTE) NOT NULL;

-- 3. customer_t의 나이(cust_age) 칼럼을 삭제하시오.
ALTER TABLE customer_t DROP COLUMN cust_age;

-- 4. customer_t의 연락처(cust_phone) 칼럼명을 cust_tel로 수정하시오.
ALTER TABLE customer_t RENAME COLUMN cust_phone TO cust_tel;

-- 5. customer_t에 등급(grade) 칼럼을 추가하시오. 'VIP', 'GOLD', 'SILVER', 'BRONZE' 중 하나의 값을 가지도록 설정하시오.
ALTER TABLE customer_t ADD grade VARCHAR2(6 BYTE) CHECK(grade = 'VIP' OR grade = 'GOLD' OR grade = 'SILVER' OR grade = 'BRONZE');
                                               -- CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. customer_t의 고객명(cust_name) 칼럼의 필수 제약조건을 없애시오.
ALTER TABLE customer_t MODIFY cust_name VARCHAR2(30 BYTE) NULL;

-- 7. customer_t의 테이블명을 cust_t로 수정하시오.
ALTER TABLE customer_t RENAME TO cust_t;


/*
    테이블 수정하기 - PK/FK 제약조건
    
    1. PK
        1) 추가 : ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 PRIMARY KEY(칼럼명)
        2) 삭제
            (1) ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
            (2) ALTER TABLE 테이블명 DROP PRIMARY KEY
    2. FK
        1) 추가     : ALTER TABLE 자식테이블명 ADD     CONSTRAINT 제약조건명 FOREIGN KEY(칼럼명) REFERENCES 부모테이블명(참조할칼럼명) [옵션]
        2) 삭제     : ALTER TABLE 테이블명     DROP    CONSTRAINT 제약조건명
        3) 비활성화 : ALTER TABLE 테이블명     DISABLE CONSTRAINT 제약조건명
        4) 활성화   : ALTER TABLE 테이블명     ENABLE  CONSTRAINT 제약조건명
*/

-- fk_customer_bank 제약조건을 비활성화하시오.
ALTER TABLE cust_t DISABLE CONSTRAINT fk_customer_bank;

-- fk_customer_bank 제약조건을 활성화하시오.
ALTER TABLE cust_t ENABLE CONSTRAINT fk_customer_bank;