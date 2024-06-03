--사원  = EMPLOYEE2
--부서 = DEPARTMENT2

/*******INSERT 실습 문제*********/
--1. 사원 번호 '223', 이름 '김영수', 주민등록번호 '850101-1234567', 이메일 'kim_ys@or.kr', 전화번호 '01012345678', 부서 코드 'D1', 직무 코드 'J4', 급여 수준 'S2', 급여 3500000, 보너스율 0.1, 매니저 ID '200', 입사일 '15/06/20', 퇴사여부 'N'.
INSERT 
INTO EMPLOYEE2 (EMP_ID, emp_name,EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, salary, bonus, manager_id,hire_date, ent_date,ent_yn)
VALUES ('223','김영수', '850101-1234567', 'kim_ys@or.kr',  '01012345678', 'D1',  'J4','S2',3500000,  0.1,  '200', TO_DATE('2015-06-20', 'YYYY-MM-DD'), NULL, 'N');

--2. 부서 코드 'D10', 부서명 '연구개발부', 지역 코드 'L6'.
INSERT 
INTO department2
VALUES ('D10','연구개발부', 'L6');
/*

오류 보고 -
SQL 오류: ORA-12899: value too large for column "KH_T"."DEPARTMENT2"."DEPT_ID" (actual: 3, maximum: 2)

컬럼의 최대 크기가 2BYTE로 영어나 숫자로 2글자까지만 가능하지만
3글자를 작성하려 했기 때문에 에러 발생
-> department2 테이블에서  "DEPT_ID" 에 해당하는 컬럼의 크기를
        2에서 3으로 늘려주거나
        VARCHAR2로 변경해서 255까지 늘려주는 방법이 존재 ->VARCHAR2 알아서 공간크기를 조정
        CHAR 의 경우 공간 크기를 조정하지 못하기 때문에 처음부터 크기를 잘 선택
*/

--UPDATE 실습
--1. 직원 사원 번호 '200'의 이메일을 'sun_di_updated@or.kr'로, 전화번호를 '01012345678'로 변경
SELECT * 
FROM EMPLOYEE2 
WHERE EMP_ID = '200';

UPDATE EMPLOYEE2
SET EMAIL = 'sun_di_updated@or.kr',
        PHONE =  '01012345678'
WHERE EMP_ID = '200';

--2. 부서 코드 'D1'에 속한 모든 직원의 급여를 10% 인상하고, 보너스율을 0.05 증가시키기
SELECT * FROM EMPLOYEE2
WHERE DEPT_CODE = 'D1';

UPDATE EMPLOYEE2
SET SALARY = SALARY * 1.10,
    BONUS = BONUS + 0.05
    WHERE DEPT_CODE = 'D1';

/****** INSERT 25 문제 정답 ******/
-- 1
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('223', '김영수', '850101-1234567', 'kim_ys@or.kr', '01012345678', 'D1', 'J4', 'S2', 3500000, 0.1, '200', TO_DATE('15/06/20', 'YY/MM/DD'), 'N');
-- 2
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D10', '연구개발부', 'L6');
-- 3
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('224', '이수진', '900101-2345678', 'lee_sj@or.kr', '01098765432', 'D2', 'J2', 'S3', 3000000, 0.15, '201', TO_DATE('16/07/01', 'YY/MM/DD'), 'N');
-- 4
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D11', '품질관리부', 'L7');

-- 5.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('225', '박민수', '750303-3456789', 'park_ms@or.kr', '01123456789', 'D3', 'J5', 'S1', 2800000, 0.05, '202', TO_DATE('17/08/15', 'YY/MM/DD'), 'N');
-- 6
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D12', '재무부', 'L8');
-- 7.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('226', '최은지', '860404-4567890', 'choi_ej@or.kr', '01056789012', 'D4', 'J3', 'S4', 4200000, 0.2, '203', TO_DATE('18/09/25', 'YY/MM/DD'), 'N');
-- 8
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D13', '홍보부', 'L9');
-- 9. 
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('227', '장영호', '950505-5678901', 'jang_yh@or.kr', '01067890123', 'D5', 'J1', 'S5', 5000000, 0.25, '204', TO_DATE('19/10/30', 'YY/MM/DD'), 'N');
-- 10
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D14', '전략기획부', 'L10');
-- 11.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('228', '윤지혜', '760606-6789012', 'yoon_jh@or.kr', '01734567890', 'D6', 'J2', 'S2', 3200000, 0.1, '205', TO_DATE('20/11/05', 'YY/MM/DD'), 'N');
-- 12
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D15', '법무부', 'L11');
-- 13.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('229', '김도현', '830707-7890123', 'kim_dh@or.kr', '01078901234', 'D7', 'J4', 'S3', 3600000, 0.15, '206', TO_DATE('21/12/10', 'YY/MM/DD'), 'N');
-- 14
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D16', '고객지원부', 'L12');
-- 15.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('230', '이성민', '910808-8901234', 'lee_sm@or.kr', '01089012345', 'D8', 'J3', 'S4', 3800000, 0.2, '207', TO_DATE('22/01/15', 'YY/MM/DD'), 'N');
-- 16
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D17', '기술혁신부', 'L13');
-- 17
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('231', '박소연', '920909-9012345', 'park_sy@or.kr', '01145678901', 'D9', 'J5', 'S1', 3000000, 0.05, '208', TO_DATE('23/02/20', 'YY/MM/DD'), 'N');
-- 18
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D18', '경영지원부', 'L14');
-- 19
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('232', '최민준', '930101-1234567', 'choi_mj@or.kr', '01012345678', 'D10', 'J2', 'S2', 3100000, 0.1, '209', TO_DATE('24/03/25', 'YY/MM/DD'), 'N');
-- 20
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D19', '정보기술부', 'L15');
-- 21
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('233', '김하늘', '940202-2345678', 'kim_hn@or.kr', '01023456789', 'D11', 'J1', 'S3', 3400000, 0.15, '210', TO_DATE('25/04/30', 'YY/MM/DD'), 'N');
-- 22
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D20', '자원관리부', 'L16');
-- 23
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('234', '박지훈', '950303-3456789', 'park_jh@or.kr', '01034567890', 'D12', 'J4', 'S4', 3700000, 0.2, '211', TO_DATE('26/05/15', 'YY/MM/DD'), 'N');
-- 24
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_TITLE, LOCATION_ID) 
VALUES ('D21', '연구소', 'L17');
-- 25
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE, ENT_YN) 
VALUES ('235', '최수민', '960404-4567890', 'choi_sm@or.kr', '01045678901', 'D13', 'J3', 'S2', 3300000, 0.1, '212', TO_DATE('27/06/20', 'YY/MM/DD'), 'N');


/*******UPDATE 실습 문제*********/

