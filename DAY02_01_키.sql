/*
  기본키
  1. PRIMARY KEY
  2. 데이터 식별자
    1) 중복 불가 (UNIQUE)
    2) 필수      (NOT NULL)
  3. 자연키(원래 존재하는 데이터)와 인공키(인공적으로 부여한 데이터) 중 인공키를 사용하는 것이 좋다.
    * 학교의 학생들
    1) 자연키 : 이름, 생년월일, 휴대전화 등
    2) 인공키 : 학번
*/
/*
  외래키
  1. FOREIGN KEY
  2. 다른 테이블을 참조할 때 사용하는 키
  3. 중복 가능하고 NULL 값을 가질 수 있다.
  4. 참조 무결성을 가져야 한다.
    1) 참조하는 테이블의 데이터(도메인)만 가질 수 있다.
    2) 옵션
      (1) ON DELETE SET NULL : PARENT KEY 값이 삭제되면 CHILD KEY 값을 NULL 처리한다.
      (2) ON DELETE CASCADE  : PARENT KEY 값이 삭제되면 CHILD KEY 값을 가진 ROW 전체를 삭제한다.
*/
/*
  분식집 메뉴  분식집 주문내역
  (부모)       (자식)
  PK           PK FK
  M1 김밥      O1 M2 2
  M2 라면      O2 M1 3
  M3 순대      O3 M1 1
               O4 M2 2
               O5 M1 2
               O6 M3 1
               O7 M2 2
               O8 M1 2 
*/
/*
  관계
  1. 일대일
    1) 하나의 테이블로 구성해도 되는 관계
    2) 자주 사용하지 않음
  2. 일대다
    1) 부모키와 자식키를 연결하는 가장 일반적인 관계
    2) 1     :     M
       PK
       UNIQUE
    3) 반드시 부모키를 먼저 만들고 자식키를 나중에 만들어야 한다.
    4) 반드시 자식키를 먼저 지우고 부모키를 나중에 지워야 한다.
  3. 다대다
    1) 현실에서는 자주 발생하는 관계
    2) 2개의 테이블로 관계를 맺는 것이 불가능
    3) 일대다 관계 2개로 구성
    상품       상품별카테고리  카테고리
    PK           FK  FK        PK
    p1 에어컨    p1  c2        c1 주방
    p2 선풍기    p1  c3        c2 가전
    p3 세탁기    p1  c4        c3 계절
    p4 TV        p2  c2        c4 신혼
    p5 냉장고    p2  c3
*/

-- 다대다 관계 실습하기
-- 학생 - 수강신청 - 과목

-- 삭제와 생성은 역순
DROP TABLE enroll_t;
DROP TABLE subject_t;
DROP TABLE student_t;

-- 학생
CREATE TABLE student_t (
    stu_no NUMBER NOT NULL PRIMARY KEY
  , stu_name VARCHAR2(100 BYTE)
);

-- 과목
CREATE TABLE subject_t (
    subj_no NUMBER NOT NULL PRIMARY KEY
  , subj_name VARCHAR2(100 BYTE)
);

-- 수강신청
CREATE TABLE enroll_t (
    enr_no NUMBER NOT NULL PRIMARY KEY
  , stu_no NUMBER REFERENCES student_t(stu_no)
  , subj_no NUMBER REFERENCES subject_t(subj_no)
);
