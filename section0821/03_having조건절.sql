[having ������]
- hroup by �� ���� ����ϴ� ������
    �׷�ȭ�� �ϰ� �� ���� �������� �߰�
    ����) having ������
    
    
--�ּҿ� �ο����� ��ȸ�Ͻÿ�

select addr, count(*)
from sungjuk
group by addr;

-- �ּҺ� �ο����� 3�̻��� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

--��1)�ּҺ� ������հ��� 50�̻� ���� ��ȸ�Ͻÿ�
--    (��, ��հ��� �Ҽ������� �ݿø�)

1) �ּҺ� ������հ� ���ϱ�
select addr, avg(kor)
from sungjuk
group by addr;

2) ������հ��� �Ҽ������� �ݿø��ϱ�
select addr, round(avg(kor), 0)
from sungjuk
group by addr;

3) 2)������� ���� ��հ��� 50�̻� ��ȸ�ϱ�
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0) >=50;

4) 3)������� ������հ��� �������� ��ȸ�ϱ�
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0) >=50
order by round(avg(kor), 0) desc;

5) 4)������� ������հ� Į������ avg_kor�� �����ϱ�
select addr, round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
having round(avg(kor), 0) >=50
order by round(avg(kor), 0) desc;

--��2) ���(aver)�� 70�̻� ���� ������� �ּҺ� �ο����� ������
--     �� �ο����� 2�̸� ���� �ο��� ������ ��ȸ�Ͻÿ�

1) ��ü �� ��ȸ
select * from sungjuk order by aver desc;


2) ���(aver) ���� 70�̻��� �� ��ȸ
select *
from sungjuk
where aver>=70;

3) 2)������� �ּҺ� �ο����� ���Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=70
group by addr;

4) 3)������� �� �ο����� 2�̸� �� ��ȸ
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*) < 2;

5) 4)������� �ο��� ������ ��ȸ
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*) < 2
order by cnt;      --order by count(*); �ĵ� �ʤ�    
 

















