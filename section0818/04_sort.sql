�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 04_sort.sql
   ->������ġ : E:\java202307\database\section0818
///////////////////////////////////////////////////////////////////////////////


�� [Sort ����]
   - Ư����(keyfield)�� �������� ������� ���ġ
   - �������� Ascending Sort   ASC` 1->10  A->Z  a->z  ��->��
   - �������� Descending Sort  DESC
   - ����) order by Į����1, Į����2, Į����3, ~~
   

-- sungjuk ���̺��� ��ȸ�Ͻÿ�
select * from sungjuk;   

-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸ�Ͻÿ�
select uname
from sungjuk
order by uname asc;   --�������� ����

select uname
from sungjuk
order by uname;       --asc ��������

select uname
from sungjuk
order by uname desc;  --�������� ����


--�������������� �����ؼ� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
order by kor;
   
   
--1�� ���� : �������������� ����
--2�� ���� : ���������� ���ٸ� �̸��� �������� �������� ����   
select uname, kor   
from sungjuk
order by kor, uname desc;
   
   
--1��(kor), 2��(eng), 3��(mat) �������� ����   
select uname, kor, eng, mat   
from sungjuk
order by kor desc, eng desc, mat desc;
   
   
--����) ��� 70�� ���� ���� �̸������� ��ȸ�Ͻÿ�

-- ��� 70�� ������ ��ȸ
select uname, aver from sungjuk where aver<=70;

select uname, aver from sungjuk where aver<=70 order by uname;

select uname, aver from sungjuk order by uname where aver<=70; -- ORA-00933 ���� �߻�












   
   