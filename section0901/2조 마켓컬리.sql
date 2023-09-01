drop table membership;       --666666
drop table deliveryadd;      --222222       
drop table gongji;           --111111
drop table qna;
drop table MID_CATEGOREIS;
drop table productscript;
drop table Reviews;
drop table jangba;
drop table jumun;             --33333
drop table coupon_management;
drop table coujong;           --44444
drop table acc_reserves;      --55555

create table membership;
create table deliveryadd;
create table gongji;
create table qna;
create table MID_CATEGOREIS;
create table productscript;
create table Reviews;
create table jangba;
create table jumun;
create table coupon_management;
create table coujong;
create table acc_reserves;



//����������ȸ��������������ȸ������������������ȸ����������������ȸ����������������������ȸ����������������//

////////////////////////////////////////////////////////////////////////
////////////////////////ȸ������//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table membership (
    id          varchar2(30)     primary key 
    ,password   varchar2(256)    not null
    ,email      varchar2(256)    not null   unique
    ,birth      date             not null
    ,fm         varchar2(10)     not null
    ,phone      varchar2(12)     not null                
    ,adnumber   int              not null
    ,address    varchar2(4000)   not null
    ,adadd      varchar2(4000)   not null
    ,wdate      date             not null
    ,friendid   varchar2(30)     default ''
   
);


select * from membership;
drop table membership;
---------------------ȸ������ �� �߰��ϱ�---------------------

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate, friendid)
values('a123','1234','a@naver.com','1992-10-28','��', '01062733282', '1234', '������', '���Ÿ��', '2023-08-29', 'b123');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('b123','1234','b@naver.com','1999-01-18','��', '01012345678', '2345', '���ı�', '�Ե�Ÿ��', '2023-08-30');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('c123','1234','c@naver.com','1998-05-19','��', '01023456789', '3456', '�����', '19��2', '2023-07-25');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('d123','1234','d@naver.com','2002-03-14','��', '01045678912', '4567', '���빮��', '23��5', '2023-02-11');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('e123','1234','e@naver.com','1983-05-18','��', '01056789123', '5678', '������', '59��12', '2023-06-25');

select * from membership;


---------------����� ���� (�ֹ��� ���� ����-------------)
create table deliveryadd (
     bno          int              primary key
    ,orderid      varchar2(20)     not null
    ,rec_orname   varchar2(20)     not null
    ,rec_address  varchar2(4000)   not null
    ,rec_adadd    varchar2(4000)   not null
    ,rec_adnumber int              not null
    ,delimass     varchar2(4000)              
    ,rec_phone    varchar2(20)     not null
    ,foreign key (orderid) 
    REFERENCES jumun(orderid)
    on DELETE cascade
);
select * from deliveryadd;
drop table deliveryadd;


create sequence deliveryadd_seq;
drop sequence deliveryadd_seq;
---------------------��������� �� �߰��ϱ�---------------------

insert into deliveryadd(bno, orderid, rec_orname, rec_address, rec_adadd, rec_adnumber, delimass, rec_phone)
values (deliveryadd_seq.nextval,'202308291718', '���', '������', '���Ÿ��', '1234', '����', '010-6273-3282'); --��¥ �����ʹ� ���ڿ� ���·� �߰��Ѵ�

insert into deliveryadd(orderid, rec_orname, rec_address, rec_adadd, rec_adnumber, delimass, rec_phone)
values('202308301053', '�̼���', '���빮��', '�Ե�Ÿ��', '2345', '������', '010-1234-5678');

----------------------------- �����������̺� �� �߰��ϱ�
insert into gongji(gno, gtitle,  gdate) values(gongji_seq.nextval, '[�ȳ�] ���� �޼��� �ȳ�', sysdate);

select * from gongji;


////////////////////////////////////////////////////////////////////////
//////////////////////////////��������////////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  gongji(
         gno            number              primary key         -- ��ȣ  
        ,gtitle         varchar2(100)       not null               -- ����
        ,gjaksung       varchar2(30)        default '�ø�'          -- �ۼ���
        ,gdate          date                not null               -- �ۼ���
);

