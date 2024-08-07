-- CHAPTER 05. JOIN --
-- 240701

-- JOIN �̶�?
--> ���� ���̺��� �ʿ��� �����͸� �� ���� �������� ���

-- �� ����(Non EQUI JOIN)
--> �� ���� ���̺� �������� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
--> �������(=)�� �ƴ� �����ڵ��� ����� ������ �ǹ� ( >, >=, <, <=, BETWEEN)

-- � ����(EQUI JOIN)
--> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
--> � �����ڸ� ����ؼ� ������ �ǹ� ( = )
--> ���� ���� ���Ǵ� ������ �����̴�.

-- [������� �����]
-- 3. SELECT ���̺�1.�÷��̸�, ���̺�2.�÷��̸� --> ���� ���ϴ� �÷��̸�.(���)�� ���ؼ� �� ��ȸ ����
-- 1. FROM ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� JOIN�ϰڴ�.
-- 1. WHERE ���̺�1.�÷��̸� = ���̺�2.�÷��̸� ; -- ���� ������ ���

-- ������ ���� ���̺�� ����ǥ ���̺��� �л�ID, �л��̸�, ����, ���� ������ ���
-- 1. ������ ��� ���̺��� ������ Ȯ��
-- 2. FROM���� ������ ���̺��� ,(�ĸ�) �������� �ۼ�
-- 3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� '���� ����'�� �ۼ�
-- 4. SELECT  ���� ����ϰ��� �ϴ� �÷��� .(���) �� �Բ� �ۼ�

SELECT * FROM ����������;
SELECT * FROM ����ǥ;

SELECT ����������.�л�ID, ����������.�л��̸�, ����ǥ.����, ����ǥ.����
  FROM ����������, ����ǥ
 WHERE ����ǥ.�л�ID = ����ǥ.�л�ID;

-- ����ID, FIRST_NAME, �μ��̸� ������ ����� ���ּ���
 -- FROM ���� ��Ī�� ���
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, 
       D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
 
 
-- �ι�°�ð�

-- ���� ID�� 100�� ������ �̸�, �μ����� ���
-- ���ǰ� ������ �̾��ִ� ������ > �������� (AND, OR)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,  D.DEPARTMENT_NAME 
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND E.EMPLOYEE_ID = 100;

-- ���� ID�� 201�� ����ID, �̸�, ����ID, �������� ���
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,  E.JOB_ID , J.JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID  = J.JOB_ID 
   AND E.EMPLOYEE_ID = 201;


-- [ANSI JOIN ������ ��� ���]
-- 3. SELECT ���� ��ȸ�ϰ��� �ϴ� �÷� �̸�  --> DOT(.)�� ���� ��θ� ���ؼ� ���̺��� �÷��� ��ȸ
-- 1. FROM ���̺�1 JOIN ���̺�2           --> ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
--    ON (���̺�1.�÷� = ���̺�2.�÷�)      --> ���� �������� �ۼ�
-- 2. WHERE �Ϲ� ���ǽ��� ���� ����         --> �Ϲ� �������� �ۼ�

-- ����ID�� 101�� ����ID�� ������ �̸��� ������ �μ����� ���
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID = 101;

-- �ܵ������� �����ϴ� �÷��� .(���)�� �� �����൵ ����� ����.
-- ������ ���������� ��θ� ���ִ� ���� �����.
-- ���� ������ ��κ� PK�� FK ����� �̷������. ������ �� �׷� ���� �ƴϴ�!!

-- CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
--> ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
--> īƼ�� ���̶�� �θ���.
--> īƼ�� �� : ��� ����� ���� ��Ÿ���� ��

-- [ CROSS JOIN �� ��� ��� ] 
-- SELECT  ��ȸ�� �÷� �̸�
-- FROM    ���̺�1 CROSS JOIN ���̺�2

--> ON�� ���� �������� ������ CROSS JOIN �̴�!!

-- ���� ID �� �μ� ID �� �μ����� ���
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;

-- ���� ���̺��� �� ���� ����(107) * �μ����̺��� �� ���� ����(27) ==> 2889���� ���� ���� ��
-- īƼ�� ���� �߻��� �Ǵ� ���̴�. > ��� ����� ���� ����� �Ǵ� ���� ���Ѵ�.


SELECT * FROM EMPLOYEES;
-- ���� ���� : ���� ���̺��� �����ϴ� ��

-- ������ �Ŵ��� �̸��� ������ ���
-- ����ID, �̸�, �Ŵ���ID, �Ŵ����̸� 
SELECT A.EMPLOYEE_ID ����ID, A.FIRST_NAME �����̸�, A.MANAGER_ID �Ŵ���ID, B.FIRST_NAME �Ŵ����̸�
  FROM EMPLOYEES A JOIN EMPLOYEES B
  ON (A.MANAGER_ID = B.EMPLOYEE_ID)
ORDER BY A.EMPLOYEE_ID ASC;

-- �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ��� ���̵�� ������ �̸��� ���
-- ���� ���� ������ �÷��� ���� �������� �ɾ�����Ѵ�.
-- ������ PK�� FK ���谡 �ƴ϶� ���Ϸ��� ���� �´� ���� ������ �ɾ�����Ѵٴ� ��!

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;

-- ������ �������̺� �ִ� �Ŵ��� ���̵� �������̺� �ִ� ���� ID�� ���� ��
-- ��Ǯ��
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D JOIN EMPLOYEES E
  ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID) 
WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

-- �ٸ� Ǯ��
  SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D JOIN EMPLOYEES E
  ON (D.MANAGER_ID = E.EMPLOYEE_ID)
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- OUTER JOIN : �ܺ������̶�� �ϸ�, �� ���� ���̺� ���� �������� ��ȸ�ϰ�
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ� ���� �������̴�.
--> ���� ���̺��� NULL ���� ����ϰ� ���� �� ���

-- LEFT OUTER JOIN : ���� ���̺��� �������� NULL ���� �����Ͽ� ���
--> ����Ŭ ���� ���� : ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ�� �ۼ�
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
  
-- ����Ŭ ���� �������� Ǯ��
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+);


-- 240702 ȭ
-- RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

-- ����Ŭ �������� Ǯ��
SELECT  D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID;


-- FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
--16(LEFT OUTER JOIN) + 107(RIGHT OUTER) = 123 ���� ����

