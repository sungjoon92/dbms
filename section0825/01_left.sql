left join �� right join
--�л����̺��� ��� ���� ��������, �������̺��� �й��� ��ġ�ϴ� �ุ ��������
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno;

��1) right join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno
where SU.hakno is null ;

[ (+) ��ȣ�� �̿��� ���̺����� ]
(+)��ȣ�� ��ġ�����ʴ� ���� �������� ���� �ʿ� ���δ�;

select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_student ST, tb_sugang SU
where ST.hakno = SU.hakno(+);

select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_student ST, tb_sugang SU
where SU.hakno(+) = ST.hakno;