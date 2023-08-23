�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 06_�������̺�.sql
   ->������ġ : E:\java202307\database\section0818
////////////////////////////////////////////////////////////////////////////////

--sungjuk���̺� ����
drop table sungjuk;

--sungjuk���̺� ����
create table sungjuk (
    sno   int         not null  --�Ϸù�ȣ
   ,uname varchar(50) not null
   ,kor   int         not null 
   ,eng   int         not null
   ,mat   int         not null
   ,tot   int         
   ,aver  int   
   ,addr  varchar(20)          --�ּ�
   ,wdate date                 --�ۼ���(����Ͻú���)
);

--sungjuk���̺� ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'����Ƽ��', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

commit;
select count(*) from sungjuk;  --��ü ���ڵ� ����
select * from sungjuk;
///////////////////////////////////////////////////////////////////////////////

�� [����]

-- ��1) ��ü�࿡ ���ؼ� ����(tot), ���(aver)�� ���Ͻÿ�
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select * from sungjuk


-- ��2) �̸��� '��' ���ڰ� �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';


-- ��3) �ּҰ� ����, ���� ���� ��ȸ�Ͻÿ�
select uname, addr
from sungjuk
where addr='Seoul' or addr='Jeju';

select uname, addr
from sungjuk
where addr in ('Seoul', 'Jeju');


-- ��4) ������ ������ ��� 90�� �̻� ���� ����� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

select count(*)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

select count(*) as cnt  --Į���� ����
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

select count(*) cnt     --as ��������
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

select count(*) ����   --�ѱ۰���
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


-- ��5) �ּҺ��� �����ؼ� ��ȸ�Ͻÿ�.
--      �ּҰ� ���ٸ� �Ϸù�ȣ ������������ �ٽ� �����ؼ� ��ȸ�Ͻÿ�

select uname, addr from sungjuk order by addr;
select uname, addr, sno from sungjuk order by addr, sno desc;








