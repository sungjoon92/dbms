(����Ŭ ����� ���� ����)

--���� ������ ���� �����ؾ� ��
--alter session set "_ORACLE_SCROPT" = true;  ��Ÿ
alter session set "_ORACLE_SCRIPT"=true;

--����� ���� ���
select uesrname from all_useres;

--���̺� �����̽�  (���̺��� ���尣) ����
���� create tablespace
datafile '������ ���ϰ��' sizs �ʱ������
autoextend onnext �ڵ�����������
maxsize �ִ������,

--���̺� �����̽� ���� Ȯ��
create tablespace itwill
datafile 'D:\java202307\database\section0828\itwill.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;
//////////////////////////////////////////////////////////
--����)
create user ���̵� identified by ���
      default tablespace ���̺����̽��̸�;
      
--����)
create user java202307 identified by 1234
default tablespace itwill;

--����� ���� ���
select username from all_users;

--��� ���� �ο�
grant connect, resource, dba to java202307;

commit;

--��� ������Ʈ���� ���� �ο��� java202307 �α����ϱ�
>sqlplus java202307/1234
///////////////////////////////////////

drop user java202307 cascade;
commit;



--���̺����̽� ����
--����)
drop tablespace ���̺����̽���
      including contents and datafiles
      cascade constraints;
      
      
      
--����) 
drop tablespace itwill
      including contents and datafiles
      cascade constraints;