-- 240627 ��
-- CHAPTER 04. GROUP BY / HAVING --

-- [�����Լ��� ����]

-- ������ �Լ�: �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
-- ������ �Լ�: ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
-->������ �Լ��� �����Լ� ��� �θ���.

-- �������Լ�(�����Լ�)�� Ư¡
-- 1. �����Լ��� NULL ���� �����ϴ� Ư���� ������ �ִ�.
-- 2. �����Լ��� �׷�ȭ(GROUP BY)�� �Ǿ� �ִ� ���¿����� ���� �����ϴ�.

-- [�����Լ�]
-- COUNT(): ������ �������� ������ ��ȯ
-- SUM() : ������ �������� ���� ��ȯ
-- MAX() : ������ ������ �� �ִ밪 ��ȯ
-- MIN() : ������ ������ �� �ּҰ� ��ȯ
-- AVG() : ������ �������� ��հ� ��ȯ

-- ���� ���̺��� ����ID�� ���� ������ ��ȸ (�� ������)
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
  GROUP BY();
-- ���� ���̺��� �ϳ��� �׷����� ���� �ɷ� �ν��� �ؼ� �׷���̰� �� �����̴�.

-- �μ� ���̺��� �μ�ID�� ���� ������ ��ȸ
-- ���� >>27
SELECT COUNT(DEPARTMENT_ID)
  FROM DEPARTMENTS;
  
-- ���� ���̺��� �μ�ID�� ���� ������ ��ȸ
SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES;

-- COUNT�Լ��� *(�ƽ�Ÿ����ũ) �� �� �ִ� Ư¡�� ������ �ֽ��ϴ�.
-- �ٸ� �ٸ� �Լ��� �� ���� ����.
SELECT COUNT(*)
  FROM EMPLOYEES;
  
-- �޿��� �� �հ踦 ��� - SUM()
SELECT SUM(SALARY)
  FROM EMPLOYEES;

-- �������� �ִ� �޿��� �ּ� �޿��� ��� - MAX(), MIN()
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES;

-- �μ�ID�� 100�� ������ ��� �޿��� ��� - AVG()
-- ������� �Ҽ��� 1�� �ڸ����� �ݿø�
SELECT ROUND(AVG(SALARY), 1)
  FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;




/**(�׽�Ʈ ���̺� �Է� ��)*****************************/
SELECT * FROM ����ǥ;
SELECT * FROM ����������;

-- �ڿ�ȥ��
SELECT COUNT(�л��̸�)
  FROM ����������
GROUP BY �Ҽӹ�;


-- 3��° �ð�
-- GROUP BY : Ư�� �÷��� �������� �׷�ȭ (����)

-- SQL �ۼ�����
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- *** SQL ������� ***
-- FROM > WHERE > GROUP BY > HAVINIG > SELECT > ORDER BY

-- [ GROUP BY ����� ]
-- 4. SELECT       ���ϴ� �÷� �̸� 
-- 1. FROM         ���̺� �̸�
-- 2. WHERE        ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. GROUP BY     Ư�� �÷��� �������� �׷�ȭ

-- ���������� ���̺��� �Ҽӹ� �� �л��� �ο����� ��ȸ
SELECT *
  FROM ����������;

SELECT �Ҽӹ�, COUNT(�л��̸�), �л��̸�
  FROM ����������
GROUP BY �Ҽӹ�, �л��̸�;

-- GROUP BY �� ��� �� ���ǻ���
-- 1. GROUP BY �� Ư�� �÷��� ����ϴ� ���� ���� ������ �����ϱ� ������ GROUP BY ���� �ʰ� ����Ǵ� ���� 
-- HAVING, SELECT, ORDER BY���� ����� �� �ִ� ���� ������ �ɸ���.
-- �ֳ�? SQL ���� ������ ���ؼ�
-- 2. �ٸ�, �����Լ��� ó���ϴ� �÷��� ����� �����ϴ�.

-- ����ǥ ���̺��� ����(GROUP BY) �ְ� ������ ���� ������ ���
SELECT ����, MAX(����), MIN(����)
  FROM ����ǥ
GROUP BY ����;

-- ����ǥ ���̺��� �л� �� (GROUP BY) ��� ������ ���
SELECT �л�ID, ROUND(AVG(����), 2)
  FROM ����ǥ
GROUP BY �л�ID ;

-- ����ǥ ���̺��� �л����� JAVA�� DATABASE������ ������ ���� ���
SELECT �л�ID, SUM(����)
  FROM ����ǥ
 WHERE ���� IN('JAVA','DATABASE')
 GROUP BY �л�ID;


-- HAVING �� : GROUP BY ���� �����Ҷ��� ��� �����ϴ�.
--> ���谡 �Ϸ�� ����� ������ ���� ���͸� �ϴ� �����̴�.
--> ������ ���� ����� ����� �ȴٴ� �������� WHERE ���� ���������,
--> HAVING���� �׷�ȭ(GROUP BY) �� ��󿡼� ����� �ȴٴ� ������ �ٸ���.

-- ����ǥ ���̺��� �л��� ��� ������ ���ϰ�,
-- ��ռ����� 75������ �л��鸸 ���
SELECT *
  FROM ����ǥ;

SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) <= 75;


SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
WHERE AVG(����) <= 75
GROUP BY �л�ID;



-- 4��°�ð� �߰����� (�� ���� �ٿ��ֱ�)


-- ����1) ���������� ���̺��� �Ҽӹ� ��(GROUP BY) �ο����� 3�� �̻��� �ݸ� ���
SELECT �Ҽӹ� , COUNT(�Ҽӹ�)
  FROM ���������� 
GROUP BY �Ҽӹ�
HAVING COUNT(�Ҽӹ�) >= 3 ;

-- �ڿ�ȥ�� Ǯ���
SELECT *
  FROM ����������;
  
SELECT �Ҽӹ�, COUNT(�л�ID)
  FROM ����������
GROUP BY �Ҽӹ� 
HAVING COUNT(�л�ID)>=3;



-- ����2) ����ǥ ���̺��� �л���(GROUP BY) ��� ������ ���ϵ�, 
-- ��� ������ NULL �� �ƴ� ���� ��� �� �Ҽ��� 1�� �ڸ������� ���
SELECT �л�ID, AVG(����)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL ; 

-- �ڿ� ȥ�� Ǯ���
SELECT �л�ID, ROUND(AVG(����), 1)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL;



-- ����3) �μ� ��(GROUP BY) �ְ� ������ 100000 �̻��� �μ��� ���
SELECT DEPARTMENT_ID, MAX(SALARY * 12)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING  MAX(SALARY * 12) >= 100000 ;

-- �ڿ� ȥ�� Ǯ���
SELECT DEPARTMENT_ID
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;




-- ����4) ���� ��(GROUP BY) �ְ� �޿� ���
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID;

SELECT * FROM EMPLOYEES;

-- ���� ����) �����߿��� IT_PROG�� AD_PRES �� �ƴ� ������ �ְ� ������ 150000 �̻��� 
-- �ְ����� ���

SELECT JOB_ID , MAX(SALARY*12)
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('IT_PROG','AD_PRES')
 GROUP BY JOB_ID
HAVING MAX(SALARY *12) >= 150000; 

