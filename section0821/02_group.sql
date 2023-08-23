drop table sungjuk;

create table sungjuk (
    sno     int          primary key --기본키 (유일성)
    ,uname  varchar(50)  not null
    ,kor    int          check(kor between 0 and 100) -- 국어점수 0~100사이만 입력가능
    ,eng    int          check(eng between 0 and 100) -- 영어점수 0~100사이만 입력가능
    ,mat    int          check(mat between 0 and 100) -- 수학점수 0~100사이만 입력가능
    ,addr   varchar(50)  check(addr in('Seoul','Jeju','Busan','Suwon'))
    ,tot    int          default 0
    ,aver   int          default 0
    ,wdate  date         default sysdate              -- 현재 날짜 함수
    
);


sungjuk타이틀 입력 데이터

drop sequence sungjuk_seq;

create sequence sungjuk_seq;


commit;

select count(*) from sungjuk;
select * from sungjuk;


////////////////////////////////////////

[데이터 그룹화]
--order by 정렬
select * from sungjuk order by addr;


[distinct]
    -칼럼에 중복내용이 있으면 대표값 1개만 출력
    - 형식) distinct 칼럼명
    
select addr from sungjuk;
select addr from sungjuk order by addr;   --asc 생략가능
select addr from sungjuk order by addr asc;
select addr from sungjuk order by addr desc;

-- 중복된이름을 한번만 보여준다
select distinct(addr) from sungjuk order by addr;
select distinct(uname) from sungjuk order by uname;




[group by]
    - 칼럼에 동일 내용끼리 그룹화 시킴
    - 형식) group by 칼럼1, 칼럼2, 칼럼3 ~~
    
    -- 주소가 동일한 값을 그룹화 시키고 주솔르 조회
select addr
from sungjuk
group by addr;

--ORA-00979: GROUP BY 표현식이 아닙니다.
--00979. 00000 -  "not a GROUP BY expression"
select addr,uname  --그룹시키고 나올수 있는 값은 1개만 가능한 값만 조회
from sungjuk
group by addr;


[집개함수]
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)  --갯수 , 최대값, 최소값, 합계, 평균) 
from sungjuk group by addr;

문1) 주소별 인원수를 조회하시오

select addr,count(*) as cnt  --칼럼명 임시 부여
from sungjuk
group by addr;

--주소별 내림차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr desc;

--
주소별 인원수를 내림차순 정렬해서 조회
select addr, count(*) cnt               --해석순서 3) addr을 찾아서 cnt라는이름으로 변경후 번호를 매겨
from sungjuk                            --해석순서 1) 성적을찾아
group by addr                           --해석순서 2) addr을 그룹화해
order by count(*) desc;                 --해석순서 4) 그룹화한 addr을 순서대로 번호매겨서 내림차순으로 보여줘



--문2) 주소별 국어점수에 대해서 집계해서 주소순으로 정렬해서 조회하시오
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)  
from sungjuk 
group by addr
order by addr;

-- round (값,0) 소수점 이하값에서 반올림하고 소수점은 없음
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)  
from sungjuk 
group by addr
order by addr;


--국어평균을 소수점 없이 반롱림하고 내림차순 정렬해서 조회
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)  
from sungjuk 
group by addr
order by round(avg(kor), 0) desc;

--칼럼명 부여
select addr
        ,count(*) as cnt
        ,max(kor) as max_kor
        ,min(kor) as min_kor
        ,sum(kor) as sun_kor
        ,round(avg(kor), 0) as avg_kor
from sungjuk
group by addr;

국어점수 평균값을 내림차순 정렬
select addr
        ,count(*) as cnt
        ,max(kor) as max_kor
        ,min(kor) as min_kor
        ,sum(kor) as sum_kor
        ,round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by avg_kor desc;


--문3) 총점(tot), 평균(aver) 구하시오

update sungjuk 
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;


commit;

select * from sungjuk order by aver desc;




--문4) 평균(aver)이 80점이상 행을 대상으로 주소별 인원수를 인원수순으로 조회하시오

select addr
from sungjuk
where aver>=80
group by addr;



select addr, count(*)
from sungjuk
where aver>=80
group by addr;

select addr, count(*)   --4)
from sungjuk            --1)
where aver>=80          --2)
group by addr           --3)
order by count(*);      --5)
//////////////////////////////////////////////////


[2차그룹]
select uname, addr, kor, eng, mat
from sungjuk
order by addr, kor;

-- wnthquf (1차) 그룹을 하고, 주소가 같다면 국어점수(2차)로 그룹화하기
select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;


--1차 그룹 (kor), 2차그룹(eng), 3차그룹(mat)
select kor,eng,mat,count(*)
from sungjuk
group by kor,eng,mat
order by kor,eng,mat;











--sungjuk테이블 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'아이티윌', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

