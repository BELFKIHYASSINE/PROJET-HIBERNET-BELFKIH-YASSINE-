CREATE OR REPLACE PROCEDURE TP8EX5 IS
begin
for i in (select * from pays) loop
DBMS_OUTPUT.PUT_LINE(i.nom);
end loop;
end TP8EX5;