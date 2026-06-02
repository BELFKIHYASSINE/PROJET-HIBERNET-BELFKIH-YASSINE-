create or replace function stockeeEX7(v_dept in varchar) return number is
moy number;
begin
select avg(salaire) into moy from employes where dept=v_dept;
return moy;
end stockeeEX7;