/*
[SELECT문 정리]
5   SELECT 컬럼명, 컬럼명 AS 별칭 ..
1   FROM 테이블명
2   WHERE 컬럼명 | 함수식 비교연산자 비교값
3   GROUP BY 그룹을 묶을 컬럼명
4   HAVING 그룹함수식 비교연산자 비교값
6   ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식

-- SELECT WHERE절까지만 존재할 경우
3   SELECT 컬럼명 -> 마지막에 결과를 보여주겠다!
1   FROM 테이블명
2   WHERE 조건식


-- SELECT ORDER BY절까지만 존재 WHERE절 X
2   SELECT 컬럼명
1   FROM 테이블명
3   ORDER BY 정렬기준


-- SELECT ORDER BY절까지만 존재 WHERE절 O
3   SELECT 컬럼명
1   FROM 테이블명
2   WHERE 조건식
4   ORDER BY 정렬기준


GROUP BY 절
같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을
하나의 그룹으로 묶은 것

여러개의 값을 묶어서 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용

그룹함수는 단 한개의 결과값만 산출하기 때문에 그룹이 여러개일 경우 오류 발생
여러개의 결과값을 산출하기 위해 그룹함수가 적용된 그룹의 기준을 ORDER BY절에 기술해서 사용


*/

-- EMPLOYEE 테이블에서 부서코드, 부서별 급여 합계 조회
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

/*
SELECT DEPT_CODE, SUM(SALARY)
DEPT_CODE 부서코드와 각 부서의 급여합계를 선택

GROUP BY DEPT_CODE;
DEPT_CODE 기준으로 그룹을 생성
동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
각 그룹에 월급 합인 SUM(SALARY)를 적용해서
해당 부서의 모든 직원의 급여 합계를 계산한 것

NULL 5210000
D1	 7820000
D9	 17700000
D5	 15760000
D6	 10100000
D2	 6520000
D8	 6986240
*/

--EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수
--1. SELECT절에서 부서코드랑 보너스사원수 카운트 진행
SELECT DEPT_CODE,COUNT(*) AS "보너스받은 사원수"
--2. EMPLOYEE테이블에서 조회
FROM EMPLOYEE
--3. 보너스 받은 사람만 보자
WHERE BONUS IS NOT NULL
--4. 각 부서 기준으로 몇명 받았는지 계산해서 각 그룹에서 보너스 받은 사원수 조회
GROUP BY DEPT_CODE;
/*
NULL	1
D1	    2
D9	    1
D5	    2
D6	    1
D8	    2
맨 밑에 ORDER BY를 추가해서 부서코드 순으로 정렬

*/
SELECT DEPT_CODE,COUNT(*) AS "보너스받은 사원수"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블에서 부서코드가 D5 D6인 부서의 평균 급여조회
-- 버림(평균(급여)
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) 
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D6')
GROUP BY DEPT_CODE;

-- 여러 컬럼을 묶어서 그룹으로 지정 가능
--GROUP BY 사용시 주의할 점
-->SELECT문에 GROUP BY절을 사용할 경우
-- SELECT절에 명시한 조회 컬럼 중 그룹함수가 적용되지 않은 컬럼은
-- 모두 GROUP BY절에 작성해야함

--EMPLOYEE 테이블에서 부서별로 같은 직급인 사원의 급여합계를 조회하고
-- 부서코드 오름차순으로 정렬
SELECT DEPT_CODE, JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE;
/*
EMPLOYEE 테이블에서 부서코드(DEPT_CODE) 직급코드(JOB_CODE) 각 코드별로
급여 합계 계산해서 그룹화하고 부서코드 순서대로 정렬
D1	    J6	6440000
D1	    J7	1380000
D2	    J4	6520000
D5	    J3	3500000
D5	    J5	8460000
D5	    J7	3800000
D6	    J3	7300000
D6	    J4	2800000
D8	    J6	6986240
D9	    J1	8000000
D9	    J2	9700000
NULL	J6	2320000
NULL	J7	2890000

예를들어 KH 테이블 존재 컬럼T반 , U반 존재

T반 총학생수가 궁금, 어떤 학생수? 성별별 학생수

SELECT T반, 성별, SUM(총학생수)
FROM KH
GROUP BY T반, 성별
ORDER BY 가나다순 정렬
*/

