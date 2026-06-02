BEGIN
FOR emp IN (SELECT e.id, e.nom, e.prenom, d.nom AS nom_departement FROM employes e JOIN dept d ON e.departement_id = d.dep_id) LOOP
DBMS_OUTPUT.PUT_LINE(emp.id || ' | ' || emp.nom || ' | ' || emp.prenom || ' | ' || emp.nom_departement);
END LOOP;
END;
/