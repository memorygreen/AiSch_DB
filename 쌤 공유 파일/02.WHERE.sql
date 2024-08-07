-- CHAPTER 02. WHERE --

SELECT * FROM EMPLOYEES;
-- SELECT   조회할 컬럼 이름
--   FROM   테이블 이름 
--  WHERE   원하는 행을 선별하기 위한 조건식 ; 

-- 직원테이블에서 직원ID가 105인 직원의 FIRST_NAME과 LAST_NAME을 출력

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- 부서테이블에서 매니저 아이디가 100인 부서이름과 부서아이디를 출력
SELECT * FROM DEPARTMENTS;

SELECT MANAGER_ID ,DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ; 
 
-- 급여를 9000을 받는 직원의 이름 , 직원아이디, 부서아이디, 급여 정보를 출력

SELECT * FROM EMPLOYEES; 

SELECT FIRST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000 ; 
 
 
-- 직원테이블에서 직원ID가 100인 직원의 JOB_ID와 급여정보를 출력
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, SALARY, EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100 ; 

-- 자료형이 숫자형 이나 날짜형 이면 산술 연산이 가능하다.

DESC EMPLOYEES ;  -- 실행 단축키 : CTRL + ENTER , F9 

-- 자료형과 리터럴
-- NUMBER : 숫자형 -> 123, 123.56789 
-- VARCHAR2 : 문자형 -> 'ABCDE'
-- DATE : 날짜형 -> '24/06/25'

-- 산술연산자 ( + , -, *, / )
SELECT SALARY * 12 AS 연봉
  FROM EMPLOYEES ;
  
  
SELECT HIRE_DATE, HIRE_DATE + 2
  FROM EMPLOYEES ;


-- 비교연산자 ( 크냐, 작냐 크거나 같냐, 작거나 같냐 )
-- A > B  : 크다, 초과
-- A >= B : 크거나 같다, 이상
-- A < B  : 작다, 미만
-- A <= B : 작거나 같다, 이하

-- 직원테이블에서 급여(SALARY)가 5000 이하인 직원의 FIRST_NAME, SALARY 정보를 출력

SELECT FIRST_NAME, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY <= 5000 ;


-- 직원테이블에서 연봉이 100000 이상인 직원의 이름과 급여와 연봉 의 정보를 출력
SELECT FIRST_NAME, SALARY, SALARY * 12
  FROM EMPLOYEES
 WHERE SALARY * 12 >= 100000 ;
 

-- 등가 비교 연산자 (같냐 아니면 같지 않냐)
-- 같다 : =
-- 같지 않다 : != , <> , ^= 
-- 같지 않다(부정비교연산자) : NOT A = B\

-- 자료형과 리터럴
-- NUMBER : 숫자형 -> 123, 123.56789 
-- VARCHAR2 : 문자형 -> 'ABCDE'
-- DATE : 날짜형 -> '24/06/25'


-- 직원테이블에서 직업아이디가 IT_PROG 가 아닌 직원의 정보를 출력
-- (FIRST_NAME, JOB_ID)
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG' ;


-- 직원테이블에서 EAMIL 정보가 SKING 인 직원의 모든 정보를 출력
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;


-- 직원테이블에서 06/03/07에 입사한 직원의 직원ID와 이름의 정보를 출력 

SELECT HIRE_DATE FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE = '06/03/07' ;

-- JOB_ID가 'ST_MAN'인 직원의 수는 몃명인가?
-- 정답>> 5

SELECT JOB_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
  WHERE JOB_ID = 'ST_MAN' ;


-- 논리 연산자 (TRUE OR FALSE)
--> 2개 이상의 조건을 이어주는 연산자

-- AND : 조건을 모두 만족하는 경우 TRUE 값 반환
-- OR  : 하나의 조건이라도 만족하는 경우 TRUE 값 반환

-- AND조건
-- TRUE AND TRUE -> TRUE
-- TRUE AND FALSE -> FALSE
-- FALSE AND TURE -> FALSE
-- FALSE AND FALSE -> FALSE 

-- OR조건
-- TRUE OR TRUE -> TRUE
-- TRUE OR FALSE -> TRUE
-- FALSE OR TRUE -> TRUE
-- FALSE OR FALSE -> FALSE


-- 논리연산자의 사용방법

-- 3. SELECT   조회하고 싶은 컬럼 이름1, 조회하고 싶은 컬럼이름N ....
-- 1. FROM     테이블 이름
-- 2. WHERE    조건1 AND/OR 조건2 AND/OR 조건3 AND/OR 조건4 .....

-- 부서ID가 90이고 급여가 5000이상인 직원의 직원ID와 이름(FIRST_NAME)을 출력
-- 총 몃명 ? >> 3
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000 ; 

