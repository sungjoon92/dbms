�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 05_������.sql
   ->������ġ : E:\java202307\database\section0818
////////////////////////////////////////////////////////////////////////////////

�� [�ڵ����� �Ϸù�ȣ �ο�]

- Oracle Database : sequence ����
- M*SQL Database  : identity ��������
////////////////////////////////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
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

-- ���߰� �׽�Ʈ
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (1, 'ȫ�浿', 89, 88, 77, 'Seoul', '2023-08-18'); --��¥ �����ʹ� ���ڿ� ���·� �߰��Ѵ�

select * from sungjuk; --��ü �� ��ȸ
delete from sungjuk;   --��ü �� ����
commit;                --��ɾ� �Ϸ�
////////////////////////////////////////////////////////////////////////////////


�� [������ Sequence]
  - �Ϸù�ȣ �ڵ� ����
  - ������ ���� : create sequence ��������;
  - ������ ���� : drop sequence ��������;


-- ������ ���� ����)
create sequence ��������
increment by ������ start with ���۰�;

-- sungjuk���̺��� ����� ������ ����  
create sequence sungjuk_seq;

-- sungjuk_seq ������ ����
drop sequence sungjuk_seq; 



�� [sysdate �Լ�] - �ý����� ���� ��¥ ���� 

////////////////////////////////////////////////////////////////////////////////


-- �������� sysdate�Լ��� �̿��� ���߰� �׽�Ʈ
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, 'ȫ�浿', 89, 88, 87, 'Seoul', sysdate );

select * from sungjuk;

--����) sno=3���� �����Ͻÿ�
delete from sungjuk where uname='ȫ�浿';
delete from sungjuk where kor=89;
delete from sungjuk where sno=3;








