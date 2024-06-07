/*
VIEW
- 논리적 가상 테이블
->  테이블 모양을 하고 있지만 실제로 값을 저장하고 있진 않음

SELECT문의 실행된 결과(RESULT SET)를 저장하는 객체 

VIEW 사용 목적
복잡한 SELECT문을 쉽게 재사용하기 위해 테이블의 진짜 모습을 감출 수 잇어서 보안상 유리

VIEW 사용시 주의사항
가상테이블(실체없음) 이기 때문에 ALTER 구문 사용 불가
VIEW 를 이용한 DML(INSERT,UPDATE,DELETE)이 사용가능한 경우도 잇지만 
제약이 많이 따르기 때문에 조회(SELECT)용도로 많이 사용

VIEW 작성법
CREATE [OR REPLACE][FORCE|NOFORCE]VIEW 뷰이름[컬럼 별칭]
AS 서브쿼리(SELECT문)
[WITH CHECK OPTION]
[WITH READ ONLY];

1) OR REPLACE
    :기존 동일한 뷰가 존재하면 이름 변경 
    없으면 새로 생성하는 옵션
    
2) FORCE|NOFORCE
    FORCE : 서브쿼리에 사용된 테이블이 존재하지 않아도 뷰 생성
    NOFORCE : (기본값) 서브쿼리에 사용된 테이블이 존재해야만 뷰 생성
    
3) 컬럼 별칭 옵션
    : 조회되는 VIEW의 컬럼명 지정
    
4) WITH CHECK OPTION
    : 옵션을 지정한 컬럼의 값을 수정 불가능하게 함

5) WITH READ ONLY
    : 뷰에 대해 SELECT만 가능하도록 지정
    
*/


-- 모든 회사를 조회하는 뷰
CREATE VIEW ALL_COMPANIES AS SELECT * FROM COMPANY;
/*
오류 보고 -
ORA-01031: insufficient privileges
-- KH_WORKBOOK 에서 뷰를 생성할 권한이 부족하다는 의미
이문제를 해결하려면 데이터베이스 관리자(DBA)나 시스템관리자한테 권한을 요청하거나
GRANT CREATE VIEW TO KH_WORKBOOK;
해서 VIEW를 생성할 권리 부여

View ALL_COMPANIES이(가) 생성되었습니다.

VIEW는 주로 테이블을 복제하거나 조합해서 테스트용 SELECT 많이 사용
SELECT문 저장하고 다시 보기용으로 많이 사용
*/

-- 가격이 1500이상인 과자를 조회하고 나중에 또 다시 볼 수 있는 뷰생성
--> VIEW ONEFIVE_SNACKS
CREATE VIEW ONEFIVE_SNACKS AS
SELECT * FROM SNACKS WHERE PRICE >= 1500;

-- 서울시 강남구에 위치한 회사를 조회하는 뷰 COMPANY_IN_GANGNAM
CREATE VIEW COMPANY_IN_GANGNAM AS 
SELECT * FROM COMPANY WHERE company_address = '서울시 강남구';













