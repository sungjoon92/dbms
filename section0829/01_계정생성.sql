�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 01_��������.sql
   ->������ġ : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////////

�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=182

�� [����Ŭ ����� ���� ����]


--���� ������ ���� �����ؾ� ��
alter session set "_ORACLE_SCRIPT"=true;


--����� ���� ���
select username from all_users;


--���̺����̽�(���̺��� ���� ����) ����
����) create tablespace ���̺����̽��̸�
      datafile '���������ϰ��' size �ʱ������
      autoextend on
      next �ڵ�����������
      maxsize �ִ������;

create tablespace itwill
datafile 'E:\java202307\database\section0828\itwill.dbf' size 50m 
autoextend on
next 10m
maxsize unlimited;


--���̺����̽� ���� Ȯ��
select tablespace_name, contents from dba_tablespaces;
///////////////////////////////////////////////////////////////////////////////


--����� ���� ����
����) create user ���̵� identified by ���
      default tablespace ���̺����̽��̸�;

      
����)
create user java202307 identified by 1234
default tablespace itwill;

--����� ���� ���
select username from all_users;

--��� ���� �ο�
grant connect, resource, dba to java202307;

�� connect   ���ӱ���
   resource  �����ͺ��̽��ȿ� �ִ� �ڿ����� ����� �� �ִ� ����
   dba       �����ڱ���


-- ���������Ʈ���� ���� �ο��� java202307 �α��� �ϱ�
>sqlplus java202307/1234
///////////////////////////////////////////////////////////////////////////////

--����� ���� ����
drop user java202307 cascade;


--���̺����̽� ����
����) drop tablespace ���̺����̽���
      including contents and datafiles
      cascade constraints;

����)
drop tablespace itwill
including contents and datafiles
cascade constraints;




