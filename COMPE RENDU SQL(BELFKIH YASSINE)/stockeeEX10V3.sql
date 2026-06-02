CREATE OR REPLACE PROCEDURE stockeeEX10V2(montant IN NUMBER) IS
TYPE t_noms IS TABLE OF employes.nom%TYPE;
TYPE t_salaires IS TABLE OF employes.salaire%TYPE;
v_noms t_noms;
v_salaires t_salaires;
BEGIN
SAVEPOINT avant_suppression;
DELETE FROM employes WHERE salaire < montant RETURNING nom, salaire BULK COLLECT INTO v_noms, v_salaires;
FOR i IN 1..v_noms.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Employé supprimé : ' || v_noms(i) || ' (salaire: ' || v_salaires(i) || ')');
END LOOP;
COMMIT;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK TO avant_suppression;
    DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
    RAISE;
END stockeeEX10V2;
