[��������]
= sql�� �� ��ٸ� sql��
���̺� ������ �ٽ��ѹ� �������� ���� �� ��ȸ �� �˻�

--���������� ����� ��ȸ�Ͻÿ�

select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


��1) �������� ��� (66)���� ���� ���� ������ ��ȸ�Ͻÿ�
select uname, kor from sungjuk where kor>=66;
select uname, kor from sungjuk where kor>=(select round(avg(kor),0) from sungjuk);

��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select kor from sungjuk where addr='Seoul';
select avg(kor) from sungjuk where addr='Seoul';
select round(avg(kor),0) from sungjuk where addr='Seoul';

select addr, uname, kor from sungjuk where kor>=73;

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');

��3) ���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
--   ��2) ��������� ���������� �����Ͻÿ�

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul')
and addr <> 'Seoul';


��4) ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���� ������ �ִ��� ��ȸ�Ͻÿ�


select min(kor) from sungjuk;   --������ ���������� ã�´� --20


select uname, kor, eng, mat  --�̸�,��,��,�� ������ ������
from sungjuk
where mat <=20 or eng <=20;  --���а� ���������� 20������ ������ �ִ���Ȯ��

select uname, kor, eng, mat                     --�ؿ��� ������� �̸��� ���������� �����ְ� ���п��������� where���� ������Ѽ� ������
from sungjuk
where mat <=(select min(kor) from sungjuk)      --���������� ������ �������� �������� ������ ������
            or
      eng <=(select min(kor) from sungjuk);     --���������� ������ �������� �������� ������ ������