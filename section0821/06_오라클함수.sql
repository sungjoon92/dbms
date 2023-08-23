[오라클 함수]


--가상 테이블 : dual (임시 보관용 table)


1. 문자열 관리 함수
select lower('hello world') from dual;          --전부 소문자로 변환
select upper('hello world') from dual;          --전부 소문자로 변환
select length('hello world') from dual;         --글자 갯수
select substr('hello world', 1, 5) from dual;   --문자열 자르기(첫번째 글자부터 5개) 'hello'

select instr('helloworld', 'w') from dual;      --특정문자 위치6
select lpad('SKY', 5, '*') from dual;           --5칸내에서 출력하고 왼쪽 빈칸은 *로 채움
select rpad('SKY', 5, '*') from dual;           --5칸내에서 출력하고 오른쪽 빈칸은 *로 채움
select replace('happy', 'p', 'k') from dual;    --특정문자 변환


-- 문자열 연결하기
select concat('로미오','줄리엣') from dual;      --로미오줄리엣
select concat(uname, '의 평균은'), concat(aver, '입니다')from sungjuk;
select concat(uname, '의 평균은')as 이름 , concat(aver, '입니다')as 평균 from sungjuk;

-- 결합 연산자 ||
select uname || '의 평균은' || aver || '입니다' from sungjuk;
select uname || '의 평균은' || aver || '입니다' as str from sungjuk;

--ASCII 문자변환
select chr(65) from dual;        --A
select chr(66) from dual;        --B
select chr(97) from dual;        --a
select chr(68) from dual;        --b

select '%' ||chr(32) || '#' from dual; --공백

select chr(43) from dual;        --+
select chr(45) from dual;        ---
select chr(42) from dual;        --*
select chr(47) from dual;        --/


//////////////////////////////////////////////////



2. 숫자 관련 함수
select abs(-7) from dual;            -- 절대값
select mod(5,3) from dual;           -- 나머지 함수
select cell(12.4) from dual;         -- 올림함수
select trunc) from dual;             -- 내림함수


select avg(43) from sungjuk;            -- 66.363636
select cell(kor)) from sungjuk;         -- 67
select trunc(avg(kor),2) from sungjuk;  -- 66.36
select round(avg(kor),2) from sungjuk;  -- 66.36

////////////////////////////////////////////////////////////

3. 날짜 관련 함수

select sysdate from dual;  -- 시스템의 현재 날짜와 시간 정보를 리턴하는 함수

-- 날짜데이터 연산
select sysdate+100 from dual;       --오늘날로 +100일
select sysdate-100 from dual;       --오늘날로 -100일

--sysdate에서 년월일 호출하기
select extract(year from sysdate) from dual;    --2023
select extract(month from sysdate) from dual;   --8
select extract(day from sysdate) from dual;     --22

--두개의 날짜데이터에서 개월 수 계산
select months_between('2023-08-22', '2022-10-30') from dual;      --  9.7
select months_between('2023-08-22', '2023-12-31') from dual;      -- -4.2
///////////////////////////////////////////////////////////////////////

4. 형변환 함수
-- to_char(원래 날짜, '원하는 모양')
-- 숫자와 날짜를 문자로 변환해 주는 두가지기능
select to_char(sysdate, 'yyyy-mm-dd') from dual;    --2023-08-22
select to_char(sysdate, 'mm/dd/yyyy') from dual;    --08/22/2023
select to_char(sysdate, 'dd-mon-yyyy') from dual;   --22-8월 -2023

select to_char(sysdate, 'yyyy') from dual;    -- 2023
select to_char(sysdate, 'mm') from dual;      -- 08
select to_char(sysdate, 'dd') from dual;      -- 22


4. 형변환 함수