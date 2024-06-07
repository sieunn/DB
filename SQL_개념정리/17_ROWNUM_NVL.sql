/*
ROWNUM 
쿼리의 결과 집합에서 각 행에 순차적으로 1부터 시작하는 번호를 부여
결과 집합의 크기를 제한
*/

-- 예제1 : 상위 5개의 행만 선택하는 예제
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5;

-- 정렬된 결과 집합에서 상위 5개의 행만 선택
--예제2 : 급여가 높은 상위 5명의 직원만 선택
SELECT ROWNUM, EMP_ID,EMP_NAME,SALARY
FROM (SELECT EMP_ID,EMP_NAME,SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <=5;

-- 주위할점
-- 5위 이후부터 번호매김이 하고싶어짐
SELECT EMP_ID,EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM > 5;
-- ROWNUM은 무조건 1부터 시작하기 때문에 5이후는 처음부터 나올수없는 조건
-- 랭킹

-- ROWNUM을 이용해서 월급이 가장 높은 3명을 뽑으려했지만 되지않음
SELECT ROWNUM,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE ROWNUM<=3
ORDER BY SALARY DESC;

--1. SALARY 월급을 높은 순서대로 출력한다음 제대로 월급이 가장 높은 3명이 나온것이 맞는지 확인
SELECT EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

--2. 만약 제대로 나온값이 아니라면 수정
SELECT ROWNUM,EMP_NAME,SALARY
FROM (SELECT EMP_ID,EMP_NAME,SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM<=3
ORDER BY SALARY DESC;




/*
NVL :
NULL로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
[사용법]
NVL(컬럼명,컬럼값이 NULL일때 변경할값)

NVL2 : 
NULL이 아닌 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
NULL로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
[사용법]
NVL2(컬럼명,NULL이 아닌경우 변경할 값,컬럼값이 NULL일때 변경할값)

*/
-- EMPLOYEE 테이블에서 사번 이름 전화번호 조회
-- 전화번호가 없으면 없음으로 조회
SELECT EMP_ID,EMP_NAME, NVL(PHONE,'없음') AS "전화번호"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 이름 급여 성과급(급여*보너스) 조회
-- 성과급이 없으면 0으로 표시
SELECT EMP_NAME,SALARY,NVL((SALARY*BONUS),0) AS "성과급"
FROM EMPLOYEE;


-- EMPLOYEE 테이블에서 사번 이름 전화번호 조회
-- 전화번호가 없으면 없음으로 표기
-- 전화번호 있으면 010********형식으로 변경해서 조회
SELECT EMP_ID, EMP_NAME, NVL2(PHONE,'010********','없음') AS "전화번호"
FROM EMPLOYEE;










