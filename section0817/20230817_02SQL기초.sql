�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 20230817_02SQL����.sql
   ->������ġ : E:\java202307\database\section0817
///////////////////////////////////////////////////////////////////////////////

[sungjuk ���̺� ����]
drop table sungjuk;


[sungjuk ���̺� ����]
create table sungjuk (
    uname varchar(50) not null  --���� ������� ����
                                --������ 50���� �̳����� �Է�
                                --�ѱ� 16���� �̳� �Է�
   ,kor   int         not null                           
   ,eng   int         not null
   ,mat   int         not null
   ,tot   int         null      --�� ���
   ,aver  int                   --null ��������
);
////////////////////////////////////////////////////////////////////////////////

[���� ������ ���߰�]
insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('������',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);
commit;
////////////////////////////////////////////////////////////////////////////////

[��ü ���ڵ� ��ȸ]
select uname, kor, eng, mat, tot, aver from sungjuk;

[��ü �� ���� ��ȸ]
select count(*) from sungjuk;

[select ��ȸ �� �˻�]
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk; --��ü ��� Į�� ��ȸ

[as] --Į������ �ӽ� ����
select kor as korea, eng as english, mat as mathe 
from sungjuk;

-- as ��������
select kor korea, eng english, mat mathe 
from sungjuk;

--�ӽ� �ѱ� Į������ �Ͻ������� �м��ؾ� �ϴ� ��츸 ��õ!!
select uname as �̸�, kor as ����, eng as ����, mat as ����, tot ����, aver ���
from sungjuk;

--Į���� ������ �ǹ̰� ����
select uname, kor, eng, mat from sungjuk;
select kor, mat, eng from sungjuk;


[count �Լ�] - �� ���� ��ȸ
select count(uname) from sungjuk; --10
select count(kor) from sungjuk;   --10
select count(eng) from sungjuk;   --10
select count(mat) from sungjuk;   --10

select * from sungjuk; --��ü �� ��ȸ

--null���� ī��Ʈ���� �ʴ´�
select count(tot) from sungjuk;   --0
select count(aver) from sungjuk;  --0

select count(eng) from sungjuk;
select count(eng) as cnt_eng from sungjuk;
select count(mat) as ���а��� from sungjuk; --�ӽ� Į�������� �ѱ� ����

--sungjuk ���̺��� ��ü ���� ����
select count(*) from sungjuk;
select count(*) as ��ü�హ�� from sungjuk;
select count(*) ��ü�హ�� from sungjuk;








