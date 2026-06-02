declare
cursor c is select * from employes where dept=8 FOR UPDATE;
begin
for emp in c loop
if emp.salaire<5000 then
update employes set salaire = salaire+100 where current of c;
else
update employes set salaire = salaire+50 where current of c;
end if;
end loop;
end;
/
