create table USERS(
USER_ID NUMBER PRIMARY KEY,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PASSWORD VARCHAR2(100)NOT NULL,
CREATEDDATE DATE DEFAULT SYSDATE
);

create SEQUENCE user_seq;

INSERT INTO USERS VALUES (user_seq.nextval,'홍길동','hong@example.com','password123',sysdate);
INSERT INTO USERS VALUES (user_seq.nextval,'김철수','kim@example.com','mypassword',sysdate);
INSERT INTO USERS VALUES (user_seq.nextval,'이영희','lee@example.com','securepass',sysdate);


create table BOARD(
POST_ID NUMBER PRIMARY KEY,
USER_ID NUMBER NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT CLOB NOT NULL,
CREATEDDATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE BOARD_SEQ;

INSERT INTO BOARD VALUES (board_seq.nextval, 1, '첫번째 게시물','이것은 첫번째 게시물의 내용입니다.',SYSDATE);
INSERT INTO BOARD VALUES (board_seq.nextval, 2, '두번째 게시물','이것은 두번째 게시물의 내용입니다.',SYSDATE);
INSERT INTO BOARD VALUES (board_seq.nextval, 3, '세번째 게시물','이것은 세번째 게시물의 내용입니다.',SYSDATE);