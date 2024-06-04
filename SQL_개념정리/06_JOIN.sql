/*
[JOIN]
- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
- 수행 결과는 하나의 RESULT SET으로 나옴

- 관계형 데이터베이스에서 SQL을 이용해 테이블간 관계를 맺는 방법

- 관계형 데이터베이스는 최소한의 데이터를 테이블에 담고있어
  원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서
  데이터를 읽어와야 하는 경우가 많음
  이때, 테이블간 관계를 맺기 위한 연결고리 역할이 필요한데
  두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가 됨
  
등가 조인 --> 내부조인(INNER JOIN), JOIN USING, ON, 자연조인(NATURAL JOIN)
포괄 조인 --> 왼쪽 외부 조인(LEFT OUTER), 오른쪽 외부 조인(RIGHT OUTER),전체 외부 조인(FULL OUTER)
자체 조인 --> JOIN ON
교차 조인 --> CROSS JOIN
*/

-- 서로 다른 테이블 데이터를 조회할 경우 2가지로 나눠서 조회
-- 직원번호, 직원명, 부서코드, 부서명을 조회할 때
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE;
-- 직원번호, 직원명, 부서코드는 EMPLOYEE 테이블에서 조회 가능
/*
EMP_ID,EMP_NAME,DEPT_CODE
200 	선동일	  D9
201	    송종기	  D9
202	    노옹철	  D9
*/

--부서명은 DEPARTMENT 테이블에서 조회가능
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;
/*
DEPT_ID,  DEPT_TITLE
D9	        총무부
*/

-- JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블을 한번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID);
/*
EMPLOYEE테이블과 DEPARTMENT 테이블을 조인해서
직원ID,이름,부서ID,부서명을 조회하는 쿼리

EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
200	    선동일	    D9	    D9	    총무부
201 	송종기	    D9	    D9  	총무부
202	    노옹철	    D9	    D9	    총무부


JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID);
JOIN은 단순히 테이블을 두개 붙이는 것이 아닌
기준을 삼은 테이블의 한 컬럼을 지정해 다른 테이블의 한 컬럼과 같은 행을 찾아
기준 테이블 옆에 한 행씩 붙여나가는 것
*/

--1. 내부조인 INNER JOIN
---> 연결되는 컬럼의 값이 일치하는 행들만 조인이 됨
---- (일치하는 값이 없는 행은 조인에서 제외)

-- 작성방법 ANSI, ORACLE로 나뉨

--* ANSI 표준구문
---- 구문 기준을 정할 때 정의되는 기준
---- 가장 유명한 표준 ASCII 코드
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID);


--* ORACLE 표준구문
-- FROM절에 , 로 구분해서 합칠 테이블명을 기술
---- WHERE절에 합치기에 사용할 컬럼명 명시

-- 1) 연결에 사용할 두 컬럼명이 다른 경우 --> JOIN ON 사용
---- 오라클에서는 JOIN ON을 사용하지 않고
---- WHERE 절에 = 만 사용하면 됨

-- JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블을 한번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE=DEPT_ID;


-- DEPARTMENT 테이블과 LACATION 테이블을 참조해서 부서명, 지역명 조회

-- ANSI 방식 
SELECT DEPT_TITLE AS "부서명", LOCAL_NAME AS "지역명"
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

-- ORACLE 방식
SELECT DEPT_TITLE AS "부서명", LOCAL_NAME AS "지역명"
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;


