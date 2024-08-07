-- CHAPTER 02. WHERE --

SELECT * FROM EMPLOYEES;
-- SELECT   ��ȸ�� �÷� �̸�
--   FROM   ���̺� �̸� 
--  WHERE   ���ϴ� ���� �����ϱ� ���� ���ǽ� ; 

-- �������̺��� ����ID�� 105�� ������ FIRST_NAME�� LAST_NAME�� ���

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- �μ����̺��� �Ŵ��� ���̵� 100�� �μ��̸��� �μ����̵� ���
SELECT * FROM DEPARTMENTS;

SELECT MANAGER_ID ,DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ; 
 
-- �޿��� 9000�� �޴� ������ �̸� , �������̵�, �μ����̵�, �޿� ������ ���

SELECT * FROM EMPLOYEES; 

SELECT FIRST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000 ; 
 
 
-- �������̺��� ����ID�� 100�� ������ JOB_ID�� �޿������� ���
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, SALARY, EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100 ; 

-- �ڷ����� ������ �̳� ��¥�� �̸� ��� ������ �����ϴ�.

DESC EMPLOYEES ;  -- ���� ����Ű : CTRL + ENTER , F9 

-- �ڷ����� ���ͷ�
-- NUMBER : ������ -> 123, 123.56789 
-- VARCHAR2 : ������ -> 'ABCDE'
-- DATE : ��¥�� -> '24/06/25'

-- ��������� ( + , -, *, / )
SELECT SALARY * 12 AS ����
  FROM EMPLOYEES ;
  
  
SELECT HIRE_DATE, HIRE_DATE + 2
  FROM EMPLOYEES ;


-- �񱳿����� ( ũ��, �۳� ũ�ų� ����, �۰ų� ���� )
-- A > B  : ũ��, �ʰ�
-- A >= B : ũ�ų� ����, �̻�
-- A < B  : �۴�, �̸�
-- A <= B : �۰ų� ����, ����

-- �������̺��� �޿�(SALARY)�� 5000 ������ ������ FIRST_NAME, SALARY ������ ���

SELECT FIRST_NAME, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY <= 5000 ;


-- �������̺��� ������ 100000 �̻��� ������ �̸��� �޿��� ���� �� ������ ���
SELECT FIRST_NAME, SALARY, SALARY * 12
  FROM EMPLOYEES
 WHERE SALARY * 12 >= 100000 ;
 

-- � �� ������ (���� �ƴϸ� ���� �ʳ�)
-- ���� : =
-- ���� �ʴ� : != , <> , ^= 
-- ���� �ʴ�(�����񱳿�����) : NOT A = B\

-- �ڷ����� ���ͷ�
-- NUMBER : ������ -> 123, 123.56789 
-- VARCHAR2 : ������ -> 'ABCDE'
-- DATE : ��¥�� -> '24/06/25'


-- �������̺��� �������̵� IT_PROG �� �ƴ� ������ ������ ���
-- (FIRST_NAME, JOB_ID)
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG' ;


-- �������̺��� EAMIL ������ SKING �� ������ ��� ������ ���
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;


-- �������̺��� 06/03/07�� �Ի��� ������ ����ID�� �̸��� ������ ��� 

SELECT HIRE_DATE FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE = '06/03/07' ;

-- JOB_ID�� 'ST_MAN'�� ������ ���� ����ΰ�?
-- ����>> 5

SELECT JOB_ID, FIRST_NAME,SALARY
  FROM EMPLOYEES
  WHERE JOB_ID = 'ST_MAN' ;


-- �� ������ (TRUE OR FALSE)
--> 2�� �̻��� ������ �̾��ִ� ������

-- AND : ������ ��� �����ϴ� ��� TRUE �� ��ȯ
-- OR  : �ϳ��� �����̶� �����ϴ� ��� TRUE �� ��ȯ

-- AND����
-- TRUE AND TRUE -> TRUE
-- TRUE AND FALSE -> FALSE
-- FALSE AND TURE -> FALSE
-- FALSE AND FALSE -> FALSE 

-- OR����
-- TRUE OR TRUE -> TRUE
-- TRUE OR FALSE -> TRUE
-- FALSE OR TRUE -> TRUE
-- FALSE OR FALSE -> FALSE


-- ���������� �����

-- 3. SELECT   ��ȸ�ϰ� ���� �÷� �̸�1, ��ȸ�ϰ� ���� �÷��̸�N ....
-- 1. FROM     ���̺� �̸�
-- 2. WHERE    ����1 AND/OR ����2 AND/OR ����3 AND/OR ����4 .....

-- �μ�ID�� 90�̰� �޿��� 5000�̻��� ������ ����ID�� �̸�(FIRST_NAME)�� ���
-- �� ��� ? >> 3
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000 ; 

-- �μ�ID�� 100�̰ų� �Ի����� 06��02��02�� ���Ŀ� �Ի��� ������ �� ����ΰ�?
-- ����  >> 
SELECT DEPARTMENT_ID, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE > '06/02/02' ;


-- ������ 'SA_REP'�̸鼭 �޿��� 10000 �̻��� �޴� ������ �� ����ϱ��?
-- ���� >> 

SELECT FIRST_NAME, JOB_ID, SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID = 'SA_REP'
   AND SALARY >= 10000 ;

-- �������� �켱����
-- AND > OR 

-- �μ�ID�� 100�̰ų� 90�� �����߿���
-- ����ID�� 101�� ������ ����ID, FIRST_NAME, ������ ��� * �� ������ AnnSal�̶�� ��Ī ���
-- ���� > 1��!

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSal, department_id
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101 ; 

-- �켱������ ���� ������� ������ �޶������� �ִ�
-- () �Ұ�ȣ�� �̿��Ͽ� �켱������ �ٲ��ټ� �ִ�!!

-- NULL ���� ������
-- DEPARTMENT_ID = NULL 

SELECT DEPARTMENT_ID FROM EMPLOYEES; 

-- �츮 �μ��� �μ��� ���� ������ �Ѹ���̳� �׷� �� ������ �̸��� ����ؿͶ� !!
-- �μ����̵� ���� ������ �̸��� ? 

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NULL ; 
 
-- NULL ���� ������
-- IS NULL : ������ ���� NULL�� ���� ��ȸ
-- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ

-- ���ʽ��� �ް� ���ϴ� ������ ���� �� ����ΰ�?
-- ���� >> 35 

SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ; 


-- SQL ������
--> SQL���� ����� �� �ִ� �����ڴ� 
-- IN, BETWEEN A AND B , LIKE 


-- IN ������ : Ư�� �÷��� ���Ե� �����͸� ���� �� ��ȸ�� �� ���
--> = + OR ��� ���� ���� ���� ���
--> IN �����ڴ� NULL���� �����ϴ� Ư¡�� ������ �ֽ��ϴ�.


-- �������̺��� �μ�ID�� 30�̰ų� 50�̰ų� 90�� ��� ������ ������ ���

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 
    OR DEPARTMENT_ID IS NULL ; 
    
-- IN������ Ȱ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90,NULL) ;
 
-- �������̺��� �������̵� AV_VP �̰ų� ST_MAN�� ������ �̸��� �������̵� ��� (IN������Ȱ��)
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AV_VP', 'ST_MAN');
 
-- NOT IN : IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- NOT IN�� NULL���� �ְ� �Ǹ� �ƿ� �����Ͱ� ����� �ȵȴ�!!
-- != + AND 

-- ���� ���̺��� �Ŵ��� ���̵� 100, 120, 121�� �ƴ� ������ �̸��� �Ŵ��� ���̵� ���
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100
   AND MANAGER_ID != 120
   AND MANAGER_ID != 121 
   OR MANAGER_ID IS NULL ; 

SELECT * FROM EMPLOYEES;
-- NOT IN Ȱ��
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100,120,121); 
 
-- BETWEEN A AND B 
--> ���� ���� ���� �����͸� ��ȸ�� �� ���
--> BETWEEEN �ּҰ� AND �ִ밪
--> Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- �������̺��� �޿��� 10000�̻� 20000������ �޿��� �޴� ������ �̸��� �޿� ���� ���
-- 10000 ~ 20000 

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY >= 10000 
   AND SALARY <= 20000 ; 
   
-- BETWEEN ������ Ȱ��

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ; 
-- �޿��� 10000 �̻� 20000 ������ �������� �����͸� ��� 
 
 
-- �������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի糯¥�� ��� (BETWEEN �ּҰ� AND �ִ밪)
-- 05/01/01 ~ 05/12/31 

SELECT HIRE_DATE
  FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31'  ; 

-- LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�Ҷ� ����ϴ� ��
-- % , _ ��� ���ϵ� ī�带 �̿��ؼ� ��Ī ������ �����ϴ� ��

-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : � ���̵� ��� ���� �Ѱ��� ���� �����͸� �ǹ�


-- �ڵ�����ȣ�� 650���� �����ϴ� ������ �ڵ��� ��ȣ ã��
SELECT * FROM EMPLOYEES;

SELECT PHONE_NUMBER
  FROM EMPLOYEES 
 WHERE PHONE_NUMBER LIKE '650%' ;
-- �̸� : FIRST_NAME
-- �������̺��� �̸��� S�� �����ϰ� n���� ������ ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';

-- �������̺��� �̸��� it���� ������ �� 4������ ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';

-- �������̺��� �̸��� �ι�° ���ڰ� e�� ������ �̸� ã��
SELECT FIRST_NAME 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '_e%';

-- �������̺��� 01���� �Ի��� ������ �Ի糯¥ ã��
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%';

























 