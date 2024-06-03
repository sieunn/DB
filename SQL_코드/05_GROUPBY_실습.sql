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




