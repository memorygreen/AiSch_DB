-- CHAPTER 10. 서브쿼리 (Sub Query)

-- SQL 작성 순서
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY 

-- *** SQL 실행 순서 ***
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

--5. SELECT      조회하고자 하는 컬럼 이름,.......
--1. FROM        조회하고자 하는 테이블 이름 
--2. WHERE       조회하고자 하는 원하는 행을 선별하기 위한 조건식 
--3. GROUP BY    특정 컬럼을 이용하여 그룹화 
--4. HAVING      그룹화된 대상에서 원하는 행을 선별하기 위한 조건식
--6. ORDER BY    특정 컬럼을 기준으로 정렬 

-- GROUP BY 복습 
-- 부서별(GROUP BY) 최고 급여를 출력

SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID ,MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 직업이 AD_PRES, IT_PROG 가 아닌 직업별(GROUP BY) 평균 연봉에서
-- 평균 연봉이 120000 이상인 직업만 출력 .

SELECT * FROM EMPLOYEES;

SELECT JOB_ID, AVG(SALARY * 12)
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('AD_PRES','IT_PROG')
 GROUP BY JOB_ID
HAVING AVG(SALARY * 12) >= 120000 ;

-- 조인 문법(오라클)
-- SELECT   테이블1.컬럼, 테이블2.컬럼 
-- FROM     테이블1 , 테이블2  --> 테이블1과 테이블2를 JOIN 하겠다.
-- WHERE    테이블1.컬럼 = 테이블2.컬럼 --> 조인 조건이 되는 것을 적어준다.

-- ANSI JOIN 문법 사용방법
-- SELECT   테이블1.컬럼명, 테이블2.컬럼명    --> DOT(.) 경로를 통해 해당 테이블의 컬럼을 조회
-- FROM     테이블1 (INNER) JOIN 테이블2     --> 테이블1과 테이블2를 JOIN 하겠다.
--   ON     (테이블1.컬럼명 = 테이블2.컬럼명) --> 조인 조건절을 기술
-- WHERE    일반 조건식을 따로 선별           --> 일반 조건절을 기술


-- 직원의 직원ID, 이름, 부서ID, 부서명 출력
-- 직원ID가 100인 직원만 조회

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) 
 WHERE E.EMPLOYEE_ID = 100 ; 
 
    
-- 오라클문법으로 풀이
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E , DEPARTMENTS D 
 WHERE (E.DEPARTMENT_ID = D.DEPARTMENT_ID) AND E.EMPLOYEE_ID = 100 ;
 
-- 서브 쿼리란?
-- SQL문을 실행하는데 필요한 데이터를 추가로 조회하기 위해서
-- SQL 내부에서 사용하는 SELECT 문장을 의미한다.
-- 서브쿼리는 메인 쿼리 안에 포함된 종속적인 관계이다.

-- 메인쿼리 : 서브쿼리의 결과 값을 사용하여 기능을 수행하는 전체 영역
-- 서브쿼리 : 메인쿼리의 조건식에 들어가는 값을 의미한다.

SELECT * FROM EMPLOYEES;

-- Jack의 급여보다 낮게 받고 있는 직원의 이름과 급여를 출력

-- 1. 테이블의 정보를 확인
SELECT * FROM EMPLOYEES;

-- 2. 조건의 기준이 되는 Jack의 급여의 정보를 확인
SELECT FIRST_NAME , SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'James' ; -- 8400

-- 3. 2번의 결과 값을 가지고 조건절을 통해서 결과값을 확인
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400 ;

-- 서브쿼리 활용하여 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (
    SELECT SALARY
      FROM EMPLOYEES
     WHERE FIRST_NAME = 'Jack' 
 );

-- 직원테이블에서 James 의 급여보다 낮게 받고 있는 직원의 이름과 급여 정보를 출력 (서브쿼리활용)
-- 에러가 날것이다 > ? 왜 에러가 나는지 분석을 한번 해보세요!

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < ( SELECT SALARY
      FROM EMPLOYEES
     WHERE FIRST_NAME = 'James');
 
-- ORA-01427: single-row subquery returns more than one row
-- 단일행 서브쿼리는 하나의 행만 출력을 할 수가 있다.

-- 서브쿼리의 특징
-- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 ()로 묶어서 사용한다.
-- 2. 서브쿼리의 SELECT절에 명시한 컬럼은
-- 메인쿼리의 비교 대상(WHERE 절에 작성한 컬럼) 과 같은 자료형과 개수를 지정 해야 한다.
-- 3. 서브 쿼리에 있는 SELECT 문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능해야 한다.
-- 즉 단 하나의 데이터로만 연산 가능한 연산자라면 서브 쿼리의 결과 행 수도 하나여야만 한다.
--> 연산자와 함께 상호 작용하는 방식에 따라서 단일행 서브쿼리와 다중행 서브쿼리로 나뉜다.

