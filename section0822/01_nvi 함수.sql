nvl () �Լ� - null���� �ٸ������� �ٲ�

����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select max(kor), count(*)
from sungjuk
where addr='Incheon';       --�ִ밪(null), �ο��� 0

select count(*)+1           --0+1
from sungjuk
where addr='Incheon'; 


select max(kor)+1           --null+1 -> null���� ������ �� ����
from sungjuk
where addr='Incheon';  

select nvl(max(kor), 0)     -- 0���� ��ȯ  
from sungjuk
where addr='Incheon';  

select nvl(max(kor), 0)+1     -- 0���� ��ȯ ��+1 
from sungjuk
where addr='Incheon';  

select nvl(max(kor), 0)+1 as max_kor    
from sungjuk
where addr='Incheon';  

////////////////////////////////////////////////////////////////

select * from sungjuk order by sno desc;
����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�

sno : max(sno)+1
��, max() ����  null�̸� 0���� �ٲ��� ����Ѵ�

uname   : �����
kor     : 100
eng     : 100
mat     : 100
addr    : seoul
wdate   : sysdate

-- 1) snoĮ������ ���� ū�� ���ϱ�
select max(sno) from sungjuk;

-- 2) ���� 1)����� null
select nvl(max(sno),0) from sungjuk;

select nvl(max(sno),0)+1 from sungjuk;


insert into sungjuk(nvi(max(sno), 0)+1, uname, kor, eng, mat, addr, wdate)
values((selectsungjuk. nextval, '�����', 100, 100, 100, 'seoul');