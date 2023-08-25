● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 03_csv파일변환.sql
   ->저장위치 : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////////

※ 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=190


● [CSV 파일]
  - 모든 데이터가 , 로 구분되어 있는 파일


● [CSV 파일을 데이터베이스로 가져오기]  
   - 공공데이터포털 https://data.go.kr/ 활용
////////////////////////////////////////////////////////////////////////////////


문1) 도로명 우편번호 테이블 구축하기

--1) zipdoro.csv 준비 (258267행)

--2) zipdoro.csv 내용을 저장하는 zipdoro테이블 생성
create table zipdoro (
    zipno       char(5)        --우편번호
   ,zipaddress  varchar2(4000) --주소
);

drop table zipdoro; --테이블 삭제


--3) 가져오기와 내보내기
    - zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
    - zipdoro 테이블 우클릭 -> export      (내보내기)


--4)전체 행 갯수 조회하기
select count(*) from zipdoro; 
///////////////////////////////////////////////////////////////////////////////


문2) 한국교원대학교_초중등학교위치.csv를 변환해서 테이블에 저장하시오 (11873행)
create table school (
    schoolid    varchar2(10)   --학교ID
  , schoolname  varchar2(255)  --학교명
  , schoolgubun varchar2(20)   --학교급구분
  , schooladdr  varchar2(2000) --소재지도로명주소
  , cdate       date           --생성일자 (형식 YYYY-MM-DD)
  , udate       date           --변경일자 (형식 YYYY-MM-DD)
  , latitude    number(20,10)  --위도
  , longitude   number(20,10)  --경도
);

commit;
select count(*) from school;
select * from school;


--과제1) 비어있는 값(null)을 찾으시오
select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null;   --B000027204행에서 비어 있음
select * from school where cdate is null;
select * from school where udate is null;
select * from school where latitude is null;
select * from school where longitude is null;


--과제2) 각 시도별 초등학교, 중학교 갯수를 구하시오
select substr(schooladdr,0, instr(schooladdr,' ',1,1))
     , schoolgubun
     , count(*) 
from school 
group by substr(schooladdr,0, instr(schooladdr,' ',1,1)), schoolgubun
order by substr(schooladdr,0, instr(schooladdr,' ',1,1)), schoolgubun desc;













































