/*HAVING절 실습*/
-- 1. 부서별 급여 합계 계산, 급여합계가 500이상인 부서만 조회
---> 지금은 이런 방식 사용 X
SELECT DEPT_CODE, SUM(SALARY) AS "급여합계"
FROM EMPLOYEE
WHERE SUM(SALARY) >= 5000000
GROUP BY DEPT_CODE
ORDER BY "급여합계" DESC;
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"

-> WHRER 절에서는 집계함수(SUM,AVG,MAX,MIN,COUNT 등)를 사용할 수 없음
    집계함수는 HAVING 이나 WHERE GROUP을 다른 방식으로 사용해서 작성
*/

-- 2. 각 부서별 최대 급여 조회
SELECT DEPT_CODE, MAX(SALARY) AS "최대급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 3. 각 부서별 최소 급여 조회, 최소급여를 기준으로 오름차순으로 정렬
SELECT DEPT_CODE, MIN(SALARY) AS "최소급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY "최소급여" ASC;


-- 4. 각 부서별 보너스율 합계 조회 AS "총보너스율"
-- SUM 총 보너스율 기준으로 내림차순
SELECT BONUS, SUM(BONUS) AS "총보너스율"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 총보너스율 DESC;

-- 5. 직급별 사원 수 조회
-- COUNT 사원 수 기준으로 내림차순
SELECT DEPT_CODE,COUNT(DEPT_CODE) AS "사원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 사원수 DESC;

-- 6. 각 급여 등급별 평균 보너스율 조회
-- AVG 평균 보너스율 내림차순 정렬
SELECT SAL_LEVEL, AVG(BONUS) AS "평균보너스율"
FROM EMPLOYEE
GROUP BY sal_level
ORDER BY 평균보너스율 
DESC;

-- 7. 각 부서별 사원들의 입사일이 가장 오래된 사원 조회
-- MIN 최초입사일 오름차순 정렬
SELECT DEPT_CODE, MIN(HIRE_DATE) AS "입사일"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 입사일 ASC;

-- 8. 급여가 300만 이상인 사원들의 부서별 사원수 조회
SELECT DEPT_CODE, COUNT(DEPT_CODE) AS "사원수"
FROM EMPLOYEE
WHERE salary >= 3000000
GROUP BY DEPT_CODE
ORDER BY 사원수 ASC;

-- 9. 부서별 보너스율 0.1이상인 사원 수 조회
-- COUNT AS "보너스받은사원수"
SELECT DEPT_CODE, COUNT(*)AS "보너스받은사원수"
FROM EMPLOYEE
WHERE BONUS >= 0.1
GROUP BY DEPT_CODE
ORDER BY 보너스받은사원수 DESC;

--10. 급여가 400만원 이하인 사원들의 직급별 사원수 조회
-- COUNT AS "사원수" 내림차순
SELECT JOB_CODE, COUNT(*) AS "사원수"
FROM EMPLOYEE
WHERE SALARY <= 4000000
GROUP BY JOB_CODE
ORDER BY 사원수 DESC;

--11. 급여가 500만원 이상인 사원들의 부서별 평균 급여 조회
-- AVG AS "평균급여" 내림차순
SELECT DEPT_CODE, AVG(SALARY) AS "평균급여"
FROM EMPLOYEE
WHERE SALARY >= 5000000
GROUP BY DEPT_CODE
ORDER BY 평균급여 DESC;

-- 그룹을 세분화 하여 조회하기
-- 1. 각 부서별 사원들의 퇴사 여부를 조회하고 사원수 조회
SELECT DEPT_CODE,ENT_YN,COUNT(*) AS "사원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE,ENT_YN;

-- 각 부서별,직급별,입사일에 따른 사원수 조회
SELECT DEPT_CODE, JOB_CODE, HIRE_DATE, COUNT(*) AS "사원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE, HIRE_DATE
ORDER BY DEPT_CODE, JOB_CODE, HIRE_DATE;
-- 공채채용



--------------------------------------------------------------------------------
-- WHERE절 : 지정된 테이블에서 어떤 행만을 조회 결과로 삼을것인지 조건을 지정하는 구문
--          (테이블 내에서 특정 컬럼만 뽑아서 사용하겠다는 조건문)

-- HAVING절 : 그룹 함수로 구해 올 그룹에 대한 조건을 설정할 때 사용
--          (그룹에 대한 조건, 어떤 그룹만 조회하겠다 라는 기준이 있음)

