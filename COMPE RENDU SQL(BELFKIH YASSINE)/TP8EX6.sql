CREATE OR REPLACE PROCEDURE TP8EX6 IS
n number := 1;
begin
for i in (select * from pays) loop
DBMS_OUTPUT.PUT_LINE('pays ' || n || ': id :' || i.pays_id || ', le nom : ' || i.nom);
n:=n+1;
end loop;
end TP8EX6;