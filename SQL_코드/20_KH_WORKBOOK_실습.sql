/*지금부터 만드는 것은 KH_WORKBOOK 이라는 곳에 만들 테이블 생성*/

CREATE TABLE COMPANY (
COMPANY_ID NUMBER PRIMARY KEY,
COMPANY_NAME VARCHAR2(100) NOT NULL,
COMPANY_ADDRESS VARCHAR2(55),
COMPANY_PHONE VARCHAR2(20)
);

-- COMPANY 시퀀스 생성
--방법1
CREATE SEQUENCE COMPANY_SEQ;

--방법2
CREATE SEQUENCE COMPANY_SEQ
START WITH 1 -- 시작값1
INCREMENT BY 1 -- 증가값1
NOCACHE
NOCYCLE
;

-- INSERT COMPANY 회사 추가
INSERT INTO COMPANY VALUES (COMPANY_SEQ.NEXTVAL, '헷에제과','서울시 강남구','02-1234-5678');

-- NEXTVAL 이용해서 회사 추가
INSERT INTO COMPANY VALUES (COMPANY_SEQ.NEXTVAL, '롯에제가','서울시 중구','02-2345-6789');
INSERT INTO COMPANY VALUES (COMPANY_SEQ.NEXTVAL, '올이온','서울시 용산구','02-3456-7890');

SELECT * FROM COMPANY;

CREATE TABLE SNACKS(
SNACK_ID NUMBER(10,0) PRIMARY KEY,
SNACK_NAME VARCHAR2(100) NOT NULL,
PRICE NUMBER(10,2) NOT NULL,
COMPANY_ID NUMBER(10,0), 
CONSTRAINT COMPANY FOREIGN KEY (COMPANY_ID)
REFERENCES COMPANY(COMPANY_ID) ON DELETE CASCADE
);

SELECT * FROM SNACKS;

-- SNACKS_SEQ 시퀀스생성
CREATE SEQUENCE SNACKS_SEQ
START WITH 1 -- 시작값1
INCREMENT BY 1 -- 증가값1
NOCACHE
NOCYCLE
;

-- SNACKS_SEQ NEXTVAL 이용해서 INSERT
INSERT INTO SNACKS VALUES(SNACKS_SEQ.NEXTVAL,'오에스',1500,1);
INSERT INTO SNACKS VALUES(SNACKS_SEQ.NEXTVAL,'칸조',1220,1);
INSERT INTO SNACKS VALUES(SNACKS_SEQ.NEXTVAL,'배배로',1100,2);
INSERT INTO SNACKS VALUES(SNACKS_SEQ.NEXTVAL,'조고파이',20000,2);

SELECT * FROM SNACKS;

-- 가격 1500 이상인 과자 조회
SELECT *
FROM SNACKS
WHERE price >= 1500;

-- 서울시 강남구에 위치한 회사 조회
SELECT *
FROM COMPANY
WHERE company_address LIKE '%서울시 강남구%';

-- 회사ID가 1인 과자 조회
SELECT *
FROM SNACKS
WHERE COMPANY_ID = 1;

-- 회사ID가 1 그 회사의 과자들 조회
SELECT C.COMPANY_ID, S.SNACK_NAME, S.PRICE
FROM COMPANY C
JOIN SNACKS S ON  C.COMPANY_ID = S.SNACKS_ID
WHERE C.COMPANY_ID = 1;


