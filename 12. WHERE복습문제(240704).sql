-- WHERE �� ���� ���� -- 

/*
�� ��
������ �о����

-- [ WHERE �� �⺻ ����� ]
-- 3. SELECT   ��ȸ�� �÷� ��1 ...
-- 1. FROM     ��ȸ�� ���̺� ��
-- 2. WHERE    ��ȸ�� ���� �����ϱ� ���� ���ǽ�

SQL���� ����Ҽ� �ִ� �����ڵ�

1. ��������� < +, -, *, / >

2. �񱳿����� 
    >  : ũ�� (�ʰ�)
    >= : ũ�ų� ���� (�̻�)
    <  : �۴�
    <= : �۰ų� ���� (����)
    
3. ������� ( ���ų� �����ʰų� )
    = : ����
    != , <>, ^= : ���� �ʴ�.
    NOT A = B   : ���� �ʴ�.
    
4. �� ������
    AND(�׸���) : ������ ��� �����ϴ� ��� TRUE 
    OR  (Ȥ��)  : �ϳ��� �����̶� �����ϴ� ��� TRUE
    
5. NULL ���� ������
    IS NULL  : ������ ���� NULL �� ���� ��ȸ
    IS NOT NULL : ������ ���� NULL �� �ƴ� ���� ��ȸ
    
*/

-- < ���� > 

-- 240704 �ڿ� Ǯ��

-- ���� 1) �������̺��� ���ʽ��� 0.2�� �޴� ������ �̸��� �޿��� ������ ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
WHERE COMMISSION_PCT = 0.2;


-- ���� 2) �������̺��� �޿��� 9000 �̻� �޴� ������ EMAIL ������ ���
SELECT EMAIL
  FROM EMPLOYEES
WHERE SALARY >= 9000;

-- ���� 3) �������̺��� �޿��� 7000 �̻��̸鼭 JOB_ID�� 'SA_REP'�� ������ ����ID�� �̸� ���
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE SALARY >= 7000
   AND JOB_ID = 'SA_REP';
  
-- ���� 4) �μ����̺��� �Ŵ���ID�� 200, 201, 203�� �ƴ� ������ �μ��̸��� ���
SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE MANAGER_ID NOT IN(200,201,203);
 
-- ���� 5) �������̺��� �μ�ID�� ���� ������ �̸��� ��� �ϼ���
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;
   
-- ���� 6) ���� ���̺��� �޿��� 10000 ���� ������ �̸��� �޿� ������ ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 19999;

-- ���� 7) JOB_ID��  IT_PROG�� FI_ACCOUNT�� �ƴ� ������ �̸��� JOB_ID�� ��� 
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('IT_PROG', 'FI_ACCOUNT');
 
-- ���� 8) �޿��� 10000�̸��� �ƴ� ������ ID�� �̸��� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >=10000;
 
-- ���� 9) �������̺��� �μ�ID�� 90�̰�, �޿��� 5000�̻��� ������ ID�� �̸��� ����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000;
 

-- ���� 10) �μ��� 50�μ��̰�, ������ 'ST_MAN'�� ������ �������
-- ����� ������ ���� (�μ�ID, FIRST_NAME, JOB_ID, SALARY)
SELECT DEPARTMENT_ID, FIRST_NAME,JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
   AND JOB_ID = 'ST_MAN';
 
   
-- ���� 11) ������(JOB_ID)�� IT_PROG, AD_PRES�� �����߿���
--         �޿�(SALARY)�� 8000�̻��� �������� ������ ��� 
-- ����� ������ ���� ( FIRST_NAME, JOB_ID, SALARY)
SELECT DEPARTMENT_ID,JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE JOB_ID IN('IT_PROG', 'AD_PRES')
   AND SALARY >= 8000;
 
   

