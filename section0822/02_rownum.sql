�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 02_rownum.sql
   ->������ġ : E:\java202307\database\section0822
////////////////////////////////////////////////////////////////////////////////

�� ���� Į��
  - Oracle DBMS���� ������ �ش�
  - rownum ���ȣ
  - rowid  ���� �ּҰ�
  
select * from sungjuk;
select sno, rowid from sungjuk;
select sno, rowid, rownum from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';

select sno, uname, kor, rownum
from sungjuk
where kor between 80 and 89;

--�ڽ��� ���ȣ�� �����ؼ� ���ĵ�. rownum�� �߰��ϴ� ������ ����ؾ� ��.
select sno, uname, addr, rownum  
from sungjuk
order by uname;



