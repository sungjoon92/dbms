��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

select * from tb_sugang;


-- �������̺�+�л����̺�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--'����'�� ��ȸ�ϱ�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address= '����';


--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�

select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        ) AA;
        
        --�ߺ��������� �����߻�
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from(
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        ) AA;

select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        ) AA
where AA.address='����';

--AA ��������
select hakno, gcode, uname, address
from(
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        )
where address='����';


��2) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
        d001	HTML	2��
        d002	���伥	1��
        d003	�Ϸ���Ʈ	1��
        p001	JAVA	4��
        p002	Oracle	2��
        p003	JSP     2��
        p004	Python	1��
        p005	AJAX	1��
        


--1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�

select * from tb_sugang order by gcode;
        
--2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ�ϱ�
select gcode, count(*)
from tb_sugang
group by gcode;

--3 2)�� ����� AA���̺�� �����ϰ� �������̺� �����ϱ�
select AA.gcode, GW.gname, concat(AA.cnt, '��') �ο���
from (
      select gcode, count(*) as cnt
      from tb_sugang
      group by gcode
     )AA join tb_gwamok GW
     on AA.gcode = GW.gcode
order by AA.gcode;




------------------------ �л����̺�
--create table tb_student(
--   hakno    char(5)     not null         --�й�
--  ,uname    varchar(20) not null         --�̸�
--  ,email    varchar(20) unique           --�̸���
--  ,address  varchar(20) not null         --�ּ�
--  ,phone    varchar(20)                  --��ȭ��ȣ
--  ,regdt    date        default sysdate  --�����
--  ,primary key(hakno)                    --�⺻Ű
--);


---------------------- �������̺�

--create table tb_gwamok(
--   gcode    char(4)      not null        --�����ڵ� (p:���α׷�������, d:�����α�����)
--  ,gname    varchar(20)  not null        --�����̸�
--  ,ghakjum  varchar(2)   default 1       --���� -99 ~ 99
--  ,regdt    date         default sysdate --�����
--  ,primary key(gcode)                    --�⺻Ű
--);


------------------------ �������̺�
--create table tb_sugang(
--   sno    number     not null   --�Ϸù�ȣ
--  ,hakno  char(5)    not null   --�й�
--  ,gcode  char(4)    not null   --�����ڵ�
--  ,primary key(sno)             --�⺻Ű
--);


select * from tb_sugang;
select * from tb_gwamok;
select * from tb_student;



��4) ������û�� ���� ���� �л����� �й�, �̸� ��ȸ
-- ��ü �л� ��ȣ Ȯ��
select hakno
from tb_sugang
order by hakno;

-- distinct �Լ��� Ȯ��
select distinct hakno 
from tb_sugang
order by hakno;

-- �׷�ȭ�� Ȯ��
select hakno 
from tb_sugang
group by hakno;

-- �л��ѹ��� �л��̸�Ȯ��
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

-- �л��ѹ��� �л��̸�Ȯ��(in������)
select hakno, uname
from tb_student
where hakno in('g1001','g1002','g1005','g1006');

-- 1) �� ����� �������� ���·� ����
select hakno, uname
from tb_student
where hakno in(select hakno from tb_sugang group by hakno);

-- not �����ڷ� �ƴ��� ���
select hakno, uname
from tb_student
where hakno not in(select hakno from tb_sugang group by hakno);



��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python
     
select hakno, gcode
from tb_sugang
where hakno = 'g1001';

select hakno, SU.gcode, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where hakno = 'g1001'
order by SU.gcode;   
     
��6) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
        g1001	ȫ�浿	14����
        g1002	ȫ�浿	8����
        g1005	���޷�	12����
        g1006	������	3����
    
-- �̸����ϱ�
select uname
from tb_student; 

--�������̺� �л����̺� �������̺� ���ļ� �й�,�̸�,���� ���ϱ�
select SU.hakno, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on GW.gcode = SU.gcode;
        
        
select SU.hakno, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on GW.gcode = SU.gcode;









        
��7) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��


