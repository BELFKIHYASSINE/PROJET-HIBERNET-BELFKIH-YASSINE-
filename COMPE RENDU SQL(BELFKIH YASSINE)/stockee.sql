create or replace procedure stockee(montant in number) is
cursor c is select * from employes where salaire>montant;
rec employes%rowtype;
begin
open c;
loop
fetch c into rec;
exit when c%notfound;
DBMS_OUTPUT.PUT_LINE(rec.nom);
end loop;
close c;
end stockee;