--1. 직원 사원 번호 '200'의 이메일을 'sun_di_updated@or.kr'로, 전화번호를 '01012345678'로 변경
UPDATE employee2
SET
    emp_id = 200,
    email = 'sun_di_updated@or.kr',
    phone = '01012345678'
WHERE
    emp_id = 200;

--
--2. 부서 코드 'D1'에 속한 모든 직원의 급여를 10% 인상하고, 보너스율을 0.05 증가시키기
UPDATE employee2
SET
    salary = salary * 1.10,
    bonus = bonus + 0.05
WHERE
    dept_code = 'D1';


--3. 직무 코드 'J2'를 가진 모든 직원의 직무 코드를 'J5'로, 부서 코드를 'D3'로 변경
UPDATE employee2
SET
    job_code = 'J5',
    dept_code = 'D3'
WHERE
    job_code = 'J2';

--4. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기
UPDATE employee2
SET
    salary = salary + 1.05,
    bonus = bonus * 0.02
WHERE
    hire_date > TO_DATE('2000-01-01');

--5. 매니저 ID가 '200'인 모든 직원의 매니저 ID를 '210'으로, 부서 코드를 'D5'로 변경
UPDATE employee2
SET
    manager_id = 210,
    dept_code = 'D5'
WHERE
    manager_id = 200;

--6. 모든 직원의 이메일 도메인을 'or.kr'에서 'company.com'으로 변경하고, 전화번호 형식을 '010-xxxx-xxxx'로 변경
UPDATE employee2
SET
    email = replace(email, 'or.kr', 'company.com'),
    phone = '010-xxxx-xxxx'; -- like사용
    --phone = '010-'|| SUBSTR(PHONE,4,4)|| '-' || SUBSTR(PHONE,8);
    --phone = REGEXP_REPLACE(PHONE,'(\d{3})(\d{4})(\d{4})','1-\2-\3');
    
   
--7. 급여 수준이 'S3'인 모든 직원의 급여를 4000000으로, 직무 코드를 'J4'로 수정
UPDATE employee2
SET
    salary = 4000000,
    job_code = 'J4'
WHERE
    sal_level = 'S3';


--8. 입사일이 '1997-09-12'인 직원의 퇴사일을 '2024-09-12'로, 퇴사 여부를 'Y'로 변경
UPDATE employee2
SET
    ent_date = TO_DATE('2024-09-12'),
    ent_yn = 'Y'
WHERE
    hire_date = TO_DATE('1997-09-12');

--9. 이름이 '김영수'인 직원의 이름을 '김영호'로, 이메일을 'kim_yh@or.kr'로 변경
UPDATE employee2
SET
    emp_name = '김영호',
    email = 'kim_yh@or.kr'
WHERE
    emp_name = '김영수';

--
--10. 전화번호가 '01045686656'인 직원의 전화번호를 '01198765432'로, 이메일을 'song_jk_updated@or.kr'로 변경
UPDATE employee2
SET
    phone = '01198765432',
    email = 'song_jk_updated@or.kr'
WHERE
    phone = '01045686656';
--

--11. 보너스율이 0.1인 모든 직원의 보너스율을 0.2로, 급여를 3200000으로 변경
UPDATE employee2
SET
    bonus = 0.2,
    salary = 3200000
WHERE
    bonus = 0.1;


--12. 주민등록번호가 '861015-1356452'인 직원의 급여를 3800000으로, 부서 코드를 'D7'으로 수정
UPDATE employee2
SET
    salary = 3800000,
    dept_code = 'D7'
WHERE
    emp_no = '861015-1356452';


--13. 모든 직원의 부서 코드를 'D9'로, 직무 코드를 'J1'로 변경
UPDATE employee2
SET
    dept_code = 'D9',
    job_code = 'J1';

ROLLBACK;


--14. 부서 코드 'D5'에 속한 모든 직원의 보너스율을 0.05 증가시키고, 전화번호를 '01011112222'로 변경

--15. 직무 코드 'J3'를 가진 모든 직원의 이메일을 'updated@or.kr'로, 급여 수준을 'S5'로 변경
UPDATE employee
SET
    meial = 'updated@or.kr',
    sal_level = 'S5'
WHERE
    job_code = 'J3';

--16. 모든 직원의 입사 연도를 '2023'로, 퇴사 여부를 'N'으로 변경
UPDATE employee2
--SET HIRE_DATE = TO_DATE('2023' || TO_CHAR(HIRE_DATE,'-MM-DD')),
--ENT_YN  'N';
SET
    hire_date = '2023',
    ent_yn = 'N';

ROLLBACK;

--17. 보너스율이 0.15인 모든 직원의 보너스율을 0.25로, 급여를 4000000으로 변경
--
--18. 부서 코드 'D8'과 직무 코드 'J2'를 가진 모든 직원의 급여를 4500000으로, 전화번호를 '01022223333'으로 변경
UPDATE EMPLOYEE2
SET SALARY = 4500000,
PHONE =  '01022223333'
WHERE DEPT_CODE = 'D8'
AND JOB_CODE = 'J2';

--19. 모든 직원의 이메일 도메인을 'example.com'으로, 부서 코드를 'D10'으로 변경
UPDATE EMPLOYEE2
SET EMAIL = REPLACE(EMIAL,'or.kr','example.com'),
DEPT_CODE = 'D10';


--20. 이름이 '박민수'인 직원의 이름을 '박준수'로, 급여를 3500000으로 변경
--
--21. 부서 코드 'D3'에 속한 모든 직원의 급여를 3800000으로, 보너스율을 0.2로 수정
--
--22. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기
--
--23. 매니저 ID가 '201'인 모든 직원의 매니저 ID를 '211'으로, 부서 코드를 'D6'로 변경
--
--24. 모든 직원의 이메일 도메인을 'newcompany.com'으로, 전화번호 형식을 '011-xxxx-xxxx'로 변경
UPDATE employee2
SET
    email = replace(email, 'or.kr', 'newcompany.com'),
--SET EMAIL= SUBSTR(EMAIL,1,INSTR(EMIAL,'@')-1 || '@newcompany.com')
    phone = '011-xxxx-xxxx';


--25. 부서 코드 'D4'에 속한 모든 직원의 보너스율을 0.1 증가시키고, 전화번호를 '01033334444'로 변경
UPDATE employee2
SET
    bonus = bonus + 0.1,
    phone = '01033334444'
WHERE
    부서코드 = 'D4';