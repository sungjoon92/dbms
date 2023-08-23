[����Ŭ �Լ�]


--���� ���̺� : dual (�ӽ� ������ table)


1. ���ڿ� ���� �Լ�
select lower('hello world') from dual;          --���� �ҹ��ڷ� ��ȯ
select upper('hello world') from dual;          --���� �ҹ��ڷ� ��ȯ
select length('hello world') from dual;         --���� ����
select substr('hello world', 1, 5) from dual;   --���ڿ� �ڸ���(ù��° ���ں��� 5��) 'hello'

select instr('helloworld', 'w') from dual;      --Ư������ ��ġ6
select lpad('SKY', 5, '*') from dual;           --5ĭ������ ����ϰ� ���� ��ĭ�� *�� ä��
select rpad('SKY', 5, '*') from dual;           --5ĭ������ ����ϰ� ������ ��ĭ�� *�� ä��
select replace('happy', 'p', 'k') from dual;    --Ư������ ��ȯ


-- ���ڿ� �����ϱ�
select concat('�ι̿�','�ٸ���') from dual;      --�ι̿��ٸ���
select concat(uname, '�� �����'), concat(aver, '�Դϴ�')from sungjuk;
select concat(uname, '�� �����')as �̸� , concat(aver, '�Դϴ�')as ��� from sungjuk;

-- ���� ������ ||
select uname || '�� �����' || aver || '�Դϴ�' from sungjuk;
select uname || '�� �����' || aver || '�Դϴ�' as str from sungjuk;

--ASCII ���ں�ȯ
select chr(65) from dual;        --A
select chr(66) from dual;        --B
select chr(97) from dual;        --a
select chr(68) from dual;        --b

select '%' ||chr(32) || '#' from dual; --����

select chr(43) from dual;        --+
select chr(45) from dual;        ---
select chr(42) from dual;        --*
select chr(47) from dual;        --/


//////////////////////////////////////////////////



2. ���� ���� �Լ�
select abs(-7) from dual;            -- ���밪
select mod(5,3) from dual;           -- ������ �Լ�
select cell(12.4) from dual;         -- �ø��Լ�
select trunc) from dual;             -- �����Լ�


select avg(43) from sungjuk;            -- 66.363636
select cell(kor)) from sungjuk;         -- 67
select trunc(avg(kor),2) from sungjuk;  -- 66.36
select round(avg(kor),2) from sungjuk;  -- 66.36

////////////////////////////////////////////////////////////

3. ��¥ ���� �Լ�

select sysdate from dual;  -- �ý����� ���� ��¥�� �ð� ������ �����ϴ� �Լ�

-- ��¥������ ����
select sysdate+100 from dual;       --���ó��� +100��
select sysdate-100 from dual;       --���ó��� -100��

--sysdate���� ����� ȣ���ϱ�
select extract(year from sysdate) from dual;    --2023
select extract(month from sysdate) from dual;   --8
select extract(day from sysdate) from dual;     --22

--�ΰ��� ��¥�����Ϳ��� ���� �� ���
select months_between('2023-08-22', '2022-10-30') from dual;      --  9.7
select months_between('2023-08-22', '2023-12-31') from dual;      -- -4.2
///////////////////////////////////////////////////////////////////////

4. ����ȯ �Լ�
-- to_char(���� ��¥, '���ϴ� ���')
-- ���ڿ� ��¥�� ���ڷ� ��ȯ�� �ִ� �ΰ������
select to_char(sysdate, 'yyyy-mm-dd') from dual;    --2023-08-22
select to_char(sysdate, 'mm/dd/yyyy') from dual;    --08/22/2023
select to_char(sysdate, 'dd-mon-yyyy') from dual;   --22-8�� -2023

select to_char(sysdate, 'yyyy') from dual;    -- 2023
select to_char(sysdate, 'mm') from dual;      -- 08
select to_char(sysdate, 'dd') from dual;      -- 22


4. ����ȯ �Լ