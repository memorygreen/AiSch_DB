-- CHAPTER 03. ����Ŭ�Լ� --

-- �Լ��� (Function) 
-- > �Է� ���� �־ Ư���� ����� ���� ��� ���� ���

-- ����� �����Լ� : ����ڰ� �ʿ信 ���� ���� ������ �Լ�
-- �����Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��Ҷ����� ȣ���Ͽ� ��� 
--> ������, ������, ��¥��, ����ȯ��, nulló���Լ�, �����Լ� 

-- �Լ��̸�() -> �Լ��� �����Ҷ� ����ϴ� �Է� �� : ���� ��, �Ű����� 

--[ ������ �Լ� ]

-- UPPER() : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
-- LOWER() : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���

SELECT UPPER('abcde123@@') 
  FROM DUAL ;
  
-- DUAL���̺��̶�?
--> ����Ŭ�ְ������(SYS) ������ ���̺�.
--> �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺��̴�!!

-- �������̺��� ������ FIRST_NAME, EMAIL ������ ���
-- FIRST_NAME�� ��� �빮�ڷ� ���, EMAIL������ �ҹ��ڷ� ���

SELECT FIRST_NAME, EMAIL
     , UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;
  
  
-- LENGTH() : ��ȣ �� ���� �������� ���̴� ���ϴ� �Լ�
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;
  
  
-- �������̺��� ������ FIRST_NAME�� FIRST_NAME�� ���̸� ���
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;

-- ������ FIRST_NAME�� ���̰� 5�� �̻��� �������� ����ID, �̸��� ���
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >=5 ; 

-- SUBSTR() : ���ڿ��� �����ϴ� �Լ��̴�.
--1) SUBSTR(�Է°�, ������ġ, �������)
--> ���ڿ� �������� ������ġ���� ���� ���̸�ŭ ��� 
--2) SUBSTR(�Է°�, ������ġ)
--> ������� ���� �� ���ڿ� �������� ������ġ���� ������ ���

SELECT SUBSTR('�ΰ����ɻ���б�JS_B', 5, 4)
     , SUBSTR('�ΰ����ɻ���б�JS_B', 1, 4)
     , SUBSTR('�������ְ���', 4, 2)
     , SUBSTR('�ΰ����ɻ���б�JS_B' ,9 )
     , SUBSTR('�ΰ����ɻ���б�JS_B' ,3 )
  FROM DUAL;

-- �Ի糯¥�� ����, ��, �� ���� ��� (SUBSTR)
-- �� �÷����� ����, ��, �� ���� ��Ī�� ���

SELECT HIRE_DATE
     , SUBSTR(HIRE_DATE, 1, 2) AS ����
     , SUBSTR(HIRE_DATE, 4, 2) AS ��
     , SUBSTR(HIRE_DATE, 7) AS ��
  FROM EMPLOYEES;

-- REPLACE() : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
-- 1) REPLACE(���ڿ�������, �ٲٰ� ���� ����, �ٲ�� �� ����)
-- 2) REPLACE(���ڿ�������, �ٲٰ� ���� ����)
--> �ٲ�� �� ���ڸ� ������ �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ȴ�.

SELECT REPLACE('�ΰ�����#����б�', '#', '-')
     , REPLACE('�ΰ�����#����б�', '#')
  FROM DUAL ;


-- �������̺��� �Ի� ���ڸ� ����ϵ�
-- /(������) ���ڿ��� -(������)���� �ٲ㼭 ����ϰ�
-- /(������) �����Ͽ� ��� ���ּ���.

SELECT HIRE_DATE
     , REPLACE(HIRE_DATE, '/', '-')
     , REPLACE(HIRE_DATE, '/' )
  FROM EMPLOYEES ; 
  
-- CONCAT() : �� ���ڿ� �����͸� ��ġ�� �Լ�!!
-- ���ڰ����� 2���� �� �� �ִ�. 2���� ���ڿ��� ��ġ�� �Լ��̴�.
-- '||' : �ռ������� -> �ռ������ڸ� �̿��ϸ� ���ڿ��� ���Ѵ�� ������ �����ϴ�

SELECT CONCAT('JS_B��' ,  '�ְ�') || ' �ְ��Դϴ�' || '!!'
  FROM DUAL;


-- TRIM () : �Է� ���� ������ �������� �� ���� ������ �������ִ� �Լ�
SELECT REPLACE(TRIM('       ��   ��   ���   ��    ��                  '), ' ')
     , REPLACE('       ��   ��   ���   ��    ��                  ', ' ')
  FROM DUAL;

-- [ ������ �Լ� ]

-- ROUND() : Ư�� ��ġ���� �ݿø� �ϴ� �Լ�
-- 1) ROUND(�ݿø� �� ����, �ݿø� ��ġ)
-- 2) ROUND(�ݿø� �� ����)
--> �ݿø� ��ġ ������ �Ҽ��� ù° �ڸ����� ������ �ݿø� ����

SELECT ROUND(1234.56789, 2)
     , ROUND(1234.56789)
     , ROUND(1234.56789 ,3)
  FROM DUAL ;

-- TRUNC() : Ư�� ��ġ���� ������ �Լ�
-- TRUNC(������ ����, ���� ��ġ)
SELECT TRUNC(1234.56789, 2)
     , TRUNC(1234.56789)
  FROM DUAL ;

-- MOD() : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
--> Ȧ�� , ¦���� �����Ҷ� �����ϰ� ����Ѵ�.
-- MOD(������ �� ����, ���� ����)

SELECT MOD(10,2)
     , MOD(10,3)
     , MOD(15,6)
  FROM DUAL ;
  
  
-- [ ��¥ �� �Լ� ]
-- SYSDATE : ���� ��¥�� �ð��� ������ִ� �Լ�
--> �Է½� �ٷ� ����� �Ǹ�, ���� �ð��� �� �������� ����� �����ϴ�.
--> ��¥�� �����ʹ� ������ ���� 
--> ��¥�� ������ ������ ������ �Ұ��� �ϴ�!

SELECT SYSDATE
  FROM DUAL;
  
-- ��¥ ���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS ���糯¥
     , SYSDATE +1 AS ������
     , SYSDATE -1 AS ������¥
--     , SYSDATE + SYSDATE --> ��¥ �����ͳ����� ������ �Ұ����ϴ�!!
  FROM DUAL ;

-- ��¥�����͸� Ȱ�� (�ǹ�)
SELECT SYSDATE AS ����
     , SYSDATE +1 AS �Ϸ����
     , SYSDATE +1/24 AS �ѽð�����
     , SYSDATE +1/24/60 AS �Ϻд���
     , SYSDATE +1/24/60/60 AS ���ʴ���
  FROM DUAL;

-- ADD_MONTHS() : �밳�� ���� ��¥�� ���ϴ� �Լ�
-- ADD_MONTHS(��¥������, ���ϰų� �� ������)

SELECT SYSDATE AS ����
     , ADD_MONTHS(SYSDATE, -1) AS "1������"
     , ADD_MONTHS(SYSDATE, +6) AS "6������"
  FROM DUAL;

-- [ �� ��ȯ �Լ� ]

-- ����ȯ ������ ����
-- �Ͻ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��
SELECT SALARY * '2' 
  FROM EMPLOYEES ;

-- ����� ����ȯ : ������ ��ȯ �� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ� ��

-- TO_CHAR() : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ ���ִ� �Լ�
-- TO_CHAR(��ȯ �� ������, ��� ����)

SELECT SALARY
     , TO_CHAR(SALARY, '$999,999')
  FROM EMPLOYEES ;
  

SELECT TO_CHAR(SYSDATE , 'YY/MM/DD/DAY')
  FROM DUAL ; 

-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ �ϴ� �Լ�
-- TO_NUMBER(���ڿ� ������, �ν� �� ���� ����)

SELECT TO_NUMBER('1,000', '9,999') + 500 
  FROM DUAL ;
  
-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ �ϴ� �Լ�
-- TO_DATE(���ڿ� ������, �ν� �� ��¥ ����)

SELECT TO_DATE('24/06/26' , 'YYYY-MM-DD')
  FROM DUAL;


-- [ NULL ó�� �Լ� ]
-- NVL / NVL2 : NULL���� ��ü �� �� �ִ� �Լ�
-- 1) NVL(NULL���� ���θ� �˻��� ������, NULL�� ��� ��ȯ�� ������)
SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID, 0)
     , NVL2(DEPARTMENT_ID, 1, 0 )
  FROM EMPLOYEES;
  
--2) NVL2(NULL���� ���θ� �˻��� ������<1>, <1>���� NULL�� �ƴҰ�� ��ȯ�� ������<2>,
--        <1>�� NULL�� ��� ��ȯ �� ������<3> ) 


SELECT * FROM EMPLOYEES;

-- ���ʽ��� ���� �������� ���� 0���� ��ü�ؼ� ��� (NVL)
SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES;


-- ����ID,FIRST_NAME,MANAGER_ID�� ��� ,  (NVL2)
-- �� �Ŵ����� �ִ� ������ '����' ���� ���
-- �Ŵ����� ���� ������ '��ǥ'�� ��� 

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID, '����' , '��ǥ' )
  FROM EMPLOYEES;


-- [ ���� �Լ� ]

-- DECODE () : ��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ�
--> �˻����� ���ؼ� ������ ���� ��ȯ

-- DECODE(�˻����� �� �÷� �Ǵ� ������(����)<1>, <1>�� �� ��1<2> 
--      , ��ġ �� ��ȯ�� ��<3> , <1>�� �� ��2, ��ġ �� ��ȯ�� ��,
--        ��ġ���� ���� �� ��ȯ �� <������>)


-- ����ID,FIRST_NAME,MANAGER_ID�� ��� ,   (DECODE)
-- �� �Ŵ����� �ִ� ������ '����' ���� ���
-- �Ŵ����� ���� ������ '��ǥ'�� ��� 
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(EMPLOYEE_ID   , 100 , '����',  101, '�����̻�', 102, '���̻�', 103, '����'  ,'����')
  FROM EMPLOYEES;

-- �Ŵ����� ���̵� NULL�̸� ����
-- ����ID�� 101�̸� �����̻�
-- ����ID�� 102�̸� ���̻�
-- ����ID�� 103�̸� ����




















  

