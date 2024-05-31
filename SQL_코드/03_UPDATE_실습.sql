/*******업데이트 실습*******/

-- D1 인사관리부 -> 인사팀
UPDATE department2
SET dept_title = '인사팀'
WHERE dept_id = 'D1';


-- D3 마케팅부 -> 마케팅팀
UPDATE DEPARTMENT2
SET dept_title = '마케팅팀'
WHERE dept_id = 'D3';


-- D8 기술지원부 -> 기술지원팀
UPDATE DEPARTMENT2
SET dept_title = '기술지원팀'
WHERE dept_id = 'D8';

SELECT * FROM DEPARTMENT2;
-- 수정된 내용을 저장하길 원한다면 COMMIT
-- 저장하지 않길 원한다면 ROLLBACK
COMMIT;

--EMPLOYEE2 테이블에서 BONUS를 받지 않은 사원의 BONUS를 0.1로 변경
UPDATE EMPLOYEE2
SET bonus = null
WHERE BONUS = 0.1;

--변경후 EMP_NAME, BONUS 모두 조회
SELECT EMP_NAME, BONUS
FROM EMPLOYEE2;

ROLLBACK;

SELECT bonus from employee2;

--모든 직원의 기본급여 인상 EMPLOYEE2에서
UPDATE EMPLOYEE2
SET SALARY = SALARY * 1.1;

SELECT EMP_NAME,SALARY
FROM EMPLOYEE2;

-- D9부서의 모든 직원의 보너스율 0.4로 수정 EMPLOYEE2
UPDATE EMPLOYEE2
SET bonus = 0.4
WHERE DEPT_CODE = 'D9';

SELECT dept_code, BONUS
FROM EMPLOYEE2
WHERE dept_code = 'D9';


-- DEPT_CODE가 NULL인 직원은 D3부서로 이동
UPDATE EMPLOYEE2
SET dept_code = 'D3'
WHERE dept_code IS NULL;

SELECT DEPT_CODE
FROM EMPLOYEE2;


-- 특정입사일(2000-01-01)이후 입사한 직원의 급여 수정
--HIRE_DATE
UPDATE EMPLOYEE2
SET SALARY = SALARY +1000000
WHERE hire_date > TO_DATE('2000-01-01');


-- 1997-09-12에 입사한 직원 퇴사처리
--ENT-YN
UPDATE EMPLOYEE2
SET ENT_YN = 'Y'
WHERE hire_date = TO_DATE('1997-09-12');

SELECT * FROM EMPLOYEE2;
ROLLBACK; --업데이트 모두 취소

-- 특정 도메인 주소 변경
UPDATE EMPLOYEE2
SET EMAIL = REPLACE(EMAIL,'or.kr' , 'kh.kh');

SELECT emp_name, email from employee2;


--핸드폰번호 employee2에서 010 뒤에 - 붙여서 변경
update employee2
set phone = replace(phone, '010','010-')
where phone like '010%';
-- 행 최대 크기 12자리로 설정해줬기 때문에 에러
--> 행 최대 크기를 늘리거나 rollback으로 처리
ROLLBACK;

SELECT * from employee2;
-- 특정 입사일을 가진 직원의 입사일 변경
--hire_date 1999-09-09 입사한직원 -> 2000-01-02
update employee2
set hire_date = to_date('2000-01-01')
where hire_date = to_date('1999-09-09');

commit;

SELECT * from employee2;

update department2
set dept_title = '인사팀';

SELECT * FROM department2;

ROLLBACK;




------- UPDEAT 한번에 여러컬럼 업데이트 -------------
-- 진행하기 전 EMPLOYEE3 만들기
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

-- EMP_ID가 200인 직원의 이메일과 전화번호 업데이트
UPDATE EMPLOYEE3
SET EMAIL = 'one_sun@or.kr',
    phone = '01012345678'
where emp_id = '200';

SELECT emp_id, email, phone
from employee3
where emp_id = 200;

rollback;

-- D9부서의 모든직원의 급여 *1.1 보너스 =0.2로 변경
UPDATE EMPLOYEE3
SET SALARY = SALARY*1.1,
    BONUS = 0.2;

-- J3 직무코드를 가진 직원의 직무코드와 부서코드 변경 -> J5 D5
UPDATE EMPLOYEE3
SET job_code = 'J5',
    DEPT_CODE = 'D5'
WHERE job_code = 'J3';


-- 송은희 직원의 이름과 이메일 변경 -> 송은휘 songsong@or.kr
UPDATE EMPLOYEE3
SET EMP_NAME = '송은휘',
    EMAIL = 'songsong@or.kr'
where emp_name = '송은희';

SELECT * FROM EMPLOYEE3 WHERE emp_name='송은휘';

ROLLBACK;



-- 차태연 직원의 이름과급여 변경
--> 차태형 , 8000000
UPDATE EMPLOYEE3
SET EMP_NAME = '차태형',
SALARY = 8000000
WHERE EMP_NAME = '차태연';

-- EMPLOYEE 테이블에 해당하는 모든 직원의 이메일 도메인과 부서코드 D4로 변경
UPDATE EMPLOYEE3
SET dept_code = 'D4',
EMAIL = REPLACE(EMAIL,'or.kr','kh.kh');

SELECT * from employee3;

ROLLBACK;

/******

--employee3 전체테이블 삭제
DELETE FROM EMPLOYEE2;

-- 완전삭제 --> COMMIT
-- 되돌리기 --> ROLLBACK

COMMIT;

*******/






