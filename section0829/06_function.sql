�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 06_function.sql
   ->������ġ : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////////

�� function �Լ�

select * from sungjuk order by sno desc;

--����) sno=11�� ���������� 5���� ���ϰ� ������ �������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�
create or replace function fn_update(v_sno number)
    return number --��ȯ�Ǵ� �ڷ���
is
    v_kor number; 
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from  sungjuk where sno=v_sno;
    return v_kor; --�λ�� �������� ��ȯ
end;


--���� fn_update�Լ��� ���������Ʈ���� �׽�Ʈ�ϼ���
������˻�
-> cmd ���������Ʈ
-> sqlplus system/1234
SQL>var korea number;
SQL>execute :korea := fn_update(51);
SQL>print korea;



