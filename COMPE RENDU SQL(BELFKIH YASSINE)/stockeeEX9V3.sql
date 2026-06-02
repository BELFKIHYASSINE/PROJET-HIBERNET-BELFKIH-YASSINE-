create or replace procedure stockeeEX9V3 is
res number;
begin
FOR rec IN (SELECT DISTINCT dept FROM employes) LOOP
    select count(*) into res from employes where dept = rec.dept;
    DBMS_OUTPUT.PUT_LINE('le nombre dans departement ' || rec.dept || ' est : ' || res);
END LOOP;
end stockeeEX9V3;