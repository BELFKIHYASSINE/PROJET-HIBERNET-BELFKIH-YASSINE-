BEGIN
UPDATE pays SET nom='france' WHERE pays_id=1;
if(SQL%NOTFOUND) THEN
    DBMS_OUTPUT.PUT_LINE('la ligne n''existe pas');
ELSE
    DBMS_OUTPUT.PUT_LINE('la ligne est mis à jour');
END IF;
COMMIT;
END;
/