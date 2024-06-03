-- 테이블 삭제
DROP TABLE buy_t;
DROP TABLE product_t;
DROP TABLE user_t;

-- 사용자 테이블
CREATE TABLE user_t (
    user_no      NUMBER             NOT NULL         -- 사용자번호(기본키)
  , user_id      VARCHAR2(20 BYTE)  NOT NULL UNIQUE  -- 사용자아이디
  , user_name    VARCHAR2(20 BYTE)  NULL             -- 사용자명
  , user_year    NUMBER(4)          NULL             -- 태어난년도
  , user_addr    VARCHAR2(100 BYTE) NULL             -- 주소
  , user_mobile1 VARCHAR2(3 BYTE)   NULL             -- 연락처1(010, 011 등)
  , user_mobile2 VARCHAR2(8 BYTE)   NULL             -- 연락처2(12345678, 11111111 등)
  , user_regdate DATE               NULL             -- 등록일
  , CONSTRAINT pk_user PRIMARY KEY(user_no)
);

-- 제품 테이블
CREATE TABLE product_t (
    prod_code     NUMBER            NOT NULL
  , prod_name     VARCHAR2(20 BYTE) NULL
  , prod_category VARCHAR2(20 BYTE) NULL
  , prod_price    NUMBER            NULL
  , CONSTRAINT pk_product PRIMARY KEY(prod_code)
);

-- 구매 테이블
CREATE TABLE buy_t (
    buy_no     NUMBER NOT NULL
  , user_no    NUMBER NULL
  , prod_code  NUMBER NULL
  , buy_amount NUMBER NULL
  , CONSTRAINT pk_buy PRIMARY KEY(buy_no)
  , CONSTRAINT fk_user_buy    FOREIGN KEY(user_no)   REFERENCES user_t(user_no)
  , CONSTRAINT fk_product_buy FOREIGN KEY(prod_code) REFERENCES product_t(prod_code) ON DELETE SET NULL
);

-- 사용자 시퀀스
DROP SEQUENCE user_seq;
CREATE SEQUENCE user_seq NOCACHE;

-- 제품 시퀀스
DROP SEQUENCE product_seq;
CREATE SEQUENCE product_seq NOCACHE;

-- 구매 시퀀스
DROP SEQUENCE buy_seq;
CREATE SEQUENCE buy_seq NOCACHE;

-- 사용자 테이블 데이터
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'YJS', '유재석', 1972, '서울', '010', '11111111', '08/08/08');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'KHD', '강호동', 1970, '경북', '011', '22222222', '07/07/07');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'KKJ', '김국진', 1965, '서울', '010', '33333333', '09/09/09');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'KYM', '김용만', 1967, '서울', '010', '44444444', '15/05/05');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'KJD', '김제동', 1974, '경남', NULL, NULL, '13/03/03');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'NHS', '남희석', 1971, '충남', '010', '55555555', '14/04/04');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'SDY', '신동엽', 1971, '경기', NULL, NULL, '08/10/10');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'LHJ', '이휘재', 1972, '경기', '011', '66666666', '06/04/04');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'LKK', '이경규', 1960, '경남', '011', '77777777', '04/12/12');
INSERT INTO user_t(user_no, user_id, user_name, user_year, user_addr, user_mobile1, user_mobile2, user_regdate) VALUES (user_seq.NEXTVAL, 'PSH', '박수홍', 1970, '서울', '010', '88888888', '12/05/05');

-- 제품 테이블 데이터
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '운동화', '신발', 30);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '청바지', '의류', 50);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '책', '잡화', 15);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '노트북', '전자', 1000);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '모니터', '전자', 200);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '메모리', '전자', 80);
INSERT INTO product_t(prod_code, prod_name, prod_category, prod_price) VALUES (product_seq.NEXTVAL, '벨트', '잡화', 30);

-- 구매 테이블 데이터
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 2, 1, 2);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 2, 4, 1);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 4, 5, 1);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 10, 5, 5);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 2, 2, 3);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 10, 6, 10);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 5, 3, 5);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 8, 3, 2);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 8, 2, 1);
INSERT INTO buy_t(buy_no, user_no, prod_code, buy_amount) VALUES(buy_seq.NEXTVAL, 10, 1, 2);

COMMIT;


/****************************** 문 제 ****************************************/

