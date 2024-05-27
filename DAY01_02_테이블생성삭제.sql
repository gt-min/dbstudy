/*
  관계형 데이터베이스
  1. 정형화된 구조를 가지고 있는 데이터베이스이다.
  2. 테이블 (표) 구조를 가진다.
*/
/*
  테이블 용어
  행      열
  Row     Column
  Record  Attribute
*/
/*
  테이블 만들기
  1. 열(Column)을 만드는 과정이다.
  2. 쿼리문
    CREATE TABLE 테이블명 (
        열이름 데이터타입 [제약조건 제약조건 ...]
      , 열이름 데이터타입 [제약조건 제약조건 ...]
      , ...
    );
*/
/*
  데이터타입
  1. NUMBER(p,s)    : 숫자
  2. CHAR(size)     : 고정 문자
  3. VARCHAR2(size) : 가변 문자 (최대 4000 BYTE)
  4. CLOB           : 길이가 긴 문자
  5. DATE           : 날짜/시간 (년월일시분초)
  6. TIMESTAMP      : 날짜/시간 (년월일시분초 마이크로초(백만분의 1초))
*/
/*
  제약조건
  1. 필수여부  :  NULL / NOT NULL
  2. 중복불가  :  UNIQUE
  3. 값의제한  :  CHECK(조건)
  4. 기본키    :  PRIMARY KEY
  5. 외래키    :  FOREIGN KEY
*/
CREATE TABLE USER_T (
    USER_NO   NUMBER
  , USER_NAME VARCHAR2(100 BYTE)
);

/*
  테이블 삭제하기
  1. 테이블을 생성한 역순으로 삭제해야 한다.
  2. 삭제 후 취소할 수 없다.
  3. 쿼리문
    DROP TABLE 테이블명;
*/
DROP TABLE USER_T;