CREATE OR REPLACE PROCEDURE TP8EX2(n IN number) IS
BEGIN
IF (BITAND(n,1)=1) THEN
DBMS_OUTPUT.PUT_LINE('le nomber est impaire');
else
DBMS_OUTPUT.PUT_LINE('le nomber est paire');
end if;
end TP8EX2;