select * from gongji;
drop table gongji;

create sequence gongji_seq; -- ������ ���� 
drop sequence gongji_seq;   -- ������ ����


---------------------�������� �� �߰��ϱ�---------------------

insert into gongji(gno, gtitle,  gdate)
values(gongji_seq.nextval, '[�ȳ�] ���� �޼��� �ȳ�', sysdate);


////////////////////////////////////////////////////////////////////////
////////////////////////*�����ϴ� ���� ���̺� �����*////////////////////////
////////////////////////////////////////////////////////////////////////
create table qna (
     jno          number            primary key
    ,jcate        varchar2(100)     not null
    ,jjemok       varchar2(100)     not null
) ;    

select * from qna;
drop table qna;

---------------------�����ϴ� ���� �� �߰��ϱ�---------------------
insert into qna(jno, jcate, jjemok)
values (185,'���/��ȯ/ȯ��','��ȯ(��ǰ)');

insert into qna(jno, jcate, jjemok)
values (184,'�����ϱ�','�����ϱ� �ֹ�');

insert into qna(jno, jcate, jjemok)
values (183,'����','������');

insert into qna(jno, jcate, jjemok)
values (182,'ȸ��','���̵�,��й�ȣ');

insert into qna(jno, jcate, jjemok)
values (181,'�̺�Ʈ/����/������','������ ����');


//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//
//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//
//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//


//������������ǰ��������������ǰ������������������ǰ����������������ǰ����������������������ǰ��������������//

////////////////////////////////////////////////////////////////////////
///////////////////////////// �ߺз����̺�/////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table MID_CATEGOREIS(
   bigcode         char(4)           not null         --�θ��ڵ�(ī�װ�)
  ,product_code    char(5)           primary key      --��ǰ�ڵ�
  ,product_name    varchar2(4000)    not null         --��ǰ��
  ,description     varchar2(4000)    not null         --��ǰ����
  ,product_image   varchar2(100)     not null         --��ǰ����
  ,cost            int               not null         --����
  ,discount_rate   number(8,3)       default 0        --������(�� default 0���� ���� �Ŀ� ''���� �θ� ������� null����)
  --,unit_price      int               not null         --�ܰ�
  ,event           varchar2(100)     null             --�̺�Ʈ(�� �������̶� ����)
 
);

drop table MID_CATEGOREIS;
---------------------�ߺз����̺� �� �߰��ϱ�---------------------

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c001','ve001','����','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','1.png','4000', '0', '4000','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c006','gd002','���ݷ�','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','27.png','2000','0','2000','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c008','ar001','���̽�','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','36.png','1400','0','1400','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c003','ch004','�Ұ��','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','14.png','12000','0.05','11400','sa');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c001','ve002','����','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','2.png','3000','0','3000','sp');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c011','ga001','��Ʈ��','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','51.png','1200000','0.20','960000','sa');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c004','ba002','�߰���','���,�Ǹ���,����Ÿ��,������,�ǸŴ���','18.png','9000','0.20','7200','');


select * from MID_CATEGOREIS;


////////////////////////////////////////////////////////////////////////
///////////////////////��ǰ ���� (�ߺз� ���� ����)//////////////////////////
////////////////////////////////////////////////////////////////////////
create table productscript (
    pno           int              primary key      -- pk
    ,product_code  char(5)         not null         --��ǰ�ڵ�
    ,deliv        varchar2(50)     not null         --���
    ,seller       varchar2(50)     not null         --�Ǹ���
    ,package      varchar2(50)     default ''       --����Ÿ��
    ,country      varchar2(50)     default ''       --������
    ,unit         varchar2(30)     not null         --�ǸŴ���
    ,foreign key (product_code) 
    references MID_CATEGOREIS(product_code)
    on delete cascade
);


select * from productscript;
drop table productscript;

create sequence productscript_seq;

---------------------��ǰ���� �� �߰��ϱ�---------------------




