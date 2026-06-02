create or replace function stockeeEX9(v_dept in varchar) return number is
res number;
begin
select count(*) into res from employes where dept = v_dept;
return res;
end stockeeEX9;