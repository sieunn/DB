/*함수 실습 코드*/

-- LENGTH 예제 --
-- 1. 직원 이름의 길이 조회 이름_길이로 작성
SELECT EMP_ID, EMP_NAME,LENGTH(EMP_NAME) AS "이름_길이"
FROM EMPLOYEE;

-- 2. 이메일 아이디의 길이 조회 이메일_길이로 작성
--> 아이디 이름 이메일 이메일길이 조회
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일_길이"
FROM EMPLOYEE;

-- 3. 전화번호 길이가 11자리인 직원 조회 
--> 아이디 이름 번호 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE LENGTH(PHONE) = 11;

-- 4. 이메일의 길이가 12자 이상인 직원 조회
--> 아이디 이름 이메일 이메일_길이
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일_길이"
FROM EMPLOYEE
WHERE LENGTH(EMAIL) >= 12;

-- 5. 부서코드가 2글자인 직원 조회
--> 아이디 이름 부서코드
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE LENGTH(DEPT_CODE) = 2;

-- 6. 전화번호에 010 이 포함된 직원 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE INSTR(PHONE, '010') >0;

-->LIKE로 변경
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '%010%';






-- SUBSTR 예제 --
-- 1. 이름의 세글자 가져오기 
--> 이름 AS 이름_석자
SELECT EMP_NAME, SUBSTR(EMP_NAME,1,3) AS "이름_석자"
FROM EMPLOYEE;

-- 2. 전화번호의 마지막 네자리 가져오기 -4사용
--> PHONE, AS 마지막_네자리
SELECT EMP_NAME, PHONE, SUBSTR(PHONE, -4) AS "마지막_네자리"
FROM EMPLOYEE
--만약 NULL값이 아닌 번호만 보길원한다면
WHERE PHONE IS NOT NULL;

-- 3. 주민등록번호의 생년월일 추출
--> 이름, EMP_NO, AS 생년월일
SELECT EMP_NAME,SUBSTR(EMP_NO,1,6) AS "생년월일"
FROM EMPLOYEE;

-- 4. 전화번호 앞 세자리 추출
--> PHONE,  AS 앞 세자리
SELECT PHONE, SUBSTR(PHONE,1,3) AS "앞 세자리"
FROM EMPLOYEE
-- MULL값 제외할것
WHERE PHONE IS NOT NULL;


-- 5. 이메일 @ 뒤에 잇는 도메인 추출
SELECT EMP_NAME, SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) AS"도메인"
FROM EMPLOYEE;








--AVG 평균
-- 모든 사원의 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE;

--올림 내림 반올림 활용해서 정수로 출려
--1.올림
SELECT CEIL(AVG(SALARY))
FROM EMPLOYEE;

--2.내림
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;

--3.반올림
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;



/**** COUNT 예제 *****/
--1. 전체 직원수 
--> AS 총 직원수
SELECT COUNT(*) AS "총직원수"
FROM EMPLOYEE;

-- 2. WHERE 사용해서 D9부서 직원 수 조회
--> AS D9 부서직원수 
SELECT COUNT(*) AS "D9 부서직원수"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- 3. WHERE절 사용해서 보너스 받은 직원 수
-- > AS 보너스받은 직원들
SELECT COUNT(*) AS "보너스 받은 직원들"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;






/************AVG 평균 구하기 실습*************/
-- 1. 전체 직원 평균 급여 조회 AS 평균급여
SELECT AVG(SALARY) AS "평균급여"
FROM EMPLOYEE;

-- 2. 부서별 평균 급여 조회 AS 부서, AS 평균급여
SELECT AVG(SALARY) AS "평균급여"
FROM EMPLOYEE;

SELECT DEPT_CODE AS "부서", AVG(SALARY) AS "평균급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;
/*
SELECT DEPT_CODE AS "부서", AVG(SALARY) AS "평균급여"
FROM EMPLOYEE;
위 처럼 사용하려면 추후 GROUP BY 를 사용해야함
*/

-- 3. D5 부서의 평균 급여 조회 AS D5부서 평균 급여
SELECT AVG(SALARY) AS "D5부서 평균 급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';








/************ REPLACE 실습 예제 ***************/
-- 1. 이메일 주소에서 모든점(.)을 하이픈(-)으로 대체
--> 사원번호, 이메일, AS 수정된이메일
SELECT EMP_ID, EMAIL, REPLACE(EMAIL,'.','-') AS "수정된이메일"
FROM EMPLOYEE;

-- 2. 주민번호에서 모든 하이픈을 빈문자열 ""로 대체
-- > 이름, 주민번호, AS 수정된번호
SELECT EMP_NAME, EMP_NO, REPLACE(EMP_NO,'-',' ') AS "수정된번호"
FROM EMPLOYEE;

-- 3. 이름에서 '김'을 KIM으로 대체
--> 이름, AS 수정된이름
SELECT EMP_NAME, REPLACE(EMP_NAME,'김','KIM') AS "수정된이름"
FROM EMPLOYEE;

-- 4. 직무코드에서 J를 JOB으로 대체
--> 사원번호, 직무코드, AS 수정된직무코드
SELECT EMP_ID, JOB_CODE, REPLACE(JOB_CODE,'J','JOB') AS "수정된 직무코드"
FROM EMPLOYEE;






















