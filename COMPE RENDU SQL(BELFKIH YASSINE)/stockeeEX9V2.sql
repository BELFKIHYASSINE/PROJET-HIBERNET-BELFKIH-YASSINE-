create or replace procedure stockeeEX9V2(v_dept in varchar, v_count OUT number, v_salaire OUT number) is
begin
select count(*) into v_count from employes where dept = v_dept;
select avg(salaire) into v_salaire from employes where dept = v_dept;
end stockeeEX9V2;