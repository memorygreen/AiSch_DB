-- 240627 목
-- CHAPTER 04. GROUP BY / HAVING --

-- [내장함수의 종류]

-- 단일행 함수: 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수: 여러 행을 입력받아 하나의 결과 값으로 출력이 되는 함수
-->다중행 함수를 집계함수 라고 부른다.

-- 다중행함수(집계함수)의 특징
-- 1. 집계함수는 NULL 값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 그룹화(GROUP BY)가 되어 있는 상태에서만 사용아 가능하다.

-- [집계함수]
-- COUNT(): 지정한 데이터의 개수를 반환
-- SUM() : 지정한 데이터의 합을 반환
-- MAX() : 지정한 데이터 중 최대값 반환
-- MIN() : 지정한 데이터 중 최소값 반환
-- AVG() : 지정한 데이터의 평균값 반환

-- 직원 테이블의 직원ID의 행의 개수를 조회 (총 직원수)
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
  GROUP BY();
-- 직원 테이블을 하나의 그룹으로 묶은 걸로 인식을 해서 그룹바이가 된 상태이다.

-- 부서 테이블의 부서ID의 행의 개수를 조회
-- 정답 >>27
SELECT COUNT(DEPARTMENT_ID)
  FROM DEPARTMENTS;
  
-- 직원 테이블의 부서ID의 행의 개수를 조회
SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES;

-- COUNT함수는 *(아스타리스크) 쓸 수 있는 특징을 가지고 있습니다.
-- 다만 다른 함수는 쓸 수가 없다.
SELECT COUNT(*)
  FROM EMPLOYEES;
  
-- 급여의 총 합계를 출력 - SUM()
SELECT SUM(SALARY)
  FROM EMPLOYEES;

-- 직원들의 최대 급여와 최소 급여를 출력 - MAX(), MIN()
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES;

-- 부서ID가 100인 직원의 평균 급여를 출력 - AVG()
-- 결과값은 소수점 1의 자리까지 반올림
SELECT ROUND(AVG(SALARY), 1)
  FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;




/**(테스트 테이블 입력 후)*****************************/
SELECT * FROM 성적표;
SELECT * FROM 수강생정보;

-- 자영혼자
SELECT COUNT(학생이름)
  FROM 수강생정보
GROUP BY 소속반;


-- 3번째 시간
-- GROUP BY : 특정 컬럼을 기준으로 그룹화 (묶음)

-- SQL 작성순서
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- *** SQL 실행순서 ***
-- FROM > WHERE > GROUP BY > HAVINIG > SELECT > ORDER BY

-- [ GROUP BY 사용방법 ]
-- 4. SELECT       원하는 컬럼 이름 
-- 1. FROM         테이블 이름
-- 2. WHERE        원하는 행을 선별하기 위한 조건식
-- 3. GROUP BY     특정 컬럼을 기준으로 그룹화

-- 수강생정보 테이블에서 소속반 별 학생의 인원수를 조회
SELECT *
  FROM 수강생정보;

SELECT 소속반, COUNT(학생이름), 학생이름
  FROM 수강생정보
GROUP BY 소속반, 학생이름;

-- GROUP BY 를 사용 시 유의사항
-- 1. GROUP BY 에 특정 컬럼을 사용하는 순간 행의 개수가 감소하기 때문에 GROUP BY 보다 늦게 실행되는 절은 
-- HAVING, SELECT, ORDER BY에는 출력할 수 있는 행이 제한이 걸린다.
-- 왜냐? SQL 실행 순서에 의해서
-- 2. 다만, 집계함수로 처리하는 컬럼은 사용이 가능하다.

-- 성적표 테이블에서 과목별(GROUP BY) 최고 성적과 최저 성적을 출력
SELECT 과목, MAX(성적), MIN(성적)
  FROM 성적표
GROUP BY 과목;

-- 성적표 테이블에서 학생 별 (GROUP BY) 평균 점수를 출력
SELECT 학생ID, ROUND(AVG(성적), 2)
  FROM 성적표
GROUP BY 학생ID ;

-- 성적표 테이블에서 학생별로 JAVA와 DATABASE과목의 성적의 합을 출력
SELECT 학생ID, SUM(성적)
  FROM 성적표
 WHERE 과목 IN('JAVA','DATABASE')
 GROUP BY 학생ID;


-- HAVING 절 : GROUP BY 절이 존재할때만 사용 가능하다.
--> 집계가 완료된 대상을 조건을 통해 필터링 하는 문법이다.
--> 조건이 참인 결과만 출력이 된다는 점에서는 WHERE 절과 비슷하지만,
--> HAVING절은 그룹화(GROUP BY) 된 대상에서 출력이 된다는 점에서 다르다.

-- 성적표 테이블에서 학생별 평균 성적을 구하고,
-- 평균성적이 75이하인 학생들만 출력
SELECT *
  FROM 성적표;

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <= 75;


SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
WHERE AVG(성적) <= 75
GROUP BY 학생ID;



-- 4번째시간 중간부터 (쌤 공유 붙여넣기)


-- 문제1) 수강생정보 테이블에서 소속반 별(GROUP BY) 인원수가 3명 이상인 반만 출력
SELECT 소속반 , COUNT(소속반)
  FROM 수강생정보 
GROUP BY 소속반
HAVING COUNT(소속반) >= 3 ;

-- 자영혼자 풀어보기
SELECT *
  FROM 수강생정보;
  
SELECT 소속반, COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반 
HAVING COUNT(학생ID)>=3;



-- 문제2) 성적표 테이블에서 학생별(GROUP BY) 평균 성적을 구하되, 
-- 평균 성적이 NULL 이 아닌 값만 출력 단 소수점 1의 자리까지만 출력
SELECT 학생ID, AVG(성적)
  FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL ; 

-- 자영 혼자 풀어보기
SELECT 학생ID, ROUND(AVG(성적), 1)
  FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL;



-- 문제3) 부서 별(GROUP BY) 최고 연봉이 100000 이상인 부서만 출력
SELECT DEPARTMENT_ID, MAX(SALARY * 12)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING  MAX(SALARY * 12) >= 100000 ;

-- 자영 혼자 풀어보기
SELECT DEPARTMENT_ID
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;




-- 문제4) 직업 별(GROUP BY) 최고 급여 출력
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID;

SELECT * FROM EMPLOYEES;

-- 최종 문제) 직업중에서 IT_PROG와 AD_PRES 가 아닌 직업별 최고 연봉이 150000 이상인 
-- 최고연봉만 출력

SELECT JOB_ID , MAX(SALARY*12)
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('IT_PROG','AD_PRES')
 GROUP BY JOB_ID
HAVING MAX(SALARY *12) >= 150000; 

