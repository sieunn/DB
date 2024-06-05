/*
선택함수
-- 여러가지 경우에 따라 알맞은 결과를 선택하는 함수
IF, SWITCH 비슷

-- DECODE(컬럼명|계산식,조건1,결과1,조건2,결과2,...[,아무것도 만족X])
-- 컬럼명 | 계산식의 값이 일치하는 조건이 있으면
-- 해당 조건 오른쪽에 작성되 결과 반환
*/

-- 예제1)
----> EMPLOYEE 테이블에서 모든 사원의 이름, 주민번호, 성별 조회
SELECT EMP_NAME, EMP_NO,
        DECODE(SUBSTR(EMP_NO,8,1),
        '1','남자',
        '2','여자',
        '기타') AS "성별"
FROM EMPLOYEE;
/*
노옹철	861015-1356452	남자
송은희	631010-2653546	여자
*/



--예제 1)
-- EMPLOYEE 테이블에서 사번 이름 급여 구분을 조회
-- 구분 받는 급여에서 초급 중급 고급 조회
-- 급여가 500이상 고급, 300이상~500미만 중급, 300미만 초급

SELECT EMP_ID, EMP_NAME, SALARY,
    CASE
        WHEN SALARY >= 5000000 THEN '고급' -- WHEN은 IF, THEN은 SYSOUT
        WHEN SALARY >= 3000000 THEN '중급' -- WHEN은 ELSE IF, THEN은 SYSOUT
        ELSE '초급'
    END 구분 -- 표시될 컬럼명 (=AS)
FROM EMPLOYEE;















/*
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    ELSE 결과
END 

-- DECODE 계산식 | 컬럼값이 딱 떨어지는 경우 사용 가능
-- CASE   계산식 | 컬럼값을 범위로 지정 가능ㅇ
*/



















