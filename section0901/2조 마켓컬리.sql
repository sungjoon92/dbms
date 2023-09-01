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



//♥♥♥♥♥회원♥♥♥♥♥♥회원♥♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥//

////////////////////////////////////////////////////////////////////////
////////////////////////회원가입//////////////////////////////////////////
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
---------------------회원가입 행 추가하기---------------------

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate, friendid)
values('a123','1234','a@naver.com','1992-10-28','남', '01062733282', '1234', '강남구', '삼원타워', '2023-08-29', 'b123');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('b123','1234','b@naver.com','1999-01-18','여', '01012345678', '2345', '송파구', '롯데타워', '2023-08-30');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('c123','1234','c@naver.com','1998-05-19','남', '01023456789', '3456', '노원구', '19길2', '2023-07-25');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('d123','1234','d@naver.com','2002-03-14','여', '01045678912', '4567', '서대문구', '23길5', '2023-02-11');

insert into membership(id, password, email, birth, fm, phone, adnumber, address, adadd, wdate)
values('e123','1234','e@naver.com','1983-05-18','남', '01056789123', '5678', '강서구', '59길12', '2023-06-25');

select * from membership;


---------------배송지 관리 (주문서 먼저 생성-------------)
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
---------------------배송지관리 행 추가하기---------------------

insert into deliveryadd(bno, orderid, rec_orname, rec_address, rec_adadd, rec_adnumber, delimass, rec_phone)
values (deliveryadd_seq.nextval,'202308291718', '김삿갓', '강남구', '삼원타워', '1234', '문앞', '010-6273-3282'); --날짜 데이터는 문자열 형태로 추가한다

insert into deliveryadd(orderid, rec_orname, rec_address, rec_adadd, rec_adnumber, delimass, rec_phone)
values('202308301053', '이순신', '서대문구', '롯데타워', '2345', '초인종', '010-1234-5678');

----------------------------- 공지사항테이블에 행 추가하기
insert into gongji(gno, gtitle,  gdate) values(gongji_seq.nextval, '[안내] 문자 메세지 안내', sysdate);

select * from gongji;


////////////////////////////////////////////////////////////////////////
//////////////////////////////공지사항////////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  gongji(
         gno            number              primary key         -- 번호  
        ,gtitle         varchar2(100)       not null               -- 제목
        ,gjaksung       varchar2(30)        default '컬리'          -- 작성자
        ,gdate          date                not null               -- 작성일
);

select * from gongji;
drop table gongji;

create sequence gongji_seq; -- 시퀀스 생성 
drop sequence gongji_seq;   -- 시퀀스 삭제


---------------------공지사항 행 추가하기---------------------

insert into gongji(gno, gtitle,  gdate)
values(gongji_seq.nextval, '[안내] 문자 메세지 안내', sysdate);


////////////////////////////////////////////////////////////////////////
////////////////////////*자주하는 질문 테이블 만들기*////////////////////////
////////////////////////////////////////////////////////////////////////
create table qna (
     jno          number            primary key
    ,jcate        varchar2(100)     not null
    ,jjemok       varchar2(100)     not null
) ;    

select * from qna;
drop table qna;

---------------------자주하는 질문 행 추가하기---------------------
insert into qna(jno, jcate, jjemok)
values (185,'취소/교환/환불','교환(반품)');

insert into qna(jno, jcate, jjemok)
values (184,'선물하기','선물하기 주문');

insert into qna(jno, jcate, jjemok)
values (183,'포장','포장재');

insert into qna(jno, jcate, jjemok)
values (182,'회원','아이디,비밀번호');

insert into qna(jno, jcate, jjemok)
values (181,'이벤트/쿠폰/적립금','적립금 언제');


//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//
//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//
//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//


//♥♥♥♥♥상품♥♥♥♥♥♥상품♥♥♥♥♥♥♥♥상품♥♥♥♥♥♥♥상품♥♥♥♥♥♥♥♥♥♥상품♥♥♥♥♥♥♥//

////////////////////////////////////////////////////////////////////////
///////////////////////////// 중분류테이블/////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table MID_CATEGOREIS(
   bigcode         char(4)           not null         --부모코드(카테고리)
  ,product_code    char(5)           primary key      --상품코드
  ,product_name    varchar2(4000)    not null         --상품명
  ,description     varchar2(4000)    not null         --상품설명
  ,product_image   varchar2(100)     not null         --상품사진
  ,cost            int               not null         --원가
  ,discount_rate   number(8,3)       default 0        --할인율(★ default 0으로 설정 후에 ''으로 두면 결과값이 null나옴)
  --,unit_price      int               not null         --단가
  ,event           varchar2(100)     null             --이벤트(★ 할인율이랑 같음)
 
);

drop table MID_CATEGOREIS;
---------------------중분류테이블에 행 추가하기---------------------

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c001','ve001','감자','배송,판매자,포장타입,원산지,판매단위','1.png','4000', '0', '4000','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c006','gd002','초콜렛','배송,판매자,포장타입,원산지,판매단위','27.png','2000','0','2000','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c008','ar001','참이슬','배송,판매자,포장타입,원산지,판매단위','36.png','1400','0','1400','');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c003','ch004','소고기','배송,판매자,포장타입,원산지,판매단위','14.png','12000','0.05','11400','sa');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c001','ve002','고구마','배송,판매자,포장타입,원산지,판매단위','2.png','3000','0','3000','sp');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c011','ga001','노트북','배송,판매자,포장타입,원산지,판매단위','51.png','1200000','0.20','960000','sa');

insert into MID_CATEGOREIS(bigcode, product_code, product_name, description, product_image, cost, discount_rate, unit_price, event)
values('c004','ba002','닭갈비','배송,판매자,포장타입,원산지,판매단위','18.png','9000','0.20','7200','');


select * from MID_CATEGOREIS;


////////////////////////////////////////////////////////////////////////
///////////////////////상품 설명 (중분류 먼저 생성)//////////////////////////
////////////////////////////////////////////////////////////////////////
create table productscript (
    pno           int              primary key      -- pk
    ,product_code  char(5)         not null         --상품코드
    ,deliv        varchar2(50)     not null         --배송
    ,seller       varchar2(50)     not null         --판매자
    ,package      varchar2(50)     default ''       --포장타입
    ,country      varchar2(50)     default ''       --원산지
    ,unit         varchar2(30)     not null         --판매단위
    ,foreign key (product_code) 
    references MID_CATEGOREIS(product_code)
    on delete cascade
);


select * from productscript;
drop table productscript;

create sequence productscript_seq;

---------------------상품설명 행 추가하기---------------------




////////////////////////////////////////////////////////////////////////
/////////////////////////////////리뷰////////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  Reviews(
         renum          int                 primary key  -- 번호
        ,product_code   char(5)             not null  -- 상품코드  
        ,product_name   varchar2(4000)      not null  -- 상품명
        ,rephoto        varchar2(500)       not null  -- 리뷰사진
        ,rehoo          varchar2(1000)      not null  -- 후기
        ,restar         int                 not null  -- 별점
        ,id             varchar2(30)        not null  -- 아아디
        ,orderid        varchar2(500)       not null  -- 주문번호
       
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
select * from Reviews;       -- 테이블 조회
drop table Reviews;          -- 테이블 삭제
delete from Reviews;         -- 행 삭제

create sequence Reviews_seq; -- 시퀀스 생성 
drop sequence Reviews_seq;   -- 시퀀스 삭제

---------------------리뷰 행 추가하기---------------------

insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 've001', '감자', '1_1.png', '좋아요', 1, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'gd002', '초콜렛', '27.png', '달아요', 2, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'ar001', '참이슬', '36_1.png', '굿', 3, 'a123', sysdate);
insert into Reviews(renum, product_code, product_name, rephoto, rehoo, restar, id, orderid)
values(Reviews_seq.nextval, 'ch004', '소고기', '14_1.png', '부드러워요', 4, 'a123', sysdate);
        ---------------------리뷰 행 추가하기---------------------



//상품 end///////상품 end///상품 end////////상품 end//////상품 end////상품 end//
//상품 end///////상품 end///상품 end////////상품 end//////상품 end////상품 end//
//상품 end///////상품 end///상품 end////////상품 end//////상품 end////상품 end//


//♥♥♥♥♥회원♥♥♥♥♥♥회원♥♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥♥♥♥회원♥♥♥♥♥♥♥//


////////////////////////////////////////////////////////////////////////
///////////////////////////////장바구니///////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table  jangba(
        jangno          int                 primary key
        ,product_code   char(5)             not null  -- 상품코드  
        ,unit_price     int                 not null -- 단가
        ,jsuryang       varchar2(255)       not null  -- 수량
        ,jfinal         varchar2  (500)     not null  -- 최종금액
        ,id             varchar2(30)        not null  -- 아아디
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
---------------------장바구니 행추가--------------------

insert into jangba(product_code, unit_price, unit_price, jfinal, id)
select  've001'
        ,5000
        ,2
        ,jfinal
        ,'a123'
        from jangba
        where jfinal in(unit_price * jsuryang);
        -- jfinal 값을   unit_price*unit_price 로 자동으로 해보려했으나 실패
        
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 4000, 2, unit_price * jsuryang, 'a123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 2000, 5, 10000, 'a123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 1400, 7, 9800, 'b123');
insert into jangba(product_code, unit_price, jsuryang, jfinal, id)
values('ve001', 11400, 5, 57000, 'b123');



////////////////////////////////////////////////////////////////////////
///////////////////////주문서 테이블 만들기 ////////////////////////////////
////////////////////////////////////////////////////////////////////////
create table jumun (
     orderid       varchar2(20)    primary key
    ,id            varchar2(30)     /*외래키*/
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
---------------------주문서 행 추가하기---------------------

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308291718','a123',18000,'coo4','a123_point',0,10000,3000,11000,'카드');

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308301053','b123',66800,'coo1','b123_point',200,5200,3000,0,'계좌이체');




////////////////////////////////////////////////////////////////////////
///////////////////////쿠폰관리 테이블 만들기 ///////////////////////////////
////////////////////////////////////////////////////////////////////////
create table coupon_management(
   cuno             int               primary key
   ,id              varchar2(30)      not null         --아이디(★77번행 확인)
   ,cu_co           varchar2(4000)    not null         --쿠폰코드
   ,coupon_status   char(1)           not null         --사용여부(상태)
   ,coupon_new      date              default sysdate  --쿠폰사용기간(시작일)
   ,coupon_exp      date              default sysdate  --쿠폰사용기간(종료일)
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
---------------------쿠폰관리테이블에 행 추가하기---------------------



insert into coupon_management(cuno, id, cu_co, coupon_status, coupon_new, coupon_exp) 
values( coupon_management_seq.nextval,'b123','coo1','Y', sysdate-2, (sysdate-2)+8);


insert into coupon_management(id, cuco, coupon_status, coupon_new, coupon_exp) 
values('a123','coo2','N', sysdate-2, (sysdate-2)+31);

insert into coupon_management(id, cuco, coupon_status, coupon_new, coupon_exp) 
values('a123','coo3','E', sysdate, sysdate);
-->> 17번행 & 77행(아이디를 not null을 줘야 한 아이디에 여러 쿠폰 부여 가능하고 아이디를 PK로 주면 한 아이당 여러 쿠폰 지급 안 됨)

select * from coupon_management;
drop table coupon_management;


////////////////////////////////////////////////////////////////////////
///////////////////////쿠폰 종류 테이블 만들기/////////////////////////////
////////////////////////////////////////////////////////////////////////

create table coujong (
     cu_co         varchar2(4000)    primary key
    ,cu_hal        number(30)        not null
    ,cu_name       varchar2(100)     not null
    ,cu_sajo       varchar2(200)     not null
) ;    

select * from coujong;
drop table coujong;



---------------------쿠폰 종류 추가하기---------------------

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo1', 5000, '5000원 할인', '합산금액 50000원 이상 구매');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo2', 10000, '신규고객전용쿠폰', '신규고객');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo3', 3000, '컬리데이', '매월1일지급');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo4', 10000, '친구초대 할인', '친구초대ID 기재/ID 언급');


////////////////////////////////////////////////////////////////////////
////////////////////////////적립금테이블 만들기/////////////////////////////
////////////////////////////////////////////////////////////////////////
create table acc_reserves(
   reserves_no     int              not null          --적립금번호
  ,reserves_id     varchar2(100)    primary key       --적립금
  ,id              varchar2(30)     not null          --아이디
  ,reserves_amount int              not null          --적립금액
  ,reserves_type   varchar2(100)    not null          --적립유형
  ,reserves_new    date             default sysdate   --적립시점
  ,reserves_exp    date             default sysdate   --만료시점
  ,foreign key (id) 
  references membership(id)
  on delete cascade
);

drop table acc_reserves;


----------------------------- 적립금테이블에 행 추가하기
insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', 200, '구매', sysdate-284, (sysdate-284)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', -200, '구매', sysdate-35,(sysdate-35)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'b123_point', 'b123', 616, '구매', sysdate-8, (sysdate-8)+365);

insert into acc_reserves(reserves_no, reserves_id, id, reserves_amount, reserves_type, reserves_new, reserves_exp)
values(acc_reserves_seq.nextval, 'a123_point', 'a123', 80, '구매', sysdate, sysdate+365);



//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//
//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//
//회원 end///////회원 end///회원 end////////회원 end//////회원 end////회원 end//