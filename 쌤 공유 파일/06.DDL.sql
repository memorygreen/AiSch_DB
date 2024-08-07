-- CHAPTER 06. DDL (Data Difinition Language)  --

-- DDL�̶�?
-- ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����մϴ�.

-- [ DDL�� ��ɾ� ���� ]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺��� ��ü�� �����ϴ� ��ɾ�

-- [ ���̺� ������ ���� ����ϴ� �ڷ��� ]
-- VARCHAR2(N) : ������ ������, Nũ�⸸ŭ �Է� ����
-- NUMBER(P,S) : ������ ���� P�ڸ���ŭ �Է¹ް� S�ڸ� ��ŭ �Ҽ��� �Է¹���
--> ����Ŭ �����ͺ��̽� ������ �Ǽ��� ���� ��� ǥ���� �����ϴ�!!
--> �Ұ�ȣ�� �����ϰ� �Ǹ� �ִ� ���� 38 ũ�Ⱑ ����.
-- DATE : ���� ��¥ ���� �Է¹޴� ��¥�� �ڷ����̴�.

-- ���̺� �����ϱ�
-- ���������� ���̺��� Ȯ���ؼ� TEST_���������� ��� ���̺��� ������
-- ���������� ���̺��� ���콺�� �巡�� �Ѵ����� SHIFT + F4 �� ������ ���̺��� ������ Ȯ�ΰ���

CREATE TABLE TEST_���������� (
    �л�ID VARCHAR2(9),
    �л��̸� VARCHAR2(50),
    �Ҽӹ� VARCHAR2(5)
) ;

SELECT * FROM TEST_����������;

-- ����ǥ ���̺��� Ȯ���ؼ� TEST_����ǥ ���̺��� ������!

CREATE TABLE TEST_����ǥ (
    �л�ID VARCHAR2(9),
    ���� VARCHAR2(30),
    ���� NUMBER
);

SELECT * FROM TEST_����ǥ;

CREATE TABLE JUN_LOGIN (
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM JUN_LOGIN;

-- ���������̶�?
--> ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
--> �����ͺ��̽��� ����Ǵ� �����ʹ� �׻� ��Ȯ�ϰ� �ϰ����� ������ �Ǿ�� �Ѵ�.
--> �׷��� ���ؼ� ���� ������ ������ ������Ѵ�.
--> ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ �޴´�.

-- [ ���� ������ ���� ]
-- PRIMARY KEY(PK) : �⺻Ű, NOT NULL + UNIQUE --> NULL�� �Ұ� + �ߺ� �Ұ�
-- UNIQUE KEY(UK)  : ����Ű, NULL�� �Է� ���� �� �ߺ��� �Ұ�
-- NOT NULL : NULL�� �Ұ���, �� �ԷµǾ�� �ϴ� �������̴� �Ҷ� ����ϴ� ���� ����
-- CHECK : TRUE OR FALSE �� �� �Ҽ� �ִ� ���� ����, ������ �����͸� �Է� ����
-- FOREIGN KEY(FK) : �ܷ�Ű , ���̺��� �����ϴ� Ű 

-- ������ ���Ἲ�̶� ?
--> �����Ϳ� ������ ���� ���� 
--> �� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ���� �� ����

-- ���Ἲ �������� ����
-- ��ü ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
-- ���� ���Ἲ(FK) : ���� �Է�, ����, �����Ҷ� �����Ǵ� �ٸ� ���̺���� �����Ͱ� ��Ȯ�ϰ� �����ǵ��� ����
--> ���� ���迡 �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ �ϴ� ��

-- [ �̹� ������ ���̺��� ���������� �����ϱ� ] 
SELECT * FROM JUN_LOGIN ;
-- �����
-- ALTER TABLE ���̺� �̸� ADD CONSTRAINT �������� �̸� ��������(�÷�) ; 

-- ���̺� PK �������� �����ϱ�
ALTER TABLE JUN_LOGIN ADD CONSTRAINT JUN_ID_PK PRIMARY KEY(ID) ;

-- ���̺��� UK �������� �����ϱ�
ALTER TABLE JUN_LOGIN ADD CONSTRAINT JUN_EMAIL_UK UNIQUE(EMAIL) ;

-- ���̺� CHECK �������� �����ϱ�
ALTER TABLE JUN_LOGIN ADD CONSTRAINT JUN_PW_CHECK CHECK(LENGTH(PW) = 3 );


-- ���̺��� FK ���������� �����ϱ�
-- FK �������� �����ϴ� ���
-- ALTER TABLE ���̺� �̸� ADD CONSTRAINT ���������̸� ��������(�÷�)
-- REFERENCES �������̺�(�����÷���) ;

-- TEST_���������� ���̺��� �л�ID �÷��� PK�� ���������� �ɾ��ּ���!!
ALTER TABLE TEST_���������� ADD CONSTRAINT �л�ID_PK PRIMARY KEY(�л�ID) ;

-- TEST_����ǥ ���̺��� �л�ID �÷��� FK�� ���������� �ɾ��ֱ�.
ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES TEST_����������(�л�ID) ;

-- �������� �����ϱ�
-- ALTER TABLE ���̺� �̸� MODIFY �÷� �̸� �ٲ� �������� ;
SELECT * FROM JUN_LOGIN;

ALTER TABLE JUN_LOGIN MODIFY NAME NOT NULL ; 

-- �������� �����ϱ�
-- ALTER TABLE ���̺��̸� DROP CONSTRAINT �������� �̸� ; 
ALTER TABLE JUN_LOGIN DROP CONSTRAINT JUN_PW_CHECK ; 

-- ���̺��� �÷� �߰� 
-- ALTER TABLE ���̺� �̸� ADD �÷��� �ڷ���(ũ��) ; 
ALTER TABLE JUN_LOGIN ADD TEL VARCHAR2(10) ; 

-- �÷��� �ڷ����� �����ϱ� 
-- ALTER TABLE ���̺� �̸� MODIFY �÷��� �ٲ� �ڷ���(����) ; 
ALTER TABLE JUN_LOGIN MODIFY TEL VARCHAR2(20);

-- Ư�� �÷��� �����ϱ�
-- ALTER TABLE ���̺� �̸� DROP COLUMN �÷��� ;
ALTER TABLE JUN_LOGIN DROP COLUMN TEL ;

-- ���̺��� �̸��� �����ϱ�
RENAME JUN_LOGIN TO JUNS_LOGIN ; 
SELECT * FROM JUNS_LOGIN ; 

-- ���̺� ���� 
-- �����
-- DROP TABLE ���̺� �̸� ;

DROP TABLE TEST_���������� ; 

-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- TEST_����ǥ ���̺��� �л�ID��� �÷��� FK�� ���� �ǰ� �ֱ� ������ ������ �Ұ����ϴ� .

-- �������Ǳ��� ������ �ϴ� ���
-- DROP TABLE ���̺��̸� CASCADE CONSTRAINT ;
DROP TABLE TEST_���������� CASCADE CONSTRAINT ;


-- TRUNCATE : ���̺��� �����͸� ���� ���� 
-- ����� 
-- TRUNCATE TABLE ���̺��̸� ; 

-- ���̺��� �����ϴ� ������ 
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ ; 
--> ���̺��� �������Ǳ����� ���簡 ���� �ʴ´�.
--> ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� �������̴�!


SELECT * FROM DROP_����ǥ;

TRUNCATE TABLE DROP_����ǥ ; 

ROLLBACK;

-- ���̺� ���� ��� 1)
CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ) > 5 )
);

-- ���̺� ���� ��� 2)
CREATE TABLE TB_TEST2 (
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    -- ���������� �߰�
    -- CONSTRAINT �������Ǹ� ��������(�÷�)
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY (PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
);

CREATE TABLE JUN_JOIN (
    ID VARCHAR2(20) PRIMARY KEY, 
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);

SELECT * FROM JUN_JOIN;


-- VIEW(��) �� ?
--> �ϳ� �̻��� ���̺��� ���� ������ ���� ��������� ������ ���̺��̴�.

-- �� ���� ���
-- CREATE VIEW  �� �̸�
-- AS ������ SELECT ���� 

CREATE VIEW EMP_100 
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY 
     FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100 ; 
     
    
SELECT * FROM EMP_100 ;






