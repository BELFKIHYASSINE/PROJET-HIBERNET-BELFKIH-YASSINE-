create or replace function stockeeEX7(v_dept in varchar) return number is
moy number;
begin
select avg(salaire) into moy from employes where dept=v_dept;
if moy IS null then
return NULL;
end if;
return moy;
end stockeeEX7;