-- CHAPTER 06.DDL ( Data Difinition Language)--

--240702 화 (1)

-- DDL이란?
-- 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

--[DDL의 명령어 종류]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP     : 테이블 같은 객체를 삭제하는 명령어

-- [테이블 생성 시 자주 사용하는 자료형]
-- VARCHAR2 (N) : 가변형 문자형, N크기만큼 입력 받음
-- NUMBER(P,S) : 숫자형 값을 P자리만큼 입력받고 S자리 만큼 소수를 입력받음
--> 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능하다!!
--> 소괄호를 생략하게 되면 최대값인 38 크기가 들어간다.
-- DATE : 현재 날짜값을 입력받는 날짜형 자료형이다.

-- 테이블 생성하기
-- 수강생정보 테이블을 확인해서 TEST_수강생정보 라는 테이블을 만들어보자
-- 수강생정보 테이블을 마우스로 드래그 한 다음에 SHIFT + F4를 누르면 테이블의 정보가 확인 가능

CREATE TABLE TEST_수강생정보 (
    학생ID VARCHAR2(9),
    학생이름 VARCHAR2(50),
    소속반 VARCHAR2(5)
);

-- 성적표 테이블을 확인해서 TEST_성적표 테이블을 만들어보자
CREATE TABLE TEST_성적표 (
    학생ID VARCHAR2(9),
    과목 VARCHAR2(30),
    성적 NUMBER
);

SELECT * FROM TEST_성적표;


-- 자:테이블 생성 실습
CREATE TABLE 테이블명_LOGIN (
     ID VARCHAR2(20),
     PW VARCHAR2(20),
     EMAIL VARCHAR2(20),
     NAME VARCHAR2(20)
);
SELECT * FROM 테이블명_LOGIN;

-- 제약조건이란?
--> 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 데이터베이스에 저장되는 데이터는 항상 정확하고 일관성이 보장이 되어야 한다.
--> 그러기 위해서 제약 조건을 지정을 해줘야 한다.
--> 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받는다.


-- [제약 조건의 종류]
-- PRIMARY KEY(PK) : 기본키, NOT NULL + UNIQUE --> NULL값 불가 + 중복 불가
-- UNIQUE KEY(UK)  : 고유키, NULL값 입력 가능 단 중복은 불가 
-- NOT NULL        : NULL값 불가능, 꼭 입력되어야 하는 데이터아더 할 때 사용하는 제약 조건
-- CHECK           : TRUE OR FALSE 로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능
-- FOREIGN KEY(FK) : 외래키, 테이블을 연결하는 키

-- 데이터 무결성이란?
--> 데이터에 결함이 없는 상태 
--> 즉 데이터가 정확하고 유효하게 유지 된 상태

-- 무결성 제약조건 종류
-- 개체 무결성(PK) : 기본키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성(FK) : 행을 입력, 수정, 삭제할 때 연관되는 다른 테이블과의 데이터가 정확하게 유지되도록 규정
--> 참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 하는 것

-- [이미 생성된 테이블에서 제약조건을 지정하기]
SELECT * FROM 테이블명_LOGIN;

-- 사용방법
-- ALTER TABLE 테이블 이름 ADD CONSTRAINT 제약조건 이름 제약조건(컬럼)
-- 테이블에 PK 제약조건 지정하기
ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT 테이블명_ID_PK PRIMARY KEY(ID);


-- 테이블이 UK 제약조건 지정하기
ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT 테이블명_EMAIL_UK UNIQUE(EMAIL);


-- 테이블에 CHECK 제약조건 지정하기
ALTER TABLE 테이블명_LOGIN ADD CONSTRAINT 테이블명_PW_CHECK CHECK(LENGTH(PW) > 3);

-- 테이블의 FK 제약조건을 지정하기
-- FK제약조건 설정하는 방법
-- ALTER TABLE 테이블 이름 ADD CONSTRAINT 제약조건이름 제약조건(컬럼)
-- REFERENCES 참조테이블(참조컬럼명); 

-- TEST_수강생정보 테이블의 학생ID 컬럼을 PK로 제약조건을 걸으세요.
ALTER TABLE TEST_수강생정보 ADD CONSTRAINT 테이블명_학생ID_PK PRIMARY KEY(학생ID);

-- 3번째 시간
-- TEST_성적표 테이블의 학생ID 컬럼을 FK로 제약조건을 걸어주기
ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생ID_FK FOREIGN KEY(학생ID)
REFERENCES TEST_수강생정보(학생ID);

-- 제약조건 변경하기
-- ALTER TABLE 테이블이름 MODIFY 컬럼 이름 바꿀 제약조건;
SELECT * FROM 테이블명_LOGIN;
ALTER TABLE 테이블명_LOGIN MODIFY NAME NOT NULL;

-- 제약조건 삭제하기
-- ALTER TABLE 테이블이름 DROP CONSTRAINT 제약조건 이름;
 ALTER TABLE 테이블명_LOGIN DROP CONSTRAINT 테이블명_PW_CHECK;
 
-- 테이블의 컬럼 추가
-- ALTER TABLE 테이블 이름 ADD 컬럼명 자료형(크기);
ALTER TABLE 테이블명_LOGIN ADD TEL VARCHAR2(10);

-- 컬럼의 자료형을 변경하기
-- ALTER TABLE 테이블 이름 MODIFY 컬럼명 바꿀자료형(길이);
ALTER TABLE 테이블명_LOGIN MODIFY TEL VARCHAR2(20);

-- 특정 컬럼을 삭제하기
-- ALTER TABLE 테이블이름 DROP COLUMN 컬럼명;
ALTER TABLE 테이블명_LOGIN DROP COLUMN TEL;

-- 테이블의 이름을 변경하기
RENAME 테이블명_LOGIN TO YOUNG_LOGIN;


-- 테이블 삭제
-- 사용방법
-- DROP TABLE 테이블이름;
DROP TABLE TEST_수강생정보;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- TEST_성적표 테이블의 학생ID라는 컬럼이 FK로 참조되고 있기 때문에 삭제가 불가능하다

-- 제약조건까지 삭제를 하는 방법
-- DROP TABLE 테이블이름 CASCADE CONSTRAINTS;
DROP TABLE TEST_수강생정보 CASCADE CONSTRAINTS;


-- TRUNCATE : 테이블의 데이터를 영구 삭제

-- 테이블을 복사하는 쿼리문
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표;
--> 테이블의 제약조건까지는 복사가 되지 않는다. (자:데이터 내용만 복사!)
--> 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문이다!

SELECT * FROM DROP_성적표;

TRUNCATE TABLE DROP_성적표;

ROLLBACK;


-- 자:실습
CREATE TABLE TB_TEST1(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트) > 5)
);

CREATE TABLE TB_TEST2(
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    --제약조건을 추가
    --CONSTRAINT 제약조건명 제약조건(컬럼)
    CONSTRAINT PK테스트_PK PRIMARY KEY(PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_PK CHECK(CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(PK테스트) REFERENCES TB_TEST1(PK테스트)
);

-- 자:최종실습
CREATE TABLE 테이블_JOIN(
    ID VARCHAR2(20) PRIMARY KEY,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);


--240703 (4)
-- VIEW(뷰) FKS?
--> 하나 이상의 테이블에서 여러 정보를 토대로 만들어지는 가상의 테이블이다.

-- 뷰 생성 방법
-- CREATE VIEW 뷰 이름
-- AS 저장할 SELECT 문장

CREATE VIEW EMP_100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMP_100;

