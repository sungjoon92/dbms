�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 04_����.sql
   ->������ġ : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////////

��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)

--�����α������� ���� ��ȸ�ϱ�
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1)������ �������߿��� ������ ���� ���� ���� ��ȸ�ϱ�
select max(ghakjum)    --5
from tb_gwamok 
where gcode like 'd%'; 

--2) 1)������� ���� ����(5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
--   ��, ������ �������߿��� ������ ���� ���� �����ڵ� (��, �ߺ��� ������ ���ٴ� �����Ͽ�)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%';  --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';  --d002

--3) 2)���� ���� �����ڵ�(d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno 
from tb_sugang 
where gcode=(
                select gcode
                from tb_gwamok
                where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                and gcode like 'd%'
            );

--4) 3)�� ����� AA���̺�� ���� ��, �л� ���̺��� �����ؼ� �̸� ��������
select ST.uname, AA.hakno, AA.gcode
from (
        select gcode, hakno 
        from tb_sugang 
        where gcode=(
                        select gcode
                        from tb_gwamok
                        where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                        and gcode like 'd%'
                    )
     ) AA join tb_student ST
on AA.hakno=ST.hakno;
///////////////////////////////////////////////////////////////////////////////



��2) �й��� ������û�� �������� ���ϰ� �й������� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��)
    
--�л����̺� ��ȸ�ϱ�
select hakno, uname from tb_student order by hakno;

--1)������û�� ������ ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2)�й����� ������ ���ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno;

--3) ������û���� ���� �л��鵵 ������ �� �ֵ��� �л����̺� left join �ϰ�,
     2)��� (AA���̺�)�� ����
select ST.hakno, ST.uname, AA.hakno, AA.������     
from tb_student ST left join (
                               select SU.hakno, sum(GW.ghakjum) as ������
                               from tb_sugang SU join tb_gwamok GW
                               on SU.gcode=GW.gcode
                               group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno;

--4)�������� null�̸� 0���� �ٲٰ�, �й������� ��ȸ�ϱ�
select ST.hakno, ST.uname, nvl(AA.������, 0)
from tb_student ST left join (
                               select SU.hakno, sum(GW.ghakjum) as ������
                               from tb_sugang SU join tb_gwamok GW
                               on SU.gcode=GW.gcode
                               group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--5) �ٹ�ȣ �߰� (�ٹ�ȣ�� �ִ� ���¿��� ���ĵ�)
select ST.hakno, ST.uname, nvl(AA.������, 0), rownum
from tb_student ST left join (
                               select SU.hakno, sum(GW.ghakjum) as ������
                               from tb_sugang SU join tb_gwamok GW
                               on SU.gcode=GW.gcode
                               group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--6) 5�� ����� ���������ϰ� ����, �ٹ�ȣ �߰��ϱ�
select BB.hakno, BB.uname, BB.������2, rownum as rnum
from (
       select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
       from tb_student ST left join (
                                      select SU.hakno, sum(GW.ghakjum) as ������
                                      from tb_sugang SU join tb_gwamok GW
                                      on SU.gcode=GW.gcode
                                      group by SU.hakno
                                    ) AA
       on ST.hakno=AA.hakno
       order by ST.hakno
     )BB;

--7) 6)�� ����� ��������(CC���̺�)�ϰ� �ٹ�ȣ(rnum) 4~6 ��ȸ�ϱ�
select CC.hakno, CC.������2, rnum
from (
       select BB.hakno, BB.uname, BB.������2, rownum as rnum
       from (
              select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
              from tb_student ST left join (
                                             select SU.hakno, sum(GW.ghakjum) as ������
                                             from tb_sugang SU join tb_gwamok GW
                                             on SU.gcode=GW.gcode
                                             group by SU.hakno
                                           ) AA
              on ST.hakno=AA.hakno
              order by ST.hakno
            )BB
)CC
where rnum>=4 and rnum<=6
///////////////////////////////////////////////////////////////////////////////


��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������)

-- �������̺� ���߰� ���ּ���
-- (�������� �� ���� ���̿��� ���Ȯ���ϱⰡ ���� �ָ� �մϴ�)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

--1) �����ڵ尡 ��ġ�ϴ� ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode

--2) �й����� ������ ���ϰ�, ������������ �������� �����ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by sum(GW.ghakjum) desc;

--3) 2)�� ����� AA���̺�� �����, �л����̺� �����ؼ� �̸� ��������
select AA.hakno, AA.������, ST.uname, rownum as rnum
from(
       select SU.hakno, sum(GW.ghakjum) as ������
       from tb_sugang SU join tb_gwamok GW
       on SU.gcode=GW.gcode
       group by SU.hakno
       order by sum(GW.ghakjum) desc
    )AA join tb_student ST
on AA.hakno=ST.hakno;    


--4) 3)�� ����� ���������ϰ� �ٹ�ȣ�� �̿��ؼ� ������ ���� 1�Ǹ� ��ȸ�ϱ�
select hakno, ������, uname, rnum
from(
       select AA.hakno, AA.������, ST.uname, rownum as rnum
       from(
              select SU.hakno, sum(GW.ghakjum) as ������
              from tb_sugang SU join tb_gwamok GW
              on SU.gcode=GW.gcode
              group by SU.hakno
              order by sum(GW.ghakjum) desc
           )AA join tb_student ST
       on AA.hakno=ST.hakno
)
where rnum=1;
