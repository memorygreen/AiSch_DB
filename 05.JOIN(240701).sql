-- CHAPTER 05. JOIN --
-- 240701

-- JOIN 이란?
--> 여러 테이블에서 필요한 데이터를 한 번에 가져오는 기술

-- 비등가 조인(Non EQUI JOIN)
--> 두 개의 테이블 간에서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인을 의미 ( >, >=, <, <=, BETWEEN)

-- 등가 조인(EQUI JOIN)
--> 두 개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자를 사용해서 조인을 의미 ( = )
--> 가장 많이 사용되는 조인의 형태이다.

-- [등가조인의 사용방법]
-- 3. SELECT 테이블1.컬럼이름, 테이블2.컬럼이름 --> 내가 원하는 컬럼이름.(경로)를 통해서 다 조회 가능
-- 1. FROM 테이블1, 테이블2 --> 테이블1과 테이블2를 JOIN하겠다.
-- 1. WHERE 테이블1.컬럼이름 = 테이블2.컬럼이름 ; -- 조인 조건을 기술

-- 수강생 정보 테이블과 성적표 테이블에서 학생ID, 학생이름, 과목, 성적 순으로 출력
-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. FROM절에 조인할 테이블을 ,(컴마) 기준으로 작성
-- 3. 조인 조건이 되는 특정 컬럼을 확인하여, WHERE 조건절에 '조인 조건'을 작성
-- 4. SELECT  절에 출력하고자 하는 컬럼을 .(경로) 와 함께 작성

SELECT * FROM 수강생정보;
SELECT * FROM 성적표;

SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표
 WHERE 성적표.학생ID = 성적표.학생ID;

-- 직원ID, FIRST_NAME, 부서이름 순으로 출력을 해주세요
 -- FROM 절에 별칭을 사용
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, 
       D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
 
 
-- 두번째시간

-- 직원 ID가 100인 직원의 이름, 부서명을 출력
-- 조건과 조건을 이어주는 연산자 > 논리연산자 (AND, OR)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,  D.DEPARTMENT_NAME 
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND E.EMPLOYEE_ID = 100;

-- 직원 ID가 201인 직원ID, 이름, 직업ID, 직업정보 출력
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,  E.JOB_ID , J.JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID  = J.JOB_ID 
   AND E.EMPLOYEE_ID = 201;


-- [ANSI JOIN 문법의 사용 방법]
-- 3. SELECT 내가 조회하고자 하는 컬럼 이름  --> DOT(.)를 통한 경로를 통해서 테이블의 컬럼을 조회
-- 1. FROM 테이블1 JOIN 테이블2           --> 테이블1과 테이블2를 JOIN 하겠다.
--    ON (테이블1.컬럼 = 테이블2.컬럼)      --> 조인 조건절을 작성
-- 2. WHERE 일반 조건식을 따로 선별         --> 일반 조건절을 작성

-- 직원ID가 101인 직원ID와 직원의 이름과 직원의 부서명을 출력
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID = 101;

-- 단독적으로 존재하는 컬럼은 .(경로)를 안 적어줘도 상관이 없다.
-- 하지만 현업에서는 경로를 써주는 것이 배려다.
-- 조인 조건은 대부분 PK와 FK 관계로 이루어진다. 하지만 다 그런 것은 아니다!!

-- CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
--> 카티션 곱이라고 부른다.
--> 카티션 곱 : 모든 경우의 수를 나타내는 것

-- [ CROSS JOIN 의 사용 방법 ] 
-- SELECT  조회할 컬럼 이름
-- FROM    테이블1 CROSS JOIN 테이블2

--> ON에 조인 조건절이 없으면 CROSS JOIN 이다!!

-- 직원 ID 와 부서 ID 와 부서명을 출력
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;

-- 직원 테이블의 총 행의 개수(107) * 부서테이블의 총 행의 갯수(27) ==> 2889개의 행이 나온 것
-- 카티션 곱이 발생이 되는 것이다. > 모든 경우의 수가 출력이 되는 것을 말한다.


SELECT * FROM EMPLOYEES;
-- 셀프 조인 : 같은 테이블을 조인하는 것

-- 각각의 매니저 이름의 정보를 출력
-- 직원ID, 이름, 매니저ID, 매니저이름 
SELECT A.EMPLOYEE_ID 직원ID, A.FIRST_NAME 직원이름, A.MANAGER_ID 매니저ID, B.FIRST_NAME 매니저이름
  FROM EMPLOYEES A JOIN EMPLOYEES B
  ON (A.MANAGER_ID = B.EMPLOYEE_ID)
ORDER BY A.EMPLOYEE_ID ASC;

-- 각 부서의 매니저 직원들의 부서이름, 매니저 아이디와 직원의 이름을 출력
-- 같은 값을 가지는 컬럼을 조인 조건으로 걸어줘야한다.
-- 무조건 PK와 FK 관계가 아니라 구하려는 값에 맞는 조언 조건을 걸어줘야한다는 것!

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;

-- 조건이 직원테이블에 있는 매니저 아이디가 직원테이블에 있는 직원 ID와 같은 것
-- 쌤풀이
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D JOIN EMPLOYEES E
  ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID) 
WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

-- 다른 풀이
  SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D JOIN EMPLOYEES E
  ON (D.MANAGER_ID = E.EMPLOYEE_ID)
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- OUTER JOIN : 외부조인이라고 하며, 두 개의 테이블 간의 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을 때 사용하는 조인 문법이이다.
--> 한쪽 테이블의 NULL 값도 출력하고 싶을 때 사용

-- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL 값도 포함하여 출력
--> 오라클 조인 문법 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호를 작성
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
  
-- 오라클 조인 문법으로 풀이
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+);


-- 240702 화
-- RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

-- 오라클 문법으로 풀이
SELECT  D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID;


-- FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
--16(LEFT OUTER JOIN) + 107(RIGHT OUTER) = 123 개의 행이

