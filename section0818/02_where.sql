�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 02_where.sql
   ->������ġ : E:\java202307\database\section0818
///////////////////////////////////////////////////////////////////////////////

[sungjuk ���̺� ����]
drop table sungjuk;

[sungjuk ���̺� ����]
create table sungjuk (
    uname varchar(50) not null
   ,kor   int         not null                           
   ,eng   int         not null
   ,mat   int         not null
   ,tot   int         null    
   ,aver  int                 
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

[sungjuk ���̺� ��ȸ]
select * from sungjuk;
////////////////////////////////////////////////////////////////////////////////


�� [where ������]
  - ������ �����ϴ� ��鿡 ���ؼ�
  - ���ǿ� �����ϴ� ���ڵ常 ������� ��ȸ(select), ����(update), ����(delete)�ϱ� ���ؼ�

  
--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�  
select uname, kor
from sungjuk
where kor>=50;


--��2) ���������� 50���̸� ���� ��ȸ�Ͻÿ�  
select uname, eng
from sungjuk
where eng<50;

  
--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='���ѹα�';


--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�   
select uname, kor, eng, mat
from sungjuk
where uname!='���ѹα�';   --�¿찡 ���� ���� �ʴ�

select uname, kor, eng, mat
from sungjuk
where uname<>'���ѹα�';   --�¿찡 ���� ���� �ʴ�
  
  
--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat<40;


--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor>=80 and kor<=89;


--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname='����ȭ' or uname='����ȭ';


--��9) ��, ��, �� ��� 100�� �ƴ� ���� ��ȸ�Ͻÿ�  
select uname, kor, eng, mat
from sungjuk
where kor=100 and eng=100 and mat=100;  --������ ��� 100�� �� ��ȸ

select uname, kor, eng, mat
from sungjuk
where not (kor=100 and eng=100 and mat=100);

select uname, kor, eng, mat
from sungjuk
where not kor=100 and eng=100 and mat=100;



  
  
  
