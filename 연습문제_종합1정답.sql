-- 1. 다음 설명을 읽고 적절한 테이블을 생성하시오.
-- 테이블 생성할 땐 기본키나 외래키를 별도로 설정하지 마시오.(5,6번 문제가 기본키, 외래키 설정 문제입니다.)

DROP TABLE order_t;
DROP TABLE customer_t;
DROP TABLE book_t;

/*
    BOOK_T 테이블
    (1) BOOK_ID   : 책번호, 숫자 (최대 11자리), 필수
    (2) BOOK_NAME : 책이름, 가변 길이 문자 (최대 100 BYTE)
    (3) PUBLISHER : 출판사, 가변 길이 문자 (최대 50 BYTE)
    (4) PRICE     : 가격, 숫자 (최대 6자리)
*/
CREATE TABLE book_t (
    book_id   NUMBER(11)         NOT NULL
  , book_name VARCHAR2(100 BYTE) NULL
  , publisher VARCHAR2(50 BYTE)  NULL
  , price     NUMBER(6)          NULL
);

/*
    CUSTOMER_T 테이블
    (1) CUST_ID   : 고객번호, 숫자 (최대 11자리), 필수
    (2) CUST_NAME : 고객명, 가변 길이 문자 (최대 20 BYTE)
    (3) CUST_ADDR : 주소, 가변 길이 문자 (최대 50 BYTE)
    (4) CUST_TEL  : 전화, 가변 길이 문자 (최대 20 BYTE)
*/
CREATE TABLE customer_t (
    cust_id   NUMBER(11)        NOT NULL
  , cust_name VARCHAR2(20 BYTE) NULL
  , cust_addr VARCHAR2(50 BYTE) NULL
  , cust_tel  VARCHAR2(20 BYTE) NULL
);

/*
    ORDER_T 테이블
    (1) ORDER_ID   : 주문번호, 가변 길이 문자 (최대 20 바이트), 필수
    (2) CUST_ID    : 고객번호, 숫자 (최대 11자리)
    (3) BOOK_ID    : 책번호, 숫자 (최대 11자리)
    (4) AMOUNT     : 판매수량, 숫자 (최대 2자리)
    (5) ORDERED_AT : 주문일, 날짜
*/
CREATE TABLE order_t (
    order_id   VARCHAR2(20 BYTE) NOT NULL
  , cust_id    NUMBER(11)        NULL
  , book_id    NUMBER(11)        NULL
  , amount     NUMBER(2)         NULL
  , ordered_at DATE              NULL
);


-- 2. 1부터 1씩 증가하는 값을 생성하는 BOOK_SEQ 시퀀스를 생성하시오. 캐시는 사용하지 말고 나머지는 기본 값을 사용하시오.
-- 아래 데이터를 BOOK_T 테이블에 INSERT하시오. 책번호는 BOOK_SEQ 시퀀스를 이용하시오.
/*
    책번호  책이름           출판사      가격
    1       축구의 역사      굿스포츠    7000
    2       축구 아는 여자   나이스북    13000
    3       축구의 이해      대한미디어  22000
    4       골프 바이블      대한미디어  35000
    5       피겨 교본        굿스포츠    6000
    6       역도 단계별 기술 굿스포츠    6000
    7       야구의 추억      이상미디어  20000
    8       야구를 부탁해    이상미디어  13000
    9       올림픽 이야기    삼성당      7500
    10      올림픽 챔피언    나이스북    13000
*/
DROP SEQUENCE book_seq;
CREATE SEQUENCE book_seq NOCACHE;
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '축구 아는 여자', '나이스북', 13000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '축구의 이해', '대한미디어', 22000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '골프 바이블', '대한미디어', 35000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '피겨 교본', '굿스포츠', 6000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '야구의 추억', '이상미디어', 20000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book_t(book_id, book_name, publisher, price) VALUES (book_seq.NEXTVAL, '올림픽 챔피언', '나이스북', 13000);
COMMIT;


-- 3. 캐시를 사용하지 않고 1000부터 1씩 증가하는 값을 생성하는 CUST_SEQ 시퀀스를 생성하시오.
-- 아래 데이터를 CUSTOMER_T 테이블에 INSERT하시오. 회원번호는 CUST_SEQ 시퀀스를 이용하시오.
/*
    회원번호 고객명   주소      전화
    1000     박지성   영국      000-000-000
    1001     김연아   대한민국  111-111-111
    1002     장미란   대한민국  222-222-222
    1003     추신수   미국      333-333-333
    1004     박세리   대한민국  NULL
*/
DROP SEQUENCE cust_seq;
CREATE SEQUENCE cust_seq
    START WITH 1000
    NOCACHE;
INSERT INTO customer_t(cust_id, cust_name, cust_addr, cust_tel) VALUES (cust_seq.NEXTVAL, '박지성', '영국', '000-000-000');
INSERT INTO customer_t(cust_id, cust_name, cust_addr, cust_tel) VALUES (cust_seq.NEXTVAL, '김연아', '대한민국', '111-111-111');
INSERT INTO customer_t(cust_id, cust_name, cust_addr, cust_tel) VALUES (cust_seq.NEXTVAL, '장미란', '대한민국', '222-222-222');
INSERT INTO customer_t(cust_id, cust_name, cust_addr, cust_tel) VALUES (cust_seq.NEXTVAL, '추신수', '미국', '333-333-333');
INSERT INTO customer_t(cust_id, cust_name, cust_addr, cust_tel) VALUES (cust_seq.NEXTVAL, '박세리', '대한민국', NULL);
COMMIT;


-- 4. 캐시를 사용하지 않고 1부터 1씩 증가하는 ORDER_SEQ 시퀀스를 생성하시오.
-- 아래 데이터를 ORDER_T 테이블에 INSERT하시오. '주문일자6자리-시퀀스' 형식으로 주문번호를 만드시오.
-- TIP.
-- 1) ORDER_SEQ 시퀀스를 이용해서 주문번호를 INSERT한다.
-- 2) 기존 주문번호를 주문일-주문번호 형식의 주문번호로 UPDATE한다.
/*
    주문번호   고객번호  책번호  판매수량 주문일자
    200701-1   1000      1       1        20/07/01
    200703-2   1000      3       2        20/07/03
    200703-3   1001      5       1        20/07/03
    200704-4   1002      6       2        20/07/04
    200705-5   1003      7       3        20/07/05
    200707-6   1000      2       5        20/07/07
    200707-7   1003      8       2        20/07/07
    200708-8   1002      10      2        20/07/08
    200709-9   1001      10      1        20/07/09
    200710-10  1002      6       4        20/07/10
*/
DROP SEQUENCE order_seq;
CREATE SEQUENCE order_seq
    NOCACHE;
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1000, 1, 1, TO_DATE('20/07/01'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1000, 3, 2, TO_DATE('20/07/03'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1001, 5, 1, TO_DATE('20/07/03'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1002, 6, 2, TO_DATE('20/07/04'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1003, 7, 3, TO_DATE('20/07/05'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1000, 2, 5, TO_DATE('20/07/07'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1003, 8, 2, TO_DATE('20/07/07'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1002, 10, 2, TO_DATE('20/07/08'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1001, 10, 1, TO_DATE('20/07/09'));
INSERT INTO order_t(order_id, cust_id, book_id, amount, ordered_at) VALUES (order_seq.NEXTVAL, 1002, 6, 4, TO_DATE('20/07/10'));
UPDATE order_t
   SET order_id = CONCAT(TO_CHAR(ordered_at, 'YYMMDD-'), order_id);
COMMIT;


-- 5. BOOK_T, CUSTOMER_T, ORDER_T 테이블의 BOOK_ID, CUST_ID, ORDER_ID 칼럼에 기본키를 추가하시오.
-- 기본키 제약조건의 이름은 PK_BOOK, PK_CUSTOMER, PK_ORDER으로 지정하시오.
ALTER TABLE book_t ADD CONSTRAINT pk_book PRIMARY KEY(book_id);
ALTER TABLE customer_t ADD CONSTRAINT pk_customer PRIMARY KEY(cust_id);
ALTER TABLE order_t ADD CONSTRAINT pk_order PRIMARY KEY(order_id);


-- 6. ORDER_T 테이블의 CUST_ID, BOOK_ID 칼럼에 각각 CUSTOMER_T 테이블과 BOOK_T 테이블을 참조할 외래키를 추가하시오.
-- 외래키 제약조건의 이름은 FK_CUSTOMER_ORDER, FK_BOOK_ORDER으로 지정하시오.
-- CUST_ID나 BOOK_ID가 삭제되는 경우 이를 참조하는 ORDER_T 테이블의 정보는 NULL로 처리하시오.
ALTER TABLE order_t ADD CONSTRAINT fk_customer_order FOREIGN KEY(cust_id) REFERENCES customer_t(cust_id) ON DELETE SET NULL;
ALTER TABLE order_t ADD CONSTRAINT fk_book_order FOREIGN KEY(book_id) REFERENCES book_t(book_id) ON DELETE SET NULL;


-- 7. 책이름에 '올림픽'이 포함된 책 정보를 조회하시오.
-- 올림픽으로 시작 : '올림픽%'
-- 올림픽으로 끝   : '%올림픽'
-- 올림픽을 포함   : '%올림픽%'
SELECT *
  FROM book_t
 WHERE book_name LIKE '%' || '올림픽' || '%';


-- 8. 가격이 가장 비싼 책을 조회하시오.
SELECT *
  FROM book_t
 WHERE price = (SELECT MAX(price)
                  FROM book_t);

SELECT *
  FROM (SELECT RANK() OVER(ORDER BY price DESC) AS rk, book_id, book_name, publisher, price
          FROM book_t)
 WHERE rk = 1;


-- 9. '20/07/05'부터 '20/07/09' 사이에 주문된 도서 정보를 조회하시오.
-- 주문번호 책번호 책이름
-- 230705-5 7      야구의 추억
-- 230707-6 2      축구 아는 여자
-- 230707-7 8      야구를 부탁해
-- 230708-8 10     올림픽 챔피언
-- 230709-9 10     올림픽 챔피언
SELECT O.order_id AS 주문번호
     , B.book_id AS 책번호
     , B.book_name AS 책이름
  FROM book_t B INNER JOIN order_t O
    ON B.book_id = O.book_id
 WHERE O.ordered_at BETWEEN TO_DATE('20/07/05') AND TO_DATE('20/07/09')
 ORDER BY O.ordered_at ASC;


-- 10. 주문한 이력이 없는 고객의 이름을 조회하시오.
-- 고객명
-- 박세리
SELECT cust_name AS 고객명
  FROM customer_t
 WHERE cust_id NOT IN(SELECT cust_id
                        FROM order_t);

SELECT C.cust_name AS 고객명
  FROM customer_t C LEFT OUTER JOIN order_t O
    ON C.cust_id = O.cust_id
 WHERE O.order_id IS NULL;


-- 11. '20/07/04'부터 '20/07/07' 사이에 주문 받은 도서를 제외하고 나머지 모든 주문 정보를 조회하시오.
-- 구매번호  구매자  책이름           총구매액 주문일자
-- 230701-1  박지성  축구의 역사      7000     20/07/01
-- 230703-2  박지성  축구의 이해      44000    20/07/03
-- 230703-3  김연아  피겨 교본        6000     20/07/03
-- 230710-10 장미란  역도 단계별 기술 24000    20/07/10
-- 230709-9  김연아  올림픽 챔피언    13000    20/07/09
-- 230708-8  장미란  올림픽 챔피언    26000    20/07/08
SELECT O.order_id  AS 구매번호
     , C.cust_name AS 구매자
     , B.book_name AS 책이름
     , B.price * O.amount AS 총구매액
     , O.ordered_at AS 주문일자
  FROM book_t B INNER JOIN order_t O
    ON B.book_id = O.book_id INNER JOIN customer_t C
    ON C.cust_id = O.cust_id
 WHERE O.ordered_at NOT BETWEEN TO_DATE('20/07/04') AND TO_DATE('20/07/07');


-- 12. 가장 최근에 구매한 고객의 이름, 책이름, 주문일자를 조회하시오.
-- 고객명  책이름            주문일자
-- 장미란  역도 단계별 기술  20/07/10
SELECT C.cust_name AS 고객명
     , B.book_name AS 책이름
     , O.ordered_at AS 주문일자
  FROM book_t B INNER JOIN order_t O
    ON B.book_id = O.book_id INNER JOIN customer_t C
    ON C.cust_id = O.cust_id
 WHERE O.ordered_at = (SELECT MAX(ordered_at)
                       FROM order_t);


-- 13. 주문된 적이 없는 책의 주문번호, 책번호, 책이름을 조회하시오.
-- 주문번호 책번호 책이름
-- NULL     4      골프 바이블
-- NULL     9      올림픽 이야기
SELECT O.order_id AS 주문번호
     , B.book_id AS 책번호
     , B.book_name AS 책이름
  FROM book_t B LEFT OUTER JOIN order_t O
    ON B.book_id = O.book_id
 WHERE O.order_id IS NULL;


-- 14. 모든 서적 중에서 가장 비싼 서적을 구매한 고객이름, 책이름, 가격을 조회하시오.
-- 가장 비싼 서적을 구매한 고객이 없다면 고객 이름은 NULL로 처리하시오.
-- 고객명  책이름       책가격
-- NULL    골프 바이블  35000
SELECT C.cust_name AS 고객명
     , B.book_name AS 책이름
     , B.price AS 책가격
  FROM book_t B LEFT OUTER JOIN order_t O
    ON B.book_id = O.book_id LEFT OUTER JOIN customer_t C
    ON C.cust_id = O.cust_id
 WHERE B.price = (SELECT MAX(price)
                    FROM book_t);


-- 15. '김연아'가 구매한 도서수를 조회하시오.
-- 고객명  구매도서수
-- 김연아  2
SELECT C.cust_name AS 고객명
     , COUNT(O.order_id) AS 구매도서수  -- 주문을 몇 번 했는가?
  FROM customer_t C INNER JOIN order_t O
    ON C.cust_id = O.cust_id
 WHERE C.cust_name = '김연아'
 GROUP BY C.cust_id, C.cust_name;


-- 16. 출판사별로 판매된 책의 갯수를 조회하시오.
-- 출판사     판매된책수
-- 굿스포츠   4
-- 삼성당     0
-- 나이스북   3
-- 대한미디어 1
-- 이상미디어 2
SELECT B.publisher AS 출판사
     , COUNT(O.order_id) AS 판매된책수
  FROM book_t B LEFT OUTER JOIN order_t O
    ON B.book_id = O.book_id
 GROUP BY B.publisher;


-- 17. '박지성'이 구매한 도서를 발간한 출판사(PUBLISHER) 개수를 조회하시오.
-- 고객명  출판사수
-- 박지성  3
SELECT C.cust_name AS 고객명
     , COUNT(DISTINCT B.publisher) AS 출판사
  FROM customer_t C INNER JOIN order_t O
    ON C.cust_id = O.cust_id INNER JOIN book_t B
    ON B.book_id = O.book_id
 WHERE C.cust_name = '박지성'
 GROUP BY C.cust_id, C.cust_name;


-- 18. 모든 구매 고객의 이름과 총구매액(PRICE * AMOUNT)을 조회하시오. 구매 이력이 있는 고객만 조회하시오.
-- 고객명  총구매액
-- 박지성  116000
-- 김연아  19000
-- 장미란  62000
-- 추신수  86000
SELECT C.cust_name AS 고객명
     , SUM(B.price * O.amount) AS 구매액
  FROM customer_t C INNER JOIN order_t O
    ON C.cust_id = O.cust_id INNER JOIN book_t B
    ON B.book_id = O.book_id
 GROUP BY C.cust_id, C.cust_name;


-- 19. 모든 구매 고객의 이름과 총구매액(PRICE * AMOUNT)과 구매횟수를 조회하시오. 구매 이력이 없는 고객은 총구매액과 구매횟수를 0으로 조회하고, 고객번호 오름차순으로 정렬하시오.
-- 고객명  총구매액  구매횟수
-- 박지성  116000     3
-- 김연아  19000      2
-- 장미란  62000      3
-- 추신수  86000      2
-- 박세리  0          0
SELECT C.cust_name AS 고객명
     , NVL(SUM(B.price * O.amount), 0) AS 총구매액  -- NVL(SUM(B.price * O.amount), 0) : SUM(B.price * O.amount) 결과가 NULL 이면 0을 반환
     , COUNT(O.order_id) AS 구매횟수
  FROM customer_t C LEFT OUTER JOIN order_t O
    ON C.cust_id = O.cust_id LEFT OUTER JOIN book_t B
    ON B.book_id = O.book_id
 GROUP BY C.cust_id, C.cust_name
 ORDER BY C.cust_id ASC;


-- 20. 총구매액이 2~3위인 고객의 이름와 총구매액을 조회하시오.
-- 고객명  총구매액
-- 추신수  86000
-- 장미란  62000
SELECT A.cust_name AS 고객명
     , A.total AS 총구매액
  FROM (SELECT RANK() OVER(ORDER BY SUM(B.price * O.amount) DESC) AS rk
             , C.cust_name
             , SUM(B.price * O.amount) AS total
          FROM customer_t C INNER JOIN order_t O
            ON C.cust_id = O.cust_id INNER JOIN book_t B
            ON B.book_id = O.book_id
         GROUP BY C.cust_id, C.cust_name) A
 WHERE A.rk BETWEEN 2 AND 3;