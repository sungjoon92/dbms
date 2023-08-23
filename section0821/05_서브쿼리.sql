[서브쿼리]
= sql문 속 쏘다른 sql문
테이블 내에서 다시한번 쿼리문에 의해 행 조회 및 검색

--국어점수의 평균을 조회하시오

select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


문1) 국어점수 평균 (66)보다 잘한 국어 점수를 조회하시오
select uname, kor from sungjuk where kor>=66;
select uname, kor from sungjuk where kor>=(select round(avg(kor),0) from sungjuk);

문2) 서울지역의 국어점수 평균보다 잘한 지역, 이름, 국어점수를 조회하시오
select kor from sungjuk where addr='Seoul';
select avg(kor) from sungjuk where addr='Seoul';
select round(avg(kor),0) from sungjuk where addr='Seoul';

select addr, uname, kor from sungjuk where kor>=73;

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');

문3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오
--   문2) 결과값에서 서울지역을 제외하시오

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul')
and addr <> 'Seoul';


문4) 국어점수의 최소값보다 이하 점수가 수학 또는 영어 점수에 있는지 조회하시오


select min(kor) from sungjuk;   --최저의 국어점수를 찾는다 --20


select uname, kor, eng, mat  --이름,국,영,수 점수를 보여줘
from sungjuk
where mat <=20 or eng <=20;  --수학과 영어점수가 20이하인 점수가 있는지확인

select uname, kor, eng, mat                     --밑에꺼 상관없이 이름과 국어점수는 보여주고 수학영어점수는 where문에 적용시켜서 보여줘
from sungjuk
where mat <=(select min(kor) from sungjuk)      --수학점수가 국어의 제일작은 점수보다 작을시 보여줘
            or
      eng <=(select min(kor) from sungjuk);     --영어점수가 국어의 제일작은 점수보다 작을시 보여줘