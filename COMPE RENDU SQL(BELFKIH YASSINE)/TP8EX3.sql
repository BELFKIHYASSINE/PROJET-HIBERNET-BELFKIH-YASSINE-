CREATE OR REPLACE PROCEDURE TP8EX3(v_date IN VARCHAR2) IS
jour VARCHAR2(10) := TO_CHAR(TO_DATE(v_date,'DD-MM-YYYY'),'DAY');
begin
if jour = 'SATURDAY ' OR jour = 'SUNDAY ' then
DBMS_OUTPUT.PUT_LINE('Le jour de la date donnée est ' || jour || ': tombe le week-end.');
else
DBMS_OUTPUT.PUT_LINE('Le jour de la date donnée est ' || jour || ': ne tombe pas le week-end.');
end if;
end TP8EX3;