-- 부서ID가 100이거나 입사일이 06년02월02일 이후에 입사한 직원은 총 몃명인가?
-- 정답  >> 
SELECT DEPARTMENT_ID, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE > '06/02/02' ;


-- 직업이 'SA_REP'이면서 급여가 10000 이상을 받는 직원은 총 몃명일까요?
-- 정답 >> 

SELECT FIRST_NAME, JOB_ID, SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID = 'SA_REP'
   AND SALARY >= 10000 ;

-- 연산자의 우선순위
-- AND > OR 

-- 부서ID가 100이거나 90인 직원중에서
-- 직원ID가 101인 직원의 직원ID, FIRST_NAME, 연봉을 출력 * 단 연봉은 AnnSal이라는 별칭 사용
-- 정답 > 1명!

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSal, department_id
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ; 

-- 우선순위에 따라서 결과값이 완전히 달라질수가 있다
-- () 소괄호를 이용하여 우선순위를 바꿔줄수 있다!!

-- NULL 관련 연산자
-- DEPARTMENT_ID = NULL 

SELECT DEPARTMENT_ID FROM EMPLOYEES; 

-- 우리 부서에 부서가 없는 직원이 총몃명이냐 그럼 그 직원의 이름을 출력해와라 !!
-- 부서아이디가 없는 직원의 이름은 ? 

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NULL ; 
 
-- NULL 관련 연산자
-- IS NULL : 데이터 값이 NULL인 값을 조회
-- IS NOT NULL : 데이터 값이 NULL이 아닌 값을 조회

-- 보너스를 받고 일하는 직원의 수는 총 몃명인가?
-- 정답 >> 35 

SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ; 


-- SQL 연산자
--> SQL에서 사용할 수 있는 연산자다 
-- IN, BETWEEN A AND B , LIKE 


-- IN 연산자 : 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용
--> = + OR 결과 값만 같은 값을 출력
--> IN 연산자는 NULL값을 제외하는 특징을 가지고 있습니다.


-- 직원테이블에서 부서ID가 30이거나 50이거나 90인 모든 직원의 정보를 출력

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 
    OR DEPARTMENT_ID IS NULL ; 
    
-- IN연산자 활용
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90,NULL) ;
 
-- 직원테이블에서 직업아이디가 AV_VP 이거나 ST_MAN인 직원의 이름과 직업아이디를 출력 (IN연산자활용)
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AV_VP', 'ST_MAN');
 
-- NOT IN : IN 뒤에 조건에 해당하지 않는 데이터를 출력
-- NOT IN에 NULL값을 넣게 되면 아예 데이터가 출력이 안된다!!
-- != + AND 

-- 직원 테이블에서 매니저 아이디가 100, 120, 121이 아닌 직원의 이름과 매니저 아이디를 출력
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 
   OR MANAGER_ID IS NULL ; 

SELECT * FROM EMPLOYEES;
-- NOT IN 활용
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100,120,121); 
 
-- BETWEEN A AND B 
--> 일정 범위 내의 데이터를 조회할 때 사용
--> BETWEEEN 최소값 AND 최대값
--> 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것

-- 직원테이블에서 급여가 10000이상 20000이하의 급여를 받는 직원의 이름과 급여 정보 출력
-- 10000 ~ 20000 

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY >= 10000 
   AND SALARY <= 20000 ; 
   
-- BETWEEN 연산자 활용

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ; 
-- 급여가 10000 이상 20000 이하인 범위내의 데이터를 출력 
 
 
-- 직원테이블에서 05년에 입사한 직원의 이름과 입사날짜를 출력 (BETWEEN 최소값 AND 최대값)
-- 05/01/01 ~ 05/12/31 

SELECT HIRE_DATE
  FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31'  ; 

-- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할때 사용하는 것
-- % , _ 라는 와일드 카드를 이용해서 매칭 연산을 진행하는 것

-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 어떤 값이든 상관 없이 한개의 문자 데이터를 의미


-- 핸드폰번호가 650으로 시작하는 직원의 핸드폰 번호 찾기
SELECT * FROM EMPLOYEES;

SELECT PHONE_NUMBER
  FROM EMPLOYEES 
 WHERE PHONE_NUMBER LIKE '650%' ;
-- 이름 : FIRST_NAME
-- 직원테이블에서 이름이 S로 시작하고 n으로 끝나는 직원의 이름 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';

-- 직원테이블에서 이름이 it으로 끝나고 총 4글자인 직원의 이름 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';

-- 직원테이블에서 이름의 두번째 글자가 e인 직원의 이름 찾기
SELECT FIRST_NAME 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '_e%';

-- 직원테이블에서 01월에 입사한 직원의 입사날짜 찾기
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%';

























 