-- 부서별 평균 급여가 3000000원 이상인 사원만 조회하고 오름차순 정렬
--> 급여가 300만원 이상인 직원들만 대상으로 각 부서의 평균 급여 계산
----> 그룹화 전에 필더링
SELECT DEPT_CODE , AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- 부서별 평균 급여가 3000000원 이상인 사원만 조회하고 오름차순 정렬
--> 모든 직원들을 대상으로 그룹화한 후, 각 부서별로 평균 급여를 계산
----> HAVING절을 이용해서 계산된 평균 급여가 300만원 이상인 부서만 필터링
------> 모든 급여를 고려해서 평균을 계산한 다음 조건에 맞는 결과만 필터링
SELECT DEPT_CODE , AVG(SALARY)
FROM EMPLOYEE
--WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > =3000000
ORDER BY DEPT_CODE;

/*
D1	3660000
D5	3630000
D6	3650000
D9	5900000

D6	3366666.66666666666666666666666666666667
D9	5900000

WHERE절의 경우 조건에 맞는 값만 가지고 온 후 보여준다면
HAVING절의 경우 모든 값을 확인하고 조건에 부합하는 그룹만 보여줌
*/
/*HAVING 실습*/
-- 1. 각 부서별 평균 급여가 400만원 이상인 부서 조회
SELECT DEPT_CODE, AVG(SALARY) AS"평균월급"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > =4000000;
--D9	5900000

-- 2. 각 부서별 직원수가 5명 이상인 부서 조회
SELECT DEPT_CODE, COUNT(*) AS "부서별 직원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 5;
-- D5	6

-- 3. 각 부서별 보너스 평균이 0.2 이상인 부서 조회
SELECT DEPT_CODE, AVG(BONUS) AS "보너스평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(BONUS) >= 0.2;

-- 4. 각 직급별 최소 급여가 300만 이하인 직급 조회
-- MIN AS"최소급여"
SELECT JOB_CODE, MIN(SALARY) AS "평균급여"
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING MIN(SALARY) <= 3000000;

-- 5. EMPLOYEE 테이블에서 
-- 부서별 70년대생의 급여 평균이 300만 이상인 부서를 조회
-- 부서코드 오름차순 정렬
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS "급여평균"
FROM EMPLOYEE
--WHERE SUBSTR(EMP_NO,1,2) BETWEEN 70 AND 79
WHERE SUBSTR(EMP_NO,1,1) = '7'
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000
ORDER BY DEPT_CODE ASC;

 /*ROLLUP CUBE*/
 -- 1. 부서별 직급별 급여 합계
 SELECT DEPT_CODE, JOB_CODE , SUM(SALARY)
 FROM EMPLOYEE
 GROUP BY ROLLUP (DEPT_CODE, JOB_CODE)
 ORDER BY DEPT_CODE;
 
 -- 2. 부서별 직급별 급여 등급별 급여 합계
 SELECT DEPT_CODE, JOB_CODE, SAL_LEVEL,SUM(SALARY)
 FROM EMPLOYEE
 GROUP BY CUBE (DEPT_CODE, JOB_CODE, sal_level)
 ORDER BY DEPT_CODE;
 
 -- 3. 부서별 직급별 급여 평균
 SELECT DEPT_CODE, JOB_CODE , AVG(SALARY)
 FROM EMPLOYEE
 GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
 ORDER BY DEPT_CODE ASC;
 
 -- 4. 부서별 직급별 직원수 
 SELECT DEPT_CODE, JOB_CODE, COUNT(*) AS "직원수"
 FROM EMPLOYEE
 GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
 ORDER BY DEPT_CODE ASC;
 
 -- 5. 부서별, 직급별, 급여 등급별 평균 급여
 SELECT DEPT_CODE, JOB_CODE, SAL_LEVEL, AVG(SALARY) AS "평균급여"
 FROM EMPLOYEE
 GROUP BY CUBE (DEPT_CODE, JOB_CODE, SAL_LEVEL)
 ORDER BY DEPT_CODE DESC;
 
 -- 6. 부서별 직급별 급여 등급별 보너스 합계
 SELECT DEPT_CODE, JOB_CODE, SAL_LEVEL, SUM(BONUS)
 FROM EMPLOYEE
 GROUP BY CUBE( DEPT_CODE, JOB_CODE, SAL_LEVEL)
 ORDER BY DEPT_CODE DESC;