////////////////////////////////////////////////////////////////////////
/////////////////////////////////����////////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  Reviews(
         renum          int                 primary key  -- ��ȣ
        ,product_code   char(5)             not null  -- ��ǰ�ڵ�  
        ,product_name   varchar2(4000)      not null  -- ��ǰ��
        ,rephoto        varchar2(500)       not null  -- �������
        ,rehoo          varchar2(1000)      not null  -- �ı�
        ,restar         int                 not null  -- ����
        ,id             varchar2(30)        not null  -- �ƾƵ�
        ,orderid        varchar2(500)       not null  -- �ֹ���ȣ
       
        ,foreign key (product_code) 
        references MID_CATEGOREIS(product_code)
        on delete cascade
        
        ,foreign key (id) 
        references membership(id)
        on delete cascade
        
        ,foreign key (orderid) 
        references jumun(orderid)
        on delete cascade
);
select * from Reviews;       -- ���̺� ��ȸ
drop table Reviews;          -- ���̺� ����
delete from Reviews;         -- �� ����

create sequence Reviews_seq; -- ������ ���� 
drop sequence Reviews_seq;   -- ������ ����

---------------------���� �� �߰��ϱ�---------------------

insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 've001', '����', '1_1.png', '���ƿ�', 1, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'gd002', '���ݷ�', '27.png', '�޾ƿ�', 2, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'ar001', '���̽�', '36_1.png', '��', 3, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'ch004', '�Ұ��', '14_1.png', '�ε巯����', 4, 'a123', sysdate);
        ---------------------���� �� �߰��ϱ�---------------------



//��ǰ end///////��ǰ end///��ǰ end////////��ǰ end//////��ǰ end////��ǰ end//
//��ǰ end///////��ǰ end///��ǰ end////////��ǰ end//////��ǰ end////��ǰ end//
//��ǰ end///////��ǰ end///��ǰ end////////��ǰ end//////��ǰ end////��ǰ end//


//����������ȸ��������������ȸ������������������ȸ����������������ȸ����������������������ȸ����������������//


////////////////////////////////////////////////////////////////////////
///////////////////////////////��ٱ���///////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  jangba(
        jangno          int                 primary key
        ,product_code   char(5)             not null  -- ��ǰ�ڵ�  
        ,unit_price     int                 not null -- �ܰ�
        ,jsuryang       varchar2(255)       not null  -- ����
        ,jfinal         varchar2  (500)     not null  -- �����ݾ�
        ,id             varchar2(30)        not null  -- �ƾƵ�
        ,foreign key (product_code) 
         references MID_CATEGOREIS(product_code)
         on delete cascade
        ,foreign key (id) 
         references membership(id)
         on delete cascade
);

select * from jangba;
drop table jangba;
create sequence jangba_seq;
drop sequence jangba_seq;
---------------------��ٱ��� ���߰�--------------------

insert into jangba(product_code, unit_price, unit_price, jfinal, id)
select  've001'
        ,5000
        ,2
        ,jfinal
        ,'a123'
        from jangba
        where jfinal in(unit_price * jsuryang);
        -- jfinal ����   unit_price*unit_price �� �ڵ����� �غ��������� ����
        
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 4000, 2, unit_price * jsuryang, 'a123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 2000, 5, 10000, 'a123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 1400, 7, 9800, 'b123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 11400, 5, 57000, 'b123');



////////////////////////////////////////////////////////////////////////
///////////////////////�ֹ��� ���̺� ����� ////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table jumun (
     orderid       varchar2(20)    primary key
    ,id            varchar2(30)     /*�ܷ�Ű*/
    ,hap           int             not null
    ,cu_co         varchar2(4000)  not null
    ,reserves_id   varchar2(100)   not null
    ,jukrip        int             not null
    ,ju_hal        int             not null
    ,beasong       int             not null
    ,totfee        number          not null
    ,sudan         varchar2(100)   not null
    ,foreign key (id) 
     references membership(id)
     on delete cascade
     ,foreign key (cu_co) 
     references coujong(cu_co)
     on delete cascade
     ,foreign key (reserves_id) 
     references acc_reserves(reserves_id)
     on delete cascade
);

