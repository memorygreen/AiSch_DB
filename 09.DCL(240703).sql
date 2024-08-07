-- CHAPTER 09. DCL (Data Control Language)

-- DCL이란?
--> 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어이다.

-- [ DCL의 명령어 종류 ]
-- GRANT  : 권한을 부여하는 명령어
-- REVOKE : 권한을 회수하는 명령어
-- ROLE   : 권한을 묶어서 부여할 때 사용하는 명령어

-- 사용자란?
--> 데이터 베이스에 접속하여 데이터를 관리하는 '계정'을 사용자(USER)라고 한다.

-- [ 사용자 생성 방법 ] 
-- CREATE USER 사용자 이름
-- IDENTIFIED BY 패스워드


-- 권한부여
-- GRANT        시스템권한
-- TO           USER(사용자); 

-- 권한 회수
-- REVOKE   시스템권한
-- FROM     USER(사용자);

CREATE TABLE DCL__TEST (
    TEST NUMBER(10) 
);
--ORA-01031: insufficient privileges
--> 권한이 불충분하다!!

-- ROLE이란?
--> 여러 권한을 한 번에 부여하기 위해 사용하는 명령어다.
-- 비슷한 종류의 권한끼리 모아 놓은 ROLE 이라는 개념으로 한 번에 권한을 묶어서 부여한다.

-- ROLE의 종류
-- CONNECT  : 데이터베이스의 접속에 필요한 권한이 묶여져 있는 ROLE
-- RESOURCE : 테이블, 시퀀스, 객체 생성하는 권한이 묶여져 있는 ROLE
-- DBA      : 데이터베이스를 관리하는 대부분의 시스템 권한

-- GRANT CONNECT, RESOURCE TO USER(사용자);


-- 객체 권한이란?
--> 특정 사용자의 객체 (테이블, 시퀀스, 뷰) 등에 권한을 주는 것이다.
--> 즉 HR 소유 테이블에 DCLTEST 사용자가 SELECT 나 INSERT 등의 작업이 가능하도록 허용할 수 있게 하는 것 

-- 객체 권한을 사용하는 방법
-- GRANT 시스템 권한
-- ON 스키마.객체이름
-- TO USER(사용자)

-- 240703(4)
SELECT * FROM HR.EMPLOYEES;


UPDATE HR.EMPLOYEES
SET FIRST_NAME = '조', LAST_NAME = '준용'
WHERE EMPLOYEE_ID=100;

COMMIT;