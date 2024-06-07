/*
LOWER / UPPER INITCAP
컬럼의 문자 혹은 문자열을 소문자 대문자 첫글자만 대문자로 변환
*/

-- 사용법 LOWER : 모두 소문자로 변환해서 적용
SELECT LOWER('wELCOME tO mY wORLD')
FROM DUAL;
-- 결과: welcome to my world

-- 사용법 UPPER : 모두 대문자로 변환해서 적용
SELECT UPPER('wELCOME tO mY wORLD')
FROM DUAL;
-- 결과: WELCOME TO MY WORLD

-- 사용법 INITCAP : 첫글자만 대문자로 변환해서 적용
SELECT INITCAP('wELCOME tO mY wORLD')
FROM DUAL;
-- 결과: Welcome To My World






----------------- 문자 처리함수 CONCAT----------------------
/*
CONCAT : 컬럼의 문자 혹은 무자열을 두개 전달받아 하나로 합친 후 반환

[작성법]
CONCAT(STRING.STRING)
*/

-- 가상테이블 사용해서 확인
SELECT CONCAT('가나다라','ABCD') FROM DUAL;

SELECT '가나다라'||'ABCD' FROM DUAL;

/*******CONCAT 함수와 ||연산자 차이

CONCAT : 두개의 문자열을 결합, 두개 이상은 불가
        성 + 이름 붙일때
[작성방법] CONCAT(STRING1, STRING2)



||     : 두개 이상의 문자열 결합할 때 사용
[작성방법] STRING1 || STRING2 || STRING3 ..여러개 결합가능

*********/