-- 집계함수 (ROLLUP, CUBE)
-- 그룹별로 산출한 결과값의 집계를 계산하는 함수
-- GROUP BY 절에서만 작성할 수 있는 함수
-- WHERE, ORDRE, SELECT 에서 사용하지 않고 GROUP BY에서 작성

-- ROLLUP 함수 : 그룹별로 중간 집계를 처리하는 함수
-- 그룹별로 묶여진 값에 대한 중간집계와 총 집계를 계산해서 자동으로 추가하는 함수
-- 인자로 전달받은 그룹중에서 가장 먼저 지정한 그룹별 합계와 종 합계를 구하는 함수

--EMPLOYEE 테이블에서 
-- 각 부서에 소속된 직급 별 급여합
-- 부서별 급여 합
-- 전체 직원 급여 총합 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(dept_code,job_code)
ORDER BY DEPT_CODE;
/*
--> EMPLOYEE 테이블에서 DEPT_CODE와 JOB_CODE 기준으로 SALARY 합계 구함
특정그룹의 합계 전체

D1	    J6	    6440000 <- D1부서의 J6 직급 급여 합계
D1	    J7	    1380000 <- D1부서의 J7 직급 급여 합계
D1	    NULL	7820000 <- D1부서 전체의 급여 합계 (소계)
D2	    J4	    6520000 <- D2부서의 J4 직급 급여 합계
D2	    NULL	6520000 <- D2부서의 전체 급여 합계 (소계)
D5	    J3	    3500000 <- D5 부서의 J3의 직급 급여 합계
D5	    J5	    8460000 <- D5 부서의 J5의 직급 급여 합계
D5	    J7	    3800000 <- D5 부서의 J7의 직급 급여 합계
D5	    NULL	15760000 <- D5부서의 전체(J3,J5,J7) 급여 합계 (소계)
D6	    J3	    7300000 <- D6 부서의 J3의 직급 급여 합계
D6	    J4	    2800000 <- D6 부서의 J4의 직급 급여 합계
D6	    NULL	10100000<- D6부서의 전체 급여 합계 (소계)
D8	    J6	    6986240
D8	    NULL    6986240
D9	    J1	    8000000
D9	    J2	    9700000
D9	    NULL	17700000
NULL	J6	    2320000
NULL	J7	    2890000
NULL    NULL	5210000
NULL	NULL	70096240

카페 예시
빠나쁘레소 아메리카노 총 매출
         카페라떼 총 매출
         아메리카노 + 카페라떼 총 매출  
*/

-- CUBE 함수 : 그룹 별 산출한 결과를 집계하는 함수
-- 그룹으로 지정된 모든 그룹에 대한 집계와 총합계를 함수
 
--EMPLOYEE 테이블에서 
-- 각 부서마다 직급 별 급여합
-- 부서별 급여 합

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(dept_code,job_code)
ORDER BY DEPT_CODE;

