create or replace procedure stockeeTrie(montant in number, tri in varchar) is
begin
if (tri = 'ASC') then 
for i in (select * from employes where salaire>montant order by salaire ASC) loop
DBMS_OUTPUT.PUT_LINE(i.nom);
end loop;
elsif (tri = 'DESC') then
for i in (select * from employes where salaire>montant order by salaire DESC) loop
DBMS_OUTPUT.PUT_LINE(i.nom);
end loop;
else
DBMS_OUTPUT.PUT_LINE('entrer ASC ou DESC');
end if;
end stockeeTrie;