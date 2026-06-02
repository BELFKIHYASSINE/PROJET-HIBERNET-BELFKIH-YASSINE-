EXERCICE 1

CREATE TABLE Nombre (n Number);
BEGIN 
FOR i in 1..100 loop
    INSERT INTO Nombre (n) VALUES (i);
END LOOP;
COMMIT;
END;
/

EXERCICE 2  

DECLARE
somme NUMBER := 0;
BEGIN
FOR i in 1..1000 LOOP
    somme := somme + i;
END LOOP;
DBMS_OUTPUT.PUT_LINE('la somme est : ' || somme);
END;
/
EXERCICE 3
BEGIN
FOR i in 1..50 LOOP
    IF (BITAND(i,1)=0) THEN
        DBMS_OUTPUT.PUT_LINE(i);
    END IF;
END LOOP;
END;
/

EXERCICE 4
ACCEPT n PROMPT 'Enter a number: '
DECLARE
fact NUMBER := 1;
BEGIN
FOR i IN 1..&n LOOP
    fact := fact * i;
END LOOP;
DBMS_OUTPUT.PUT_LINE(fact);
END;
/
EXERCICE 5
CREATE TABLE etudiant (id NUMBER PRIMARY KEY, nom VARCHAR2(30), note NUMBER(4,2));
DECLARE
TYPE tabnotes IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
v_notes tabnotes;

BEGIN
v_notes(1) := 15.5;
v_notes(2) := 12.0;
v_notes(3) := 18.5;
v_notes(4) := 8.5;
v_notes(5) := 14.0;
v_notes(6) := 16.5;
v_notes(7) := 10.0;
v_notes(8) := 19.0;
v_notes(9) := 11.5;
v_notes(10) := 13.0;

FOR i IN 1..10 LOOP
    INSERT INTO etudiant (id, nom, note) VALUES (i, 'etu' || i, v_notes(i));
END LOOP;
COMMIT;
END;
/

EXERCICE 6
DECLARE
i NUMBER := 10;
BEGIN
WHILE i>0 loop
    DBMS_OUTPUT.PUT_LINE(i);
    i := i-1;
END LOOP;
END;
/
EXERCICE 7
CREATE TABLE Produit (id NUMBER PRIMARY KEY, nom VARCHAR2(20), prix NUMBER);
BEGIN
UPDATE Produit SET prix = prix * 1.1;
COMMIT;
END;
/
EXERCICE 8
BEGIN
DELETE FROM Produit WHERE Prix < 50;
COMMIT;
END;
/
EXERCICE 9
ACCEPT n PROMPT 'entrer un nombre : '
DECLARE
v_n NUMBER := &n;
BEGIN
IF(v_n>0) THEN
    DBMS_OUTPUT.PUT_LINE('positif');
ELSIF (v_n<0) THEN
    DBMS_OUTPUT.PUT_LINE('negatif');
ELSE 
    DBMS_OUTPUT.PUT_LINE('null');
END IF;
END;
/
EXERCICE 10
CREATE TABLE Carre (nombre NUMBER, carre NUMBER);
BEGIN
FOR i IN 1..20 LOOP
    INSERT INTO Carre(nombre, carre) VALUES (i, i*i);
END LOOP;
COMMIT;
END;
/