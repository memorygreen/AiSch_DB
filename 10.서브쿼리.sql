-- CHAPTER 10. �������� (Sub Query)
 
-- 240704

-- SQL �ۼ� ����
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- *** SQL ���� ���� ***
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY


-- 5. SELECT    ��ȸ�ϰ��� �ϴ� �÷� �̸�, .....
-- 1.FROM       ��ȸ�ϰ��� �ϴ� ���̺��̸�
-- 2. WHERE     ��ȸ�ϰ��� �ϴ� ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3.GROUP BY   Ư�� �÷��� �̿��Ͽ� �׷�ȭ
-- 4. HAVING    �׷�ȭ�� ��󿡼� ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 6. ORDER BY  Ư�� �÷��� �������� ����

-- GROUP BY ����
-- �μ���(GROUP BY ) �ְ� �޿��� ���

SELECT *
  FROM EMPLOYEES;
-- ����
SELECT  DEPARTMENT_ID,SALARY
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID, SALARY;
-- ����Ǯ��
SELECT  DEPARTMENT_ID,MAX(SALARY)
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
-- ������ AD_PRES, IT_PROG �� �ƴ� ������ ��� ��������
-- ��� ������ 120000�̻��� ������ ���

SELECT JOB_ID, AVG(SALARY*12)
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN('AD_PRES','IT_PROG')
 GROUP BY JOB_ID
 HAVING AVG(SALARY*12)>=120000;

-- ���� ����(����Ŭ)
-- SELECT   ���̺�1.�÷�, ���̺�2.�÷�
-- FROM     ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
-- WHERE    ���̺�1.�÷� = ���̺�2.�÷� --> ���� ������ �Ǵ� ���� �����ش�

-- ANSI JOIN ���� �����
-- SELECT    ���̺�1.�÷���, ���̺�2.�÷���  --> DOT(.) ��θ� ���� �ش� ���̺��� �÷��� ��ȸ
-- FROM      ���̺�1 INNER JOIN ���̺�2    --> ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
--   ON     (���̺�1.�÷��� = ���̺�2.�÷���) --> ���� �������� ���
-- WHERE    �Ϲ� ���ǽ��� ���� ����          --> �Ϲ� �������� ���

-- ������ ����ID, �̸�, �μ�ID, �μ��� ���
SELECT  *
  FROM EMPLOYEES;

SELECT  *
  FROM DEPARTMENTS;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
--(�ι�°�ð�)
-- ����ID�� 100�� ������ ��ȸ

-- ����Ŭ ��������~
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
 WHERE E.EMPLOYEE_ID = 100;
 
 
-- ����������?
-- SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
-- SQL ���ο��� ����ϴ� SELECT ������ �ǹ��Ѵ�.
-- ���������� ���� ���� �ȿ� ���Ե� �������� �����̴�.

-- �������� : ���������� ������� ����Ͽ� ����� �����ϴ� ��ü ����
-- �������� : ���������� ���ǽĿ� ���� ���� �ǹ��Ѵ�.


-- Jack�� �޿����� ���� �ް� �ִ� ������ �̸��� �޿��� ���


-- 1. ���̺��� ������ Ȯ��
SELECT *
  FROM EMPLOYEES;

-- 2. ������ ������ �Ǵ� Jack�� �޿� ������ Ȯ��
-- ��Ǯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY < 8400;
-- �ڿ�Ǯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE FIRST_NAME = 'Jack';

-- 3. 2���� ��� ���� ������ �������� ���ؼ� ������� Ȯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY <=(
      SELECT SALARY
      FROM EMPLOYEES
      WHERE FIRST_NAME = 'Jack'
) ;
-- �ڿ�Ǯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY <=(
      SELECT SALARY
      FROM EMPLOYEES
      WHERE FIRST_NAME = 'Jack') ;
      
-- �������̺��� James�� �޿����� ���� �ް� �ִ� ������ �̸��� �޿� ������ ��� (�������� Ȱ��)
-- ������ �� ���̴� > ? �� ������ ���� �� �м��� �� �� �غ�����!
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY <(
      SELECT SALARY
      FROM EMPLOYEES
      WHERE FIRST_NAME = 'James') ;
      
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY <(2400,2500) ;
-- ORA-01427: single-row subquery returns more than one row
-- ������ ���������� �ϳ��� �ุ ����� �� ���� �ִ�.

SELECT *
  FROM EMPLOYEES
WHERE FIRST_NAME = 'James';
--��: ���  2���� �� ����

-- ���������� Ư¡
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� () �� ��� ����Ѵ�.
-- 2. ���������� SELECT ���� ����� �÷���
-- ���������� �� ���(WHERE ���� �ۼ��� �÷�)�� ���� �ڷ����� ������ �����ؾ� �Ѵ�.
-- 3. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ� �Ѵ�.
-- �� �� �ϳ��� �����ͷθ� ���� ������ �����ڶ�� ���� ������ ��� �� ���� �ϳ����߸� �Ѵ�.
--> �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.

-- ������ ������
-- =(����), >(�ʰ�), >=(�̻�), <(�̸�), <=(����), !=, <>, ^= (�����ʴ�)

-- ������ ����������?
--> �������� �� �ϳ��� ������ ������ ���������̴�.

