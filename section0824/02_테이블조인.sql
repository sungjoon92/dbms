�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 02_���̺�����.sql
   ->������ġ : E:\java202307\database\section0824   
///////////////////////////////////////////////////////////////////////////////

�� [���̺� ����]

  - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
  - �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
  - �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����
  
  ����)
      select Į����
      from ���̺�1 join ���̺�2   -- ǥ�� SQL�� (ANSI)
      on ������;
  
      select Į����
      from ���̺�1 , ���̺�2      -- Oracle DB SQL��
      on ������;
      
      select T1.*, T2.*         -- T1.���Į��, T2.���Į��
      from T1 inner join T2     -- inner ��������
      on T1.x = T2.x;           -- ���̺��.Į����
      
      select T1.*, T2.*, T3.*
      from T1 join T2
      on T1.x = T2.x  join  T3
      on T1.y = T3.y;                -- 3�� ���̺� ����
      
      select T1.*, T2.*, T3.*, T4.*  -- 4�� ���̺� ����
      from T1 join T2
      on T1.x = T2.x join T3
      on T1.y = T3.y join T4
      on T1.z = T4.z;
      

      
�� ������ : where ������, having ������, on ������     
      
      
�� ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
   - ������ ���̺� : ���� create table�� ���̺�
   - ���� ���̺� : SQL���� ���� ������ ���̺�      
///////////////////////////////////////////////////////////////////////////////

�� inner join ����  

select * from tb_sugang; 

-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �� ���̺��� ������ ����. inner ��������(���� �⺻)
select * --�����̺��� ��� Į��
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


--�����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


--3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- ���̺��� alias(��Ī)�� �����ϴ� (��ҹ��� ���о���)
select SU.*, ST.uname, ST.email
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode;

select *  -- ������̺��� ��� Į�� ��ȸ�ϱ�
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode;

-- Į�� ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ� 
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode;

--�ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ� 
--ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, gcode, uname, email, gname, ghakjum   --����
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode;








  
  