/*
CUBE는 ROLLUP보다 더 포괄적인 집계 결과를 생성
CUBE는 가능한 모든 것을 조합하고 조합에 대한 결과와 총합을 계산
부서 직급 SUM(SALARY)
D1	    J6	    6440000 <- D1부서의 J6 직급 급여 합계
D1	    J7	    1380000 <- D1부서의 J7 직급 급여 합계
D1	    NULL	7820000 <- D1부서 전체의 급여 합계 (소계)
D2	    J4	    6520000 <- D2부서의 J4 직급 급여 합계
D2	    NULL	6520000 <- D2부서의 전체 급여 합계 (소계)
D5	    J3	    3500000 <- D5 부서의 J3의 직급 급여 합계
D5	    J5	    8460000 <- D5 부서의 J5의 직급 급여 합계
D5	    J7	    3800000 <- D5 부서의 J7의 직급 급여 합계
D5	    NULL	15760000 <- D5부서의 전체(J3,J5,J7) 급여 합계 (소계)
D6	    J3	    7300000 <- D6 부서의 J3의 직급 급여 합계
D6	    J4	    2800000 <- D6 부서의 J4의 직급 급여 합계
D6	    NULL	10100000<- D6부서의 전체 급여 합계 (소계)
D8	    J6	    6986240
D8	    NULL    6986240
D9	    J1	    8000000
D9	    J2	    9700000
D9	    NULL	17700000
        J1	    8000000 <- 모든 부서의 J1 직급 급여 합계
        J2	    9700000 <- 모든 부서의 J2 직급 급여 합계
        J3	    10800000<- 모든 부서의 J3 직급 급여 합계
        J4	    9320000 <- 모든 부서의 J4 직급 급여 합계
        J5	    8460000 <- 모든 부서의 J5 직급 급여 합계
        J6	    15746240 <- 모든 부서의 J6 직급 급여 합계
        J7	    8070000 <- 모든 부서의 J7 직급 급여 합계
NULL    NULL    5210000 <- 전체 데이터의 급여 합계 (총계)
NULL    NULL    70096240 <- 
*/

-- UNION INTERSECT MINUS
/*********
집합연산 (SET OPERATION)
여러개의 SELECT 결과물을 하나의 쿼리로 만드는 연산자
여러가지 조건이 있을 때 그에 해당하는 여러개의 결과값을 결합시키고 싶을 때 사용
-- 장점 : 초보자들이 사용하기 좋음 (이유:조건을 덜 생각해도됨)
-- 주의할점 : 집합연산에 사용되는 SELECT문은 SELECT절이 동일해야함

-- UNION은 OR같은 개념 --> 중복 제거
-- INTERSECT는 AND와 같은 개념
-- MINUS는 차집합 같은 개념
-- UNION ALL은 OR결과값에 AND결과값이 더해진 값 --> 중복이 제거되지 않은채로 합쳐짐

*********/

-- UNION : 여러개의 쿼리 결과를 하나로 합치는 연산자 ----
-- 중복된 영역을 제외하여 하나로 합침
-- 부서코드가 'D5' 또는 D6인 사원 이름, 부서코드 조회
--1) 부서코드가 D5 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

UNION
--1) 부서코드가 D6 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6';



-- UNION ALL : 여러개의 쿼리 결과를 하나로 합치는 연산자
-- UNION 과 차이점은 중복영역을 모두 포함

-- 부서코드가 D5 이거나 급여가 300만 초과하는 사원의
-- 이름, 부서코드, 급여 조회(중복포함)
--1) 부서코드가 D5
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL 
--1) 급여가 300만 이상
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;




-- INTERSECT : 여러개의 SELECT 한 결과에서 공통 부분만 결과로 추출
-- 부서코드가 'D5'이면서 급여가 300만원 초과하는 사원의
-- 이름 부서코드 급여 조회
-- 1)부서코드가 D5
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT 
-- 2)급여가 300만원 초과하는경우
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
--> INTERSECT 사용하지 않아도 GROUP BY, WHERE조건으로 구분지을 수 있음




-- MINUS : 선행 SELECT 결과에서 다음 SELECT 결과와 겹치는 부분을 제외한 나머지 부분만 추출
-- 부서코드D5중 급여가 300만원 초과인 직원 제외
-- 1)부서코드가 D5
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS 
-- 2)급여가 300만원 초과하는경우
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

--> INTERSECT 사용하지 않아도 GROUP BY, WHERE조건으로 구분지을 수 있음

