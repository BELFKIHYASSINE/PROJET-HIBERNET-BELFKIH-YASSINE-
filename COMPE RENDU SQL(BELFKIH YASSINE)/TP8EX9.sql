BEGIN
DELETE FROM pays WHERE pays_id=1;
if(SQL%FOUND) THEN
    DBMS_OUTPUT.PUT_LINE('le ligne est supprimé');
ELSE
    DBMS_OUTPUT.PUT_LINE('le ligne nexiste pas');
END IF;
COMMIT;
END;
/