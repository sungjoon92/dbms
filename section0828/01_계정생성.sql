(오라클 사용자 계정 생성)

--계정 생성시 세션 변경해야 함
--alter session set "_ORACLE_SCROPT" = true;  오타
alter session set "_ORACLE_SCRIPT"=true;

--사용자 계정 목록
select uesrname from all_useres;

--테이블 스페이스  (테이블의 저장간) 생성
형식 create tablespace
datafile '데이터 파일경로' sizs 초기사이즈
autoextend onnext 자동증가사이즈
maxsize 최대사이즈,

--테이블 스페이스 종류 확인
create tablespace itwill
datafile 'D:\java202307\database\section0828\itwill.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;
//////////////////////////////////////////////////////////
--형식)
create user 아이디 identified by 비번
      default tablespace 테이블스페이스이름;
      
--연습)
create user java202307 identified by 1234
default tablespace itwill;

--사용자 계정 목록
select username from all_users;

--모든 권한 부여
grant connect, resource, dba to java202307;

commit;

--명령 프롬프트에서 권한 부여한 java202307 로그인하기
>sqlplus java202307/1234
///////////////////////////////////////

drop user java202307 cascade;
commit;



--테이블스페이스 삭제
--형식)
drop tablespace 테이블스페이스명
      including contents and datafiles
      cascade constraints;
      
      
      
--연습) 
drop tablespace itwill
      including contents and datafiles
      cascade constraints;