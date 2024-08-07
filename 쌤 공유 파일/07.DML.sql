-- CHAPTER 07. DML (Data Manipulation Language)  --

-- DML이란?
--> 데이터 조작어로 테이블에 데이터를 조회,추가,수정,삭제 할때 사용하는 질의어 .
--> 테이블에서 원하는 데이터를 입력,수정,삭제 한다.

-- [ DML의 유형 ] - 세인업데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- INSERT 사용방법
--1) INSERT INTO 테이블 이름 (컬럼LIST... )
--   VALUES (값....)
--> *** INSERT INTO에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형에 맞게 써야 된다(1:1매핑)

--2) INSERT INTO 테이블 이름 
--   VALUES(값....)
--> INSERT 에 컬럼리스트를 생략시 VALUES에 입력한 값은 테이블의 컬럼 수와 순서와 자료형이 같아야 된다!

-- 나의 정보를 넣어보기
SELECT * FROM JUN_JOIN ; 

INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES ('SMHRD01','11111','조준용',SYSDATE, 37 ,'010-3568-3904','RTCHO3904@NAVER.COM') ;


-- 친구의 정보를 넣기
INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES ('SMHED02','00000','황해도',SYSDATE, 31, NULL, '' ) ;
--> 명시적으로 NULL값을 입력한다.


-- 친구의 정보를 넣기(2)
INSERT INTO JUN_JOIN ( ID,PW,NAME,JOIN_DATE,AGE )
VALUES('SMHRD03','11111','선영표',SYSDATE,21 ) ;
--> 암시적으로 NULL값을 입력한다.

-- 친구의 정보를 넣기(3)
INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES('SMHRD04','22222','정봉균',SYSDATE,24,'010-2222-2222','BONG@NAVER.COM');

-- 테이블 생성시 에러 리스트 

-- 1. 컬럼리스트와 입력 값의 개수가 다른 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL 오류: ORA-00913: too many values 
--> 컬럼 리스트의 갯수와 입력 값 개수는 일치해야 한다!

-- 2. 식별자에 NULL을 입력한 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 (식별자는 NOT NULL + UNIQUE 중복불가)

-- 3. NOT NULL인 컬럼에 NULL을 넣은 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 ( NOT NULL 조건 )

-- 4. 자료형에 맞지 않게 입력 값을 넣은 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, '29살', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> 컬럼에 대한 자료형에 맞게 작성이 되야 한다. (AGE는 숫자형 자료형)

-- 5. 식별자 컬럼에 중복 값을 넣을 려는 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> 값이 들어간 상태에서 한번더 실행이 되면 식별자가 값이 중복이 되서 에러가 남

-- UPDATE : 테이블의 데이터를 변경하고 싶을때 사용
-- 사용방법
-- UPDATE 테이블 이름
-- SET 변경할 컬럼 = 데이터 
-- WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건식 ;
--> *** WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다!!!

SELECT * FROM JUN_JOIN;

UPDATE JUN_JOIN
SET AGE = 25 
WHERE NAME = '정봉균' ; 


UPDATE JUN_JOIN
SET TEL = '010-2222-3333' , EMAIL = 'HE@NAVER.COM'
WHERE NAME = '황해도' ;
-- DML에 명령문에 들어가는 조건문에 컬럼은 PK로 하는것이 원칙이다!!

-- DELETE : 데이터를 삭제할때 사용하는 명려어
-- 사용방법
-- DELETE FROM 테이블 이름
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식 ;
--> *** WHERE 조건절을 생략 할 경우 테이블의 모든 데이터가 삭제가 된다!!

DELETE FROM JUN_JOIN
WHERE ID = 'SMHRD03' ;

SELECT * FROM JUN_JOIN;

-- 30세 이하인 회원들의 정보를 삭제
DELETE  FROM JUN_JOIN
WHERE AGE <= 30 ; 