-- 단일행 연산자
-- =(같다), >, >=, < , <=(초가,이상,미만,이하) , !=, <> , ^= (같지않다.)

-- 단일행 서브쿼리란?
--> 실행 결과가 단 하나의 해으로 나오는 서브쿼리이다.

-- Nancy 보다 빨리 입사한 직원의 이름과 입사일 정보를 조회.

-- 1. 조건의 기준이되는 Nancy의 입사일 정보를 출력 (서브쿼리)
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Nancy' ; -- 2002/08/17

-- 2. 단일행 연산자를 활용하여 서브쿼리를 가지고 결과값을 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE < (
    SELECT HIRE_DATE
      FROM EMPLOYEES
     WHERE FIRST_NAME = 'Nancy'  -- 2002/08/17
 );

-- 직원들의 평균 급여 보다 높은 급여를 받는 직원의 이름과 급여 정보를 조회.

-- 1. 조건의 기준이 되는 직원의 평균 급여의 정보를 확인 (서브쿼리)
SELECT AVG(SALARY)
  FROM EMPLOYEES;

-- 2. 단일행 연산자를 활용하여 단일행 서브쿼리를 사용해서 결과를 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (
    SELECT AVG(SALARY)
       FROM EMPLOYEES -- > 6461.8
 );

-- 다중행 서브쿼리 란?
--> 실행 결과 행이 여러 개로 나오는 서브쿼리르 말한다.
--> 단일행 연산자는 사용할 수 없고 다중 행 연산자를 사용해야 한다.

-- [ 다중 행 연산자의 종류 ]
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하는 데이터가 있으면 TRUE값 반환 
--> IN(서브쿼리)
-- ANY : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE값을 반환
--> 비교연산자 ANY(서브쿼리)
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE값을 반환
-- 비교연산자 ALL(서브쿼리)
-- EXISTS : 서브쿼리 결과 값이 존재하는지 여부를 확인한다.
-- EXISTS(서브쿼리)

-- 각 부서별 최고급여 와 동일한 급여를 받고 있는 직원의 정보를 출력
-- (부서ID, 이름, 급여)

-- 조건의 기준이 되는 각 부서별(GROUP BY) 최고 급여의 정보를 출력.
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;

-- IN 연산자 활용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY 
  FROM EMPLOYEES
 WHERE SALARY IN (
    SELECT MAX(SALARY)
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID
 ) ;

-- ANY 연산자 활용
-- ANY 는 조건에 만족하는 결과가 하나라도 참이면 참을 반환 하는 특징 
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY 
  FROM EMPLOYEES
 WHERE SALARY = ANY (
    SELECT MAX(SALARY)
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID
 ) ;
 
-- ANY연산자에 =(같다)라는 등가비교연산자를 쓰게 되면 IN 연산자와 같은 결과값을 출력을 해준다
 
-- 249페이지 교재 

-- EXIST : 존재 여부만 확인하는 연산자

-- 부서만 해당하는 정보만 출력 
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;


SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (
    SELECT FIRST_NAME, DEPARTMENT_ID
      FROM EMPLOYEES
     WHERE DEPARTMENT_ID = 5000
 ) ;

-- EXISTS 는 존재 여부만 확인하는 연산자다!!

-- 스칼라 서브쿼리 란?
-- SELECT 절에서 사용하는 서브쿼리
-- 하나의 컬럼에 대한 하나의 행만 반환하는 특징을 가지고 있다.
-- JOIN 없이 JOIN 처럼 기능하고자 할때 사용

-- 이름, 급여, 부서아이디, 부서이름 을 출력 

SELECT * FROM DEPARTMENTS;

SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);


-- 스칼라 서브쿼리 활용
SELECT FIRST_NAME,LAST_NAME, SALARY, DEPARTMENT_ID
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AS 부서이름
  FROM EMPLOYEES E ;
  

-- 인라인 뷰 (Inline View)
-- > FROM절에서 가상 테이블처럼 사용하는 서브쿼리이다.
-- > 인라인 뷰를 사용하면 서브 쿼리의 결과를 마치 테이블 처럼 사용할 수 있다.
-- > 데이터베이스 SELECT 문을 객체로써 저장해 테이블처럼 사용하는 VIEW 달리
-- > 인라인 뷰는 쿼리 내에서 즉시 처리 된다.
-- > 인라인뷰는 별칭을 안주면 내부 컬럼을 지정할 수가 없다 그래서 반드시 별칭을 사용해야 된다.

-- 이름, 부서ID, 부서별(GROUP BY) 최고급여

SELECT  DEPARTMENT_ID , MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 인라인뷰를 활용
SELECT A.FIRST_NAME,A.LAST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
  FROM EMPLOYEES A , (SELECT  DEPARTMENT_ID , MAX(SALARY) AS MAX_SALARY
                      FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
  AND A.SALARY = B.MAX_SALARY ;


















