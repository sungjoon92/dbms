�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 03_csv���Ϻ�ȯ.sql
   ->������ġ : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////////

�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=190


�� [CSV ����]
  - ��� �����Ͱ� , �� ���еǾ� �ִ� ����


�� [CSV ������ �����ͺ��̽��� ��������]  
   - �������������� https://data.go.kr/ Ȱ��
////////////////////////////////////////////////////////////////////////////////


��1) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.csv �غ� (258267��)

--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro (
    zipno       char(5)        --�����ȣ
   ,zipaddress  varchar2(4000) --�ּ�
);

drop table zipdoro; --���̺� ����


--3) ��������� ��������
    - zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
    - zipdoro ���̺� ��Ŭ�� -> export      (��������)


--4)��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro; 
///////////////////////////////////////////////////////////////////////////////


��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)
create table school (
    schoolid    varchar2(10)   --�б�ID
  , schoolname  varchar2(255)  --�б���
  , schoolgubun varchar2(20)   --�б��ޱ���
  , schooladdr  varchar2(2000) --���������θ��ּ�
  , cdate       date           --�������� (���� YYYY-MM-DD)
  , udate       date           --�������� (���� YYYY-MM-DD)
  , latitude    number(20,10)  --����
  , longitude   number(20,10)  --�浵
);

commit;
select count(*) from school;
select * from school;


--����1) ����ִ� ��(null)�� ã���ÿ�
select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null;   --B000027204�࿡�� ��� ����
select * from school where cdate is null;
select * from school where udate is null;
select * from school where latitude is null;
select * from school where longitude is null;


--����2) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�
select substr(schooladdr,0, instr(schooladdr,' ',1,1))
     , schoolgubun
     , count(*) 
from school 
group by substr(schooladdr,0, instr(schooladdr,' ',1,1)), schoolgubun
order by substr(schooladdr,0, instr(schooladdr,' ',1,1)), schoolgubun desc;













