-- Nancy ���� ���� �Ի��� ������ �̸��� �Ի��� ������ ��ȸ.
-- �ڿ�Ǯ��
SELECT FIRST_NAME,HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE <=(
         SELECT HIRE_DATE
           FROM EMPLOYEES
          WHERE FIRST_NAME='Nancy' -- 2002/08/17
);

--��Ǯ��
-- 1. ������ ������ �Ǵ� Nancy�� �Ի��� ������ ��� (��������)
SELECT HIRE_DATE
  FROM EMPLOYEES
 WHERE FIRST_NAME='Nancy'; -- 2002/08/17
 
-- 2. ������ �����ڸ� Ȱ���Ͽ� ���������� ������ ������� ���
SELECT FIRST_NAME,HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE <(
         SELECT HIRE_DATE
           FROM EMPLOYEES
          WHERE FIRST_NAME='Nancy' -- 2002/08/17
);

-- �������� ��� �޿����� ���� �޿��� �޴� ������ �̸��� �޿� ������ ��ȸ

-- ��Ǯ��
-- 1. ������ ������ �Ǵ� ������ ��� �޿��� ������ Ȯ��(��������)
SELECT AVG(SALARY)
  FROM EMPLOYEES;
-- 2. ������ �����ڸ� Ȱ���Ͽ� ������ ���������� ����ؼ� ����� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY > (  
        SELECT AVG(SALARY)
          FROM EMPLOYEES
);

-- �ڿ�Ǯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY > (  
        SELECT AVG(SALARY)
          FROM EMPLOYEES
);


-- 3��°�ð�
-- ������ ����������?
--> ���� ��� ���� ���� ���� ������ ���������� ���Ѵ�.
--> ������ �����ڴ� ����� �� ���� ���� �� �����ڸ� ����ؾ� �Ѵ�.

-- [���� �� �������� ����]
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�ϴ� �����Ͱ� ������ TRUE �� ��ȯ
-- IN(��������)

-- ANY : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE ���� ��ȯ
--> �񱳿����� ANY(��������)

-- ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE ���� ��ȯ
-- �񱳿����� ALL(��������)

-- EXISTS : �������� ��� ���� �����ϴ��� ���θ� Ȯ���Ѵ�.
-- EXISTS (��������)



-- �� �μ��� �ְ�޿��� ������ �޿��� �ް� �ִ� ������ ������ ���
-- (�μ�ID, �̸�, �޿�)
-- ������ ������ �Ǵ� �� �μ��� �ְ� �޿��� ������ ���
--��Ǯ��

-- IN ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY IN (
    SELECT MAX(SALARY)
      FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
);

-- �ڿ�Ǯ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY IN (
    SELECT MAX(SALARY)
      FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
ORDER BY SALARY
;


-- ANY ������ Ȱ��
-- ANY�� ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ�ϴ� Ư¡
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY = ANY (
    SELECT MAX(SALARY)
      FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
);

-- ANY�����ڿ� =(����) ��� ��񱳿����ڸ� ���� �Ǹ� IN �����ڿ� ���� ������� ������ش�.

-- (���� 249P - ������ ��������)

-- EXIST : ���� ���θ� Ȯ���ϴ� ������

-- �μ��� �ش��ϴ� ������ ���
SELECT DISTINCT(DEPARTMENT_ID)
  FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE EXISTS (
    SELECT FIRST_NAME, DEPARTMENT_ID
      FROM EMPLOYEES
     WHERE DEPARTMENT_ID = 5000
);
-- EXISTS �� ���� ���θ� Ȯ���Ѵ�!


-- ��Į�� ����������?
-- SELECT ������ ����ϴ� ��������
-- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ������ ����
-- JOIN ���� JOINó�� ����ϰ��� �� �� ���

-- �̸�, �޿�, �μ����̵� ,�μ� �̸��� ���
-- ��:JOIN
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
-- ��:��Į�� ��������
-- �ڿ�Ǯ��
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
        (SELECT DEPARTMENT_NAME
           FROM DEPARTMENTS
          WHERE DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID) AS DEPARTMENT_NAME
  FROM EMPLOYEES;

-- ��Ǯ��
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
        ,(SELECT DEPARTMENT_NAME
            FROM DEPARTMENTS
           WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AS �μ��̸�
  FROM EMPLOYEES E;
  
  
-- �ζ��� �� (Inline View)
-- > FROM������ ���� ���̺�ó�� ����ϴ� ���������̴�.
-- > �ζ��� �並 ����ϸ� ���������� ����� ��ġ ���̺�ó�� ����� �� �ִ�.
-- > �����ͺ��̽� SELECT ���� ��ü�ν� ������ ���̺�ó�� ����ϴ� VIEW �� �޸�
-- > �ζ��� ��� ���� ������ ��� ó���ȴ�.

-- > �ζ��� ��� ��Ī�� �� �ָ� ���� �÷��� ������ ���� ����. �׷��� �ݵ�� ��Ī�� ����ؾ� �ȴ�.

-- �̸�, �μ�ID, �μ���(GROUP BY) �ְ� �޿�
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

-- �ζ��� �� Ȱ��
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
  FROM EMPLOYEES A, (SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
                     FROM EMPLOYEES 
                 GROUP BY DEPARTMENT_ID) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
  AND A.SALARY = B.MAX_SALARY;
                 
                 