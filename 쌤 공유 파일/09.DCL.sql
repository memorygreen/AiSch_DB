-- CHAPTER 09. DCL (Data Control Language)

-- DCL�̶�?
--> �����ͺ��̽��� �����ϰų� ��ü�� ������ �ִ� ���� ������ �ϴ� ����̴�.

-- [ DCL�� ��ɾ� ���� ]
-- GRANT   : ������ �ο��ϴ� ��ɾ�
-- REVOKE  : ������ ȸ���ϴ� ��ɾ�
-- ROLE    : ������ ��� �ο��Ҷ� ����ϴ� ��ɾ�

-- ����ڶ�?
--> �����ͺ��̽��� �����Ͽ� �����͸� �����ϴ� '����' �� �����(USER) ��� �Ѵ�.

-- [ ����� ���� ��� ]
-- CREATE USER   ����� �̸�
-- IDENTIFIED BY �н����� ;

-- ���� �ο�
-- GRANT    �ý��۱���
-- TO       USER(�����) ; 

-- ���� ȸ��
-- REVOKE   �ý��۱���
-- FROM     USER(�����) ; 

CREATE TABLE DCL_TEST (
    TEST NUMBER(10)
);

--ORA-01031: insufficient privileges
--> ������ ������ϴ� !! 

-- ROLE �̶�?
--> ���� ������ �ѹ��� �ο��ϱ� ���� ����ϴ� ��ɾ��.
-- ����� ������ ���ѳ��� ��� ���� ROLE�̶�� �������� �ѹ��� ������ ��� �ο��Ѵ�.

-- [ ROLE�� ���� ]
-- CONNECT  : �����ͺ��̽��� ���ӿ� �ʿ��� ���� �� ������ �ִ� ROLE
-- RESOURCE : ���̺�, ������, ��ü �����ϴ� ������ ������ �ִ� ROLE
-- DBA      : �����ͺ��̽��� �����ϴ� ��κ��� �ý��� ����

-- GRANT CONNECT, RESOURCE TO USER(�����) ; 

-- ��ü �����̶�?
--> Ư�� ������� ��ü(���̺�, ������, ��) � ������ �ִ� ���̴�.
--> �� HR���� ���̺� DCLTEST ����ڰ� SELECT�� INSERT ���� �۾��� �����ϵ���
-- ��� �� �� �ְ� �ϴ� �� 

-- ��ü ������ ����ϴ� ���
-- GRANT �ý��� ����
-- ON ��Ű��.��ü�̸� 
-- TO USER(�����)

SELECT * FROM HR.EMPLOYEES ;


UPDATE HR.EMPLOYEES
SET FIRST_NAME = '��' , LAST_NAME = '�ؿ�'
WHERE EMPLOYEE_ID = 100 ; 

SELECT * FROM EMPLOYEES; 

COMMIT; 












