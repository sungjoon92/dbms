�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 04_�������ν���.sql
   ->������ġ : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////////

�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=192


�� sungjuk���̺��� Create/Read/Update/Delete ���� ���ν���

1)���߰� ���ν��� (Create)
create or replace procedure sungjukInsert
(
    --�Ű�����(parameter) ����
    --in �Է¸Ű�����
    --sungjuk���̺��� unameĮ���� ������ Ÿ������ ����(v_uname)����
    v_uname in sungjuk.uname%type
   ,v_kor   in sungjuk.kor%type
   ,v_eng   in sungjuk.eng%type
   ,v_mat   in sungjuk.mat%type
   ,v_addr  in sungjuk.addr%type
)
is
begin
    insert into sungjuk(sno, uname, kor, eng, mat, tot, aver, addr)
    values(sungjuk_seq.nextval, v_uname, v_kor, v_eng, v_mat
           ,(v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;


--sungjukInsert ���ν��� ����
execute sungjukInsert('���ʽ�', 100, 99, 95, 'Seoul');

--���Ȯ��
select * from sungjuk order by sno desc;
///////////////////////////////////////////////////////////////////////////////


2)����� ���ν��� (Update)
--��) sno=21 ���� �Ʒ� ������ �̸�, ��, ��, ��, �ּ�, ����, ����� �����ϴ� ���ν����� �����Ͻÿ�
execute sungjukUpdate('�ڸ���', 50,60,90, 'Jeju', 21);

create or replace procedure sungjukUpdate 
(
    v_uname in sungjuk.uname%type
   ,v_kor   in sungjuk.kor%type
   ,v_eng   in sungjuk.eng%type
   ,v_mat   in sungjuk.mat%type
   ,v_addr  in sungjuk.addr%type
   ,v_sno   in sungjuk.addr%type
)
is
begin
    update sungjuk
    set uname=v_uname, kor=v_kor, eng=v_eng, mat=v_mat
        , tot=v_kor+v_eng+v_mat, aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
    where sno=v_sno;
    commit;
end;
////////////////////////////////////////////////////////////////////////////////


3)����� ���ν��� (Delete)

--��) sno=21 �� �����Ͻÿ�
execute sungjukDelete(21);

create or replace procedure sungjukDelete
(
    v_sno   in sungjuk.sno%type
)
is
begin
    delete from sungjuk where sno=v_sno;
    commit;
end;

--���Ȯ��
select * from sungjuk order by sno desc;
///////////////////////////////////////////////////////////////////////////////

--�ܼ�â ����ϱ� ���� ���� �غ��۾�
set serveroutput on;


4)��ü��� (Read)
create or replace procedure sungjukList
(
    v_cursor out sys_refcursor  -- out ��¸Ű�����
)
is
    rec sungjuk%rowtype;        --sungjuk���̺��� ������ Ÿ�԰� �����ϰ� ���� ����
begin
    open v_cursor for select * from sungjuk order by sno desc;
    
    loop
        fetch v_cursor into rec;
        exit when v_cursor%NOTFOUND;
        dbms_output.put_line(rec.uname||' '||rec.kor||' '||rec.eng||' '||rec.mat||' '
                             ||rec.tot||' '||rec.aver||' '||rec.addr||' '||rec.wdate);
    end loop;
    
    close v_cursor;    
end;


--sungjukList ���ν��� ����
var v_cursor refcursor;          --���� Ŀ�� ���� ����
execute sungjukList(:v_cursor);




 