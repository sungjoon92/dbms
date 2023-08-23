drop table sungjuk;


create table sungjuk (
    sno     int          primary key --�⺻Ű (���ϼ�)
    ,uname  varchar(10)  not null
    ,kor    int          check(kor between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,eng    int          check(eng between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,mat    int          check(mat between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,addr   varchar(50)  check(addr in('seoul','jeju','busan','suwon'))
    ,tot    int          default 0
    ,aver   int          default 0
    ,wdate  date         default sysdate              -- ���� ��¥ �Լ�
    ,email  varchar(50)  unique                       -- �ߺ��Ȱ� ������ ����
    
);

pri���̺� �������� ���� �޼���
-- 1) primary kye ��������//////////////////////////////////////////////
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007344)�� ����˴ϴ�
-- �ߺ��ɼ� ���� not null �Ӽ��� ����������
insert into sungjuk(sno) values(1); 

-- 2) not null ����//////////////////////////////////////////////////
--ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(1); --uname Į���� not null �����̹Ƿ� �ݵ�� ���� �Է��ؾ���
insert into sungjuk(sno, uname) values(1, 'korea');
insert into sungjuk(sno, uname) values(2, '���ѹα�');
insert into sungjuk(sno, uname) values(3, '���ѹα�');

-- uname varchar(10) �ϰ� ���ڰ��� �׽�Ʈ
insert into sungjuk(sno, uname) values(1, '1234567890');
insert into sungjuk(sno, uname) values(2, 'abcdefghij');

--SQL ����: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 11, �ִ밪: 10)
insert into sungjuk(sno, uname) values(3, 'abcdefghijk');

insert into sungjuk(sno, uname) values(4, '����ȭ');

--SQL ����: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
--�ѱ��� ���ڴ� 3bite�� ����������
insert into sungjuk(sno, uname) values(5, '���ѹα�');


--3) check��������////////////////////////////////////////////
--ORA-02290: üũ ��������(SYSTEM.SYS_C007354)�� ����Ǿ����ϴ�
--between 0 and 100 �̹Ƿ� �������� �����⿡ �Ұ���
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);

-- addrĮ���� incheon�� �ش����� ����
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', 10, 20, 30, 'incheon');

--4) default/////////////////////////////////////////////////
-- �ش� Į���� �����Ͱ� �Էµ��� ���� ���, tot�� aver�� 0�Է�, wdate�� ���糯¥�� �Է�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'seoul');

--���ϴ� ���� �Է��ϸ� default ���̾ƴ� ���� ���� �����
insert into sungjuk(sno, uname, kor, eng, mat, addr, tot, aver, wdate)
values(2, 'ȫ�浿', 10, 20, 30, 'seoul', 60, 30, '2023-08-20');



--5)//////////////////////////////////////////////////////////
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(1, 'ȫ�浿', 10, 20, 30, 'seoul', 'webmaster@itwill.co.kr');

--ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007375)�� ����˴ϴ�
-- �ߺ���� ���� . prumary key ����� ��ü�� �� �ִ�
-- �� �ѹ��� ���ؼ� null���� ������ �ش�
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(2, 'ȫ�浿', 10, 20, 30, 'seoul', 'webmaster@itwill.co.kr');

--SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, 'ȫ�浿', 10, 20, 30, 'seoul');


select * from sungjuk;