-- 1. 연락처1이 없는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.
SELECT user_no, user_id, user_mobile1, user_mobile2
  FROM user_t
 WHERE user_mobile1 IS NULL;


-- 2. 연락처2가 '5'로 시작하는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.
SELECT user_no, user_id, user_mobile1, user_mobile2
  FROM user_t
 WHERE user_mobile2 LIKE '5' || '%';


-- 3. 2010년 이후에 가입한 사용자의 사용자번호, 아이디, 가입일을 조회하시오.
SELECT user_no, user_id, user_regdate
  FROM user_t
 WHERE EXTRACT(YEAR FROM user_regdate) >= 2010;


-- 4. 사용자번호와 연락처1, 연락처2를 연결하여 조회하시오. 연락처가 없는 경우 NULL 대신 'None'으로 조회하시오.
SELECT user_no, NVL(CONCAT(user_mobile1, user_mobile2), 'None')
  FROM user_t;


-- 5. 지역별 사용자수를 조회하시오.
-- 주소   사용자수
-- 경북   1
-- 경남   2
-- 서울   4
-- 경기   2
-- 충남   1
SELECT user_addr AS 주소
     , COUNT(*)  AS 사용자수
  FROM user_t
 GROUP BY user_addr;


-- 6. '서울', '경기'를 제외한 지역별 사용자수를 조회하시오.
-- 주소   사용자수
-- 경북   1
-- 경남   2
-- 충남   1
SELECT user_addr AS 주소
     , COUNT(*)  AS 사용자수
  FROM user_t
 WHERE user_addr NOT IN('서울', '경기')  -- WHERE USER_ADDR != '서울' AND USER_ADDR != '경기'
 GROUP BY user_addr;
  

-- 7. 구매내역이 없는 사용자를 조회하시오.
-- 번호  아이디
-- 6     HNS
-- 1     YJS
-- 7     SDY
-- 3     KKJ
-- 9     LKK
SELECT user_no AS 번호
     , user_id AS 아이디
  FROM user_t
 WHERE user_no NOT IN(SELECT user_no
                        FROM buy_t);


-- 8. 카테고리별 구매횟수를 조회하시오.
-- 카테고리  구매횟수
-- 전자      4
-- 신발      2
-- 잡화      2
-- 의류      2
SELECT P.prod_category AS 카테고리
     , COUNT(B.buy_no) AS 구매횟수
  FROM product_t P INNER JOIN buy_t B
    ON P.prod_code = B.prod_code
 GROUP BY P.prod_category;


-- 9. 아이디별 구매횟수를 조회하시오.
-- 아이디  구매횟수
-- KHD     3
-- LHJ     2
-- KYM     1
-- KJD     1
-- PSH     3
SELECT U.user_id AS 아이디
     , COUNT(B.buy_no) AS 구매횟수
  FROM user_t U INNER JOIN buy_t B
    ON U.user_no = B.user_no
 GROUP BY U.user_id;


-- 10. 아이디별 구매횟수를 조회하시오. 구매 이력이 없는 경우 구매횟수는 0으로 조회하고 아이디의 오름차순으로 조회하시오.
-- 아이디  고객명  구매횟수
-- KHD     강호동  3
-- KJD     김제동  1
-- KKJ     김국진  0
-- KYM     김용만  1
-- LHJ     이휘재  2
-- LKK     이경규  0
-- NHS     남희석  0
-- PSH     박수홍  3
-- SDY     신동엽  0
-- YJS     유재석  0
SELECT U.user_id AS 아이디
     , U.user_name AS 고객명
     , COUNT(B.buy_no) AS 구매횟수
  FROM user_t U LEFT OUTER JOIN buy_t B
    ON U.user_no = B.user_no
 GROUP BY U.user_id, U.user_name
 ORDER BY U.user_id;


-- 11. 모든 제품의 제품명과 판매횟수를 조회하시오. 판매 이력이 없는 제품은 0으로 조회하시오.
-- 제품명  판매횟수
-- 메모리  1개
-- 운동화  2개
-- 청바지  2개
-- 노트북  1개
-- 모니터  2개
-- 책      2개
-- 벨트    0개
SELECT P.prod_name AS 제품명
     , CONCAT(COUNT(B.buy_no), '개') AS 판매횟수  -- CONCAT(COUNT(B.buy_no), '개') == COUNT(B.buy_no) || '개'
  FROM product_t P LEFT OUTER JOIN buy_t B
    ON P.prod_code = B.prod_code
 GROUP BY P.prod_code, P.prod_name;


-- 12. 카테고리가 '전자'인 제품을 구매한 고객의 구매내역을 조회하시오.
-- 고객명  제품명  구매액
-- 강호동  노트북  1000
-- 김용만  모니터  200
-- 박수홍  모니터  1000
-- 박수홍  메모리  800
SELECT U.user_name AS 고객명
     , P.prod_name AS 제품명
     , P.prod_price * B.buy_amount AS 구매액
  FROM user_t U INNER JOIN buy_t B
    ON U.user_no = B.user_no INNER JOIN product_t P
    ON P.prod_code = B.prod_code
 WHERE P.prod_category = '전자';


-- 13. 제품을 구매한 이력이 있는 고객의 아이디, 고객명, 구매횟수, 총구매액을 조회하시오.
-- 아이디  고객명  구매횟수  총구매액
-- PSH     박수홍  3         1860
-- KYM     김용만  1         200
-- KJD     김제동  1         75
-- LHJ     이휘재  2         80
-- KHD     강호동  3         1210
SELECT U.user_id AS 아이디
     , U.user_name AS 고객명
     , COUNT(B.buy_no) AS 구매횟수
     , SUM(P.prod_price * B.buy_amount) AS 총구매액
  FROM user_t U INNER JOIN buy_t B
    ON U.user_no = B.user_no INNER JOIN product_t P
    ON P.prod_code = B.prod_code
 GROUP BY U.user_id, U.user_name;


-- 14. 구매횟수가 2회 이상인 고객명과 구매횟수를 조회하시오.
-- 고객명  구매횟수
-- 박수홍  3
-- 강호동  3
-- 이휘재  2
SELECT U.user_name AS 고객명
     , COUNT(B.buy_no) AS 구매횟수
  FROM user_t U INNER JOIN buy_t B
    ON U.user_no = B.user_no
 GROUP BY U.user_no, U.user_name
HAVING COUNT(B.buy_no) >= 2;


-- 15. 어떤 고객이 어떤 제품을 구매했는지 조회하시오. 구매 이력이 없는 고객도 조회하고 아이디로 오름차순 정렬하시오.
-- 고객명   구매제품
-- 강호동   운동화
-- 강호동   청바지
-- 강호동   노트북
-- 김제동   책
-- 김국진   NULL
-- 김용만   모니터
-- 이휘재   청바지
-- 이휘재   책
-- 이경규   NULL
-- 남희석   NULL
-- 박수홍   모니터
-- 박수홍   운동화
-- 박수홍   메모리
-- 신동엽   NULL
-- 유재석   NULL
SELECT U.user_name AS 고객명
     , P.prod_name AS 구매제품
  FROM user_t U LEFT OUTER JOIN buy_t B
    ON U.user_no = B.user_no LEFT OUTER JOIN product_t P
    ON P.prod_code = B.prod_code
 ORDER BY U.user_id ASC;


-- 16. 제품 테이블에서 제품명이 '책'인 제품의 카테고리를 '서적'으로 수정하시오.
UPDATE product_t
   SET prod_category = '서적'
 WHERE prod_name = '책';
COMMIT;


-- 17. 연락처1이 '011'인 사용자의 연락처1을 모두 '010'으로 수정하시오.
UPDATE user_t
   SET user_mobile1 = '010'
 WHERE user_mobile1 = '011';
COMMIT;


-- 18. 구매번호가 가장 큰 구매내역을 삭제하시오.
DELETE
  FROM buy_t
 WHERE buy_no = (SELECT MAX(buy_no)
                   FROM buy_t);
COMMIT;


-- 19. 제품코드가 1인 제품을 삭제하시오. 삭제 이후 제품번호가 1인 제품의 구매내역이 어떻게 변하는지 조회하시오.
-- 삭제 전 구매내역
SELECT * FROM buy_t;
-- 삭제
DELETE FROM product_t WHERE prod_code = 1;
COMMIT;
-- 삭제 후 구매내역
SELECT * FROM buy_t;


-- 20. 사용자번호가 5인 사용자를 삭제하시오. 사용자번호가 5인 사용자의 구매 내역을 먼저 삭제한 뒤 진행하시오.
DELETE
  FROM buy_t
 WHERE user_no = 5;

DELETE
  FROM user_t
 WHERE user_no = 5;

COMMIT;