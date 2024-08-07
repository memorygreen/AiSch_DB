-- CHAPTER 07. DML (Data Manipulation Language)  --

-- DML�̶�?
--> ������ ���۾�� ���̺� �����͸� ��ȸ,�߰�,����,���� �Ҷ� ����ϴ� ���Ǿ� .
--> ���̺��� ���ϴ� �����͸� �Է�,����,���� �Ѵ�.

-- [ DML�� ���� ] - ���ξ���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- INSERT �����
--1) INSERT INTO ���̺� �̸� (�÷�LIST... )
--   VALUES (��....)
--> *** INSERT INTO�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �°� ��� �ȴ�(1:1����)

--2) INSERT INTO ���̺� �̸� 
--   VALUES(��....)
--> INSERT �� �÷�����Ʈ�� ������ VALUES�� �Է��� ���� ���̺��� �÷� ���� ������ �ڷ����� ���ƾ� �ȴ�!

-- ���� ������ �־��
SELECT * FROM JUN_JOIN ; 

INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES ('SMHRD01','11111','���ؿ�',SYSDATE, 37 ,'010-3568-3904','RTCHO3904@NAVER.COM') ;


-- ģ���� ������ �ֱ�
INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES ('SMHED02','00000','Ȳ�ص�',SYSDATE, 31, NULL, '' ) ;
--> ��������� NULL���� �Է��Ѵ�.


-- ģ���� ������ �ֱ�(2)
INSERT INTO JUN_JOIN ( ID,PW,NAME,JOIN_DATE,AGE )
VALUES('SMHRD03','11111','����ǥ',SYSDATE,21 ) ;
--> �Ͻ������� NULL���� �Է��Ѵ�.

-- ģ���� ������ �ֱ�(3)
INSERT INTO JUN_JOIN (ID,PW,NAME,JOIN_DATE,AGE,TEL,EMAIL)
VALUES('SMHRD04','22222','������',SYSDATE,24,'010-2222-2222','BONG@NAVER.COM');

-- ���̺� ������ ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

-- UPDATE : ���̺��� �����͸� �����ϰ� ������ ���
-- �����
-- UPDATE ���̺� �̸�
-- SET ������ �÷� = ������ 
-- WHERE �����͸� ������ ��� ���� �����ϱ� ���� ���ǽ� ;
--> *** WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�!!!

SELECT * FROM JUN_JOIN;

UPDATE JUN_JOIN
SET AGE = 25 
WHERE NAME = '������' ; 


UPDATE JUN_JOIN
SET TEL = '010-2222-3333' , EMAIL = 'HE@NAVER.COM'
WHERE NAME = 'Ȳ�ص�' ;
-- DML�� ��ɹ��� ���� ���ǹ��� �÷��� PK�� �ϴ°��� ��Ģ�̴�!!

-- DELETE : �����͸� �����Ҷ� ����ϴ� �����
-- �����
-- DELETE FROM ���̺� �̸�
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
--> *** WHERE �������� ���� �� ��� ���̺��� ��� �����Ͱ� ������ �ȴ�!!

DELETE FROM JUN_JOIN
WHERE ID = 'SMHRD03' ;

SELECT * FROM JUN_JOIN;

-- 30�� ������ ȸ������ ������ ����
DELETE  FROM JUN_JOIN
WHERE AGE <= 30 ; 