select * from jumun;
drop table jumun;
---------------------�ֹ��� �� �߰��ϱ�---------------------

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308291718','a123',18000,'coo4','a123_point',0,10000,3000,11000,'ī��');

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308301053','b123',66800,'coo1','b123_point',200,5200,3000,0,'������ü');




////////////////////////////////////////////////////////////////////////
///////////////////////�������� ���̺� ����� ///////////////////////////////
////////////////////////////////////////////////////////////////////////
create table coupon_management(
   cuno             int               primary key
   ,id              varchar2(30)      not null         --���̵�(��77���� Ȯ��)
   ,cu_co           varchar2(4000)    not null         --�����ڵ�
   ,coupon_status   char(1)           not null         --��뿩��(����)
   ,coupon_new      date              default sysdate  --�������Ⱓ(������)
   ,coupon_exp      date              default sysdate  --�������Ⱓ(������)
   ,foreign key (id) 
    references membership(id)
    on delete cascade
   ,foreign key (cu_co) 
    references coujong(cu_co)
    on delete cascade
);

select * from coupon_management;
drop table coupon_management;
create sequence coupon_management_seq;
drop sequence coupon_management_seq;
---------------------�����������̺� �� �߰��ϱ�---------------------



insert into coupon_management(cuno, id, cu_co, coupon_status, coupon_new, coupon_exp) 
values( coupon_management_seq.nextval,'b123','coo1','Y', sysdate-2, (sysdate-2)+8);


insert into coupon_management(id, cuco, coupon_status, coupon_new, coupon_exp) 
values('a123','coo2','N', sysdate-2, (sysdate-2)+31);

insert into coupon_management(id, cuco, coupon_status, coupon_new, coupon_exp) 
values('a123','coo3','E', sysdate, sysdate);
-->> 17���� & 77��(���̵� not null�� ��� �� ���̵� ���� ���� �ο� �����ϰ� ���̵� PK�� �ָ� �� ���̴� ���� ���� ���� �� ��)

select * from coupon_management;
drop table coupon_management;


////////////////////////////////////////////////////////////////////////
///////////////////////���� ���� ���̺� �����/////////////////////////////
////////////////////////////////////////////////////////////////////////

create table coujong (
     cu_co         varchar2(4000)    primary key
    ,cu_hal        number(30)        not null
    ,cu_name       varchar2(100)     not null
    ,cu_sajo       varchar2(200)     not null
) ;    

select * from coujong;
drop table coujong;



---------------------���� ���� �߰��ϱ�---------------------

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo1', 5000, '5000�� ����', '�ջ�ݾ� 50000�� �̻� ����');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo2', 10000, '�ű԰���������', '�ű԰�');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo3', 3000, '�ø�����', '�ſ�1������');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo4', 10000, 'ģ���ʴ� ����', 'ģ���ʴ�ID ����/ID ���');


////////////////////////////////////////////////////////////////////////
////////////////////////////���������̺� �����/////////////////////////////
////////////////////////////////////////////////////////////////////////
create table acc_reserves(
   reserves_no     int              not null          --�����ݹ�ȣ
  ,reserves_id     varchar2(100)    primary key       --������
  ,id              varchar2(30)     not null          --���̵�
  ,reserves_amount int              not null          --�����ݾ�
  ,reserves_type   varchar2(100)    not null          --��������
  ,reserves_new    date             default sysdate   --��������
  ,reserves_exp    date             default sysdate   --�������
  ,foreign key (id) 
  references membership(id)
  on delete cascade
);

drop table acc_reserves;


----------------------------- ���������̺� �� �߰��ϱ�
insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', 200, '����', sysdate-284, (sysdate-284)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', -200, '����', sysdate-35,(sysdate-35)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', 616, '����', sysdate-8, (sysdate-8)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'a123_point', 'a123', 80, '����', sysdate, sysdate+365);



//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//
//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//
//ȸ�� end///////ȸ�� end///ȸ�� end////////ȸ�� end//////ȸ�� end////ȸ�� end//