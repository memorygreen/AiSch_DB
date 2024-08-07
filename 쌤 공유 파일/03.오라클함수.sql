-- CHAPTER 03. 오라클함수 --

-- 함수란 (Function) 
-- > 입력 값을 넣어서 특정한 기능을 통해 결과 값을 출력

-- 사용자 정의함수 : 사용자가 필요에 의해 직접 정의한 함수
-- 내장함수 : 오라클에서 미리 만들어 놓은 함수, 필요할때마다 호출하여 사용 
--> 문자형, 숫자형, 날짜형, 형변환형, null처리함수, 조건함수 

-- 함수이름() -> 함수를 실행할때 사용하는 입력 값 : 인자 값, 매개변수 

--[ 문자형 함수 ]

-- UPPER() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

SELECT UPPER('abcde123@@') 
  FROM DUAL ;
  
-- DUAL테이블이란?
--> 오라클최고관리자(SYS) 소유의 테이블.
--> 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블이다!!

-- 직원테이블에서 직원의 FIRST_NAME, EMAIL 정보를 출력
-- FIRST_NAME은 모두 대문자로 출력, EMAIL정보는 소문자로 출력

SELECT FIRST_NAME, EMAIL
     , UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;
  
  
-- LENGTH() : 괄호 안 문자 데이터의 길이는 구하는 함수
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;
  
  
-- 직원테이블에서 직원의 FIRST_NAME과 FIRST_NAME의 길이를 출력
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;

-- 직원의 FIRST_NAME의 길이가 5인 이상의 직원들의 직원ID, 이름을 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >=5 ; 

-- SUBSTR() : 문자열을 추출하는 함수이다.
--1) SUBSTR(입력값, 시작위치, 추출길이)
--> 문자열 데이터의 시작위치부터 추출 길이만큼 출력 
--2) SUBSTR(입력값, 시작위치)
--> 추출길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력

SELECT SUBSTR('인공지능사관학교JS_B', 5, 4)
     , SUBSTR('인공지능사관학교JS_B', 1, 4)
     , SUBSTR('여러분최고에요', 4, 2)
     , SUBSTR('인공지능사관학교JS_B' ,9 )
     , SUBSTR('인공지능사관학교JS_B' ,3 )
  FROM DUAL;

-- 입사날짜를 연도, 월, 일 별로 출력 (SUBSTR)
-- 각 컬럼에는 연도, 월, 일 별로 별칭을 사용

SELECT HIRE_DATE
     , SUBSTR(HIRE_DATE, 1, 2) AS 연도
     , SUBSTR(HIRE_DATE, 4, 2) AS 월
     , SUBSTR(HIRE_DATE, 7) AS 일
  FROM EMPLOYEES;

-- REPLACE() : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1) REPLACE(문자열데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 2) REPLACE(문자열데이터, 바꾸고 싶은 문자)
--> 바꿔야 할 문자를 생략시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다.

SELECT REPLACE('인공지능#사관학교', '#', '-')
     , REPLACE('인공지능#사관학교', '#')
  FROM DUAL ;


-- 직원테이블에서 입사 날자를 출력하되
-- /(슬러시) 문자열을 -(하이픈)으로 바꿔서 출력하고
-- /(슬러시) 삭제하여 출력 해주세요.

SELECT HIRE_DATE
     , REPLACE(HIRE_DATE, '/', '-')
     , REPLACE(HIRE_DATE, '/' )
  FROM EMPLOYEES ; 
  
-- CONCAT() : 두 문자열 데이터를 합치는 함수!!
-- 인자값으로 2개만 들어갈 수 있다. 2개의 문자열만 합치는 함수이다.
-- '||' : 합성연산자 -> 합성연산자를 이용하면 문자열을 무한대로 연결이 가능하다

SELECT CONCAT('JS_B반' ,  '최고') || ' 최고입니다' || '!!'
  FROM DUAL;


-- TRIM () : 입력 받은 문자형 데이터의 양 끝의 공백을 제거해주는 함수
SELECT REPLACE(TRIM('       즐   거   운수   요    일                  '), ' ')
     , REPLACE('       즐   거   운수   요    일                  ', ' ')
  FROM DUAL;

-- [ 숫자형 함수 ]

-- ROUND() : 특정 위치에서 반올림 하는 함수
-- 1) ROUND(반올림 할 숫자, 반올림 위치)
-- 2) ROUND(반올림 할 숫자)
--> 반올림 위치 생략시 소수점 첫째 자리에서 강제로 반올림 수행

SELECT ROUND(1234.56789, 2)
     , ROUND(1234.56789)
     , ROUND(1234.56789 ,3)
  FROM DUAL ;

-- TRUNC() : 특정 위치에서 버리는 함수
-- TRUNC(버림할 숫자, 버림 위치)
SELECT TRUNC(1234.56789, 2)
     , TRUNC(1234.56789)
  FROM DUAL ;

-- MOD() : 숫자를 나눈 나머지 값을 구하는 함수
--> 홀수 , 짝수를 구분할때 유용하게 사용한다.
-- MOD(나눗셈 될 숫자, 나눌 숫자)

SELECT MOD(10,2)
     , MOD(10,3)
     , MOD(15,6)
  FROM DUAL ;
  
  
-- [ 날짜 형 함수 ]
-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력시 바로 출력이 되며, 현재 시간을 초 단위까지 출력이 가능하다.
--> 날짜형 데이터는 연산이 가능 
--> 날짜형 데이터 끼리는 연산이 불가능 하다!

SELECT SYSDATE
  FROM DUAL;
  
-- 날짜 형식 셋팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS 현재날짜
     , SYSDATE +1 AS 다음날
     , SYSDATE -1 AS 어제날짜
--     , SYSDATE + SYSDATE --> 날짜 데이터끼리는 연산이 불가능하다!!
  FROM DUAL ;

-- 날짜데이터를 활용 (실무)
SELECT SYSDATE AS 현재
     , SYSDATE +1 AS 하루더함
     , SYSDATE +1/24 AS 한시간더함
     , SYSDATE +1/24/60 AS 일분더함
     , SYSDATE +1/24/60/60 AS 일초더함
  FROM DUAL;

-- ADD_MONTHS() : 몃개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)

SELECT SYSDATE AS 현재
     , ADD_MONTHS(SYSDATE, -1) AS "1개월전"
     , ADD_MONTHS(SYSDATE, +6) AS "6개월후"
  FROM DUAL;

-- [ 형 변환 함수 ]

-- 형변환 형태의 종류
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
SELECT SALARY * '2' 
  FROM EMPLOYEES ;

-- 명시적 형변환 : 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것

-- TO_CHAR() : 날짜, 숫자 데이터를 문자 데이터로 변환 해주는 함수
-- TO_CHAR(변환 할 데이터, 출력 형태)

SELECT SALARY
     , TO_CHAR(SALARY, '$999,999')
  FROM EMPLOYEES ;
  

SELECT TO_CHAR(SYSDATE , 'YY/MM/DD/DAY')
  FROM DUAL ; 

-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환 하는 함수
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)

SELECT TO_NUMBER('1,000', '9,999') + 500 
  FROM DUAL ;
  
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환 하는 함수
-- TO_DATE(문자열 데이터, 인식 될 날짜 형태)

SELECT TO_DATE('24/06/26' , 'YYYY-MM-DD')
  FROM DUAL;


-- [ NULL 처리 함수 ]
-- NVL / NVL2 : NULL값을 대체 할 수 있는 함수
-- 1) NVL(NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID, 0)
     , NVL2(DEPARTMENT_ID, 1, 0 )
  FROM EMPLOYEES;
  
--2) NVL2(NULL인지 여부를 검사할 데이터<1>, <1>값이 NULL이 아닐경우 반환할 데이터<2>,
--        <1>이 NULL일 경우 반환 할 데이터<3> ) 


SELECT * FROM EMPLOYEES;

-- 보너스가 없는 직원들은 숫자 0으로 대체해서 출력 (NVL)
SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES;


-- 직원ID,FIRST_NAME,MANAGER_ID를 출력 ,  (NVL2)
-- 단 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표'로 출력 

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID, '직원' , '대표' )
  FROM EMPLOYEES;


-- [ 조건 함수 ]

-- DECODE () : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사대상을 비교해서 지정한 값을 반환

-- DECODE(검사대상이 될 컬럼 또는 데이터(기준)<1>, <1>의 비교 값1<2> 
--      , 일치 시 반환할 값<3> , <1>의 비교 값2, 일치 시 반환할 값,
--        일치하지 않을 때 반환 값 <마지막>)


-- 직원ID,FIRST_NAME,MANAGER_ID를 출력 ,   (DECODE)
-- 단 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표'로 출력 
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(EMPLOYEE_ID   , 100 , '사장',  101, '전무이사', 102, '상무이사', 103, '팀장'  ,'직원')
  FROM EMPLOYEES;

-- 매니저가 아이디가 NULL이면 사장
-- 직원ID가 101이면 전무이사
-- 직원ID가 102이면 상무이사
-- 직원ID가 103이면 팀장




















  

