�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 20230817_01SQL����.sql
   ->������ġ : E:\java202307\database\section0817
   
�� [NCS �н� ���] - ����SW ���� ��� Ȱ��
  3-3 ������ �����ͺ��̽� ���̺� ���� (p95)   
////////////////////////////////////////////////////////////////////////////////

-- ���� ����Ű : Ctrl + Enter

-- ���̺� ����
create table sungjuk (
    uname varchar(20)
   ,kor   int
   ,eng   int
   ,mat   int
   ,aver  int
);


-- ���̺� ����
drop table sungjuk;


�� [sungjuk ���̺� CRUD �۾�]

1. ���߰� (Create)
insert into sungjuk (uname, kor, eng, mat)
values ('����ȭ', 80, 85, 100);

insert into sungjuk (uname, kor, eng, mat)
values ('ȫ�浿', 90, 100, 50);


2. ��ȸ �� �˻� (Read)
select uname, kor, eng, mat, aver
from sungjuk;


3. ����� (Update)
update sungjuk
set aver=(kor+eng+mat)/3;


4. ����� (Delete)
delete from sungjuk;





















