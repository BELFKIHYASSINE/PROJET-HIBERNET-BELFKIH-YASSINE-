create or replace procedure stockeeV2(montant in number) is
begin
for i in (select * from employes where salaire>montant) loop
DBMS_OUTPUT.PUT_LINE(i.nom);
end loop;
end stockeeV2;