-- CHAPTER 01 . SELECT --

-- �ּ� ��ȣ

-- ��¥ ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲� 
-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL�ּ� 

-- �ּ� ����(2) : /**/ -> �������� �ѹ��� �ּ�ó�� ����

/*
1. SQL���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ������ ������ ���� �ʴ´�.
3. SQL ���� ������ �� ����Ŭ�� (;) �� ������ �Ѵ�!
4. SQL ���� ����Ű : CTRL + ENTER , F9
*/

DESC EMPLOYEES ;
--DESC(DESCRIBE)>�����ϴ�, ��ɹ��� SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴ� ���� ���Դϴ�. 
--�ַ� ���̺��� ��(�÷�)�� ���� ������ �����ϸ�, 
--Ư�� ���̺��̳� ���� ������ ��ȸ�� �� �����մϴ�.

-- [ SELECT �� �⺻ ����� ]
-- SELECT ��ȸ�� �÷���1 ...
--   FROM ��ȸ�� ���̺� �̸�


-- �������̺��� �μ�ID, FIRST_NAME, EMAIL, SALARY , ��ȭ��ȣ ������ ���

SELECT DEPARTMENT_ID, FIRST_NAME, EMAIL, SALARY
  FROM EMPLOYEES ; 
  
-- *(�ƽ�Ÿ����ũ) : ��ü�� �ǹ�, ��ü ��ȸ

-- �������̺��� ��� ������ ���

SELECT *
  FROM EMPLOYEES ; 
  
-- �μ����̺��� ��� ������ ��� -- �밳�� �μ��� �ִ��� 

SELECT *
  FROM DEPARTMENTS ;
  
-- �������̺��� ��� ������ ���
SELECT *
  FROM JOBS;
  
-- �������̺��� JOB_ID �� ���

SELECT * FROM EMPLOYEES;

SELECT JOB_ID
  FROM EMPLOYEES ;

-- DISTINCT : ������ �ߺ��� ���� ���ִ� Ű����

-- SELECT [ALL/DISTINCT] �÷��̸�

SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;
  
-- �������̺��� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT * FROM EMPLOYEES ; 

SELECT DISTINCT DEPARTMENT_ID 
  FROM EMPLOYEES ;


-- �������̺��� �Ի��������� �ߺ��� �����Ͽ� ���
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;

-- �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

-- DISTINCT �ڿ� 2�� �̻��� �÷��� ������
-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ��޵Ǽ� �ߺ����Ű� ���������� �ȵȴ�.

DESC EMPLOYEES ;

-- �÷��� �ڷ����� ������, ��¥�� �̸� ���� ������ �����մϴ� (+, -, *, /)

-- ������ ����ID, �̸�, �޿� ������ ���

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
     , SALARY + SALARY + SALARY
  FROM EMPLOYEE ; 

-- ��Ī ����ϱ�
-- Alias ��� �ϸ� �Ѵ��� ���� ���� ���� �Ҽ� �ִ�.
-- AS ��� Ű���带 ����Ͽ� ��Ī�� �����Ѵ�

-- ��Ī ��� ���
-- 1. SELECT �÷��̸� ��Ī
-- 2. SELECT �÷��̸� "��Ī"
-- 3. SELECT �÷��̸� AS ��Ī
-- 4. SELECT �÷��̸� AS "��Ī"

-- �������̺��� ������ �̸��� �޿� ���� ������ ������ ���
-- ������ �������� �̶�� ��Ī�� ����ؼ� ���

SELECT FIRST_NAME, SALARY, SALARY * 12 AS "�� ### ��"
  FROM EMPLOYEES;


-- �������̺��� �̸�, �Ի���, �Ի��� ������, �Ի��� ��Ʊ�� �� ���
-- �ٸ� �Ի��ϴ������� "�Ի���_������" �� ��Ī�� ����ؼ� ���
-- �Ի��� ��Ʊ���� "�Ի��� ��Ʊ��" �� ��Ī�� ����ؼ� ���

SELECT FIRST_NAME , HIRE_DATE
     , HIRE_DATE + 1 AS �Ի���_������
     , HIRE_DATE + 2 AS "�Ի��� ��Ʊ��"
  FROM EMPLOYEES;


-- ORDER BY ��
--> Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ� �� �Ҷ� ����Ѵ�.
--> SQL����������� ���� �������� ���� �ȴ�
--> ������ ���� ����� �������� ������ �⺻������ ���������� ����ȴ�.

-- ASC(Ascending) : �������� ���� (1,2,3,4,5,......)
-- DESC(Descending) : �������� ���� (10,9,8,7,......)

-- order by �⺻ �����

--SELECT    ��ȸ�ϰ� �ϴ� �÷� �̸�
-- FROM     ��ȸ�ϰ� �ϴ� ���̺� �̸�
--ORDER BY  �÷��̸� [���Ĺ��]

-- ������ ��� ������ ���
-- �� �޿� �������� ���������� �����Ͽ� ��� �� �غ�����!!

SELECT *
  FROM EMPLOYEES
ORDER BY SALARY DESC ;


-- �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;


-- �������̺��� ����ID, �μ�ID, �̸�, �޿� ������ ���
-- �� �μ�ID�� ������������, �޿��� ������������ ���

SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC , SALARY DESC ;

-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢��
-- �޿��� ���� ������� �������� ������ �Ȱ�
--> ���� �μ�ID�� ������������ ������ �� �Ŀ� �޿��� ������������ ������ �Ѱ��̴�.

-- NULL �̶�?
-- NULL ���̶� �������� ���� ������ ��� �ִ� ���¸� �ǹ��Ѵ�.
-- ���� �������� �ʰų� �������� �ʴ� ���� �ǹ��Ѵ�.
-- ����0 �� �� ���ڿ� ' ' �� NULL���� �ƴմϴ�.!
-- NULL�� �����ϸ� ������� ������ NULL ���� ���´�.
-- NULL�� ���ϸ� ������� ������ FALSE ���� ���´�.

SELECT * FROM EMPLOYEES;

-- ����1) �������̺��� ����ID, ���ʽ�, ���ʽ��ι��� ������ ���
-- ���ʽ� �ι�� UP_BONUS ��� ��ġ�� ����ؼ� ���
SELECT EMPLOYEE_ID, COMMISSION_PCT 
     , COMMISSION_PCT * 2 AS UP_BONUS
  FROM EMPLOYEES ;

-- ����2) ����1���� UP_BONUS�� ��� ���� ����� �غ��� ��� ���� Ȯ��
-- �� �׷��� ��� ���� ���Դ��� ���� 






