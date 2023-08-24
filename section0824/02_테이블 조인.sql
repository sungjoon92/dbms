● [테이블 조인]

  - 여러 테이블을 하나의 테이블처럼 사용하는 조인
  - 두개이상의 테이블을 결합하여 데이터를 추출하는 기법
  - 두테이블의 공통값을 이용하여 컬럼을 조합하는 수단

select 칼럼명
from 테이블1
join 테이블2
on 조건절 ;


select 칼럼명
from 테이블1
join 테이블2
on 조건절;


select T1.*, t2.*        --T1.모든칼럼 T2.모든칼럼
from T1 inner join T2    -- inner 생략가능
on T1.x = T2.x;          -- 테이블명,칼럼명

select T1.*, t2.*, t3.*
from T1 join T2
on T1.x - T2.x join T3
on T1.y = T3.y

select T1.*, t2.*, t3.*
from T1 join T2
on T1.x = T2.x join T3
on T1.y = T3.y join T4
on T1.z = T4.z;




조건절  : where 조건절, having 조건절, on조건절

물리적 테이블관 논리적 테이블은 서로 동등학 관계이다

    -- 물리적 테이블 : 실제 create table한 테이블
    -- 논리적 테이블 : sql문에 의해 가공된 테이블
////////////////////////////////////////////////////////

inner join 연습

select * from tb_sugang;

-- 학번을 기준으로 수강테이블과 학생테이블 조인
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- 두 테이블간의 교집한조인, inner 생략가능(가장 기본)
select *
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

--수강신청한 학생들의 학번, 과목코드, 이름, 이메일 조회하시오
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

--과목코드를 기준으로 수강테이블과 과목 테이블 조인
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok 
on tb_sugang.gcode = tb_gwamok.gcode;

-- 3개 테이블 조인:  수강테이블 +학생테이블(이름) + 과목테이블(과목명)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;




--테이블의 alias(별칭)도 가능하다 (대소문자 구분안함)
select SU.*, ST.uname, ST.email
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--모든 테이블의 모든 칼럼 조회하기
select *
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--칼럼 조회시 테이블간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--중복되는 칼럼명은 소속 테이블명을 정확히 명시해야한다
select hakno, gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;







