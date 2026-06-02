SET SERVEROUTPUT ON;

DECLARE
    type rec is RECORD (
    Matr number,
    NomE VARCHAR2(40),
    salaire number
    );
    type tab is TABLE OF rec INDEX BY BINARY_INTEGER;
    t tab;
    salaire_moyen number := 0;
    salaire_max number := 0;
BEGIN
    t(1).Matr := 1;
    t(1).NomE := 'Jean';
    t(1).salaire := 132.23;
    t(2).Matr := 2;
    t(2).NomE := 'Dupont';
    t(2).salaire := 193.48;
    t(3).Matr := 3;
    t(3).NomE := 'Max';
    t(3).salaire := 394.12;
    t(4).Matr := 4;
    t(4).NomE := 'John';
    t(4).salaire := 250.30;
    t(5).Matr := 5;
    t(5).NomE := 'Andrew';
    t(5).salaire := 200.50;
    
    FOR i in 1..5 LOOP
        salaire_moyen := salaire_moyen + t(i).salaire;
        if t(i).salaire > salaire_max then
            salaire_max := t(i).salaire;
        end if;
    END LOOP;
    salaire_moyen := salaire_moyen/5;
    DBMS_OUTPUT.PUT_LINE('le salaire moyen est ' || salaire_moyen || ' le salaire maximal est ' || salaire_max);
end;
/
    
    
    
    