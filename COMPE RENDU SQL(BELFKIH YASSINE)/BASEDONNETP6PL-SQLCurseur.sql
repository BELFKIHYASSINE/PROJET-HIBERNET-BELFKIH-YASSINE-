/*EXERCICE 1

CREATE TABLE COMMANDE (
    Numcmd INT PRIMARY KEY,
    Datcmd DATE,
    Numfour VARCHAR(10),
    Mncmd DECIMAL(10,2)
);


CREATE TABLE FOURNISSEURS (
    Numfour VARCHAR(10) PRIMARY KEY,
    Adrfour VARCHAR(50)
);

INSERT INTO COMMANDE (Numcmd, Datcmd, Numfour, Mncmd) VALUES
(1050, TO_DATE('26/10/89', 'DD/MM/YY'), 'TH008', 1587.50);
(1025, TO_DATE('28/09/89', 'DD/MM/YY'), 'TH009', 1678.90);
(1021, TO_DATE('18/10/88', 'DD/MM/YY'), 'BM118', 4857.10);

INSERT INTO FOURNISSEURS (Numfour, Adrfour) VALUES
('TH009', 'Bordeaux');
('TH008', 'Paris');

1)
declare
CURSOR c IS SELECT * FROM COMMANDE;
rec c%ROWTYPE;
BEGIN
open c;
    LOOP
        fetch c into rec;
        exit when c%notfound; 
        DBMS_OUTPUT.PUT_LINE(rec.Numcmd || ' ' || rec.Datcmd || ' ' || rec.Numfour || ' ' || rec.Mncmd);
    END LOOP;
close c;
end;
/

2)

DECLARE
CURSOR c IS SELECT * FROM COMMANDE WHERE Mncmd > (SELECT AVG(Mncmd) FROM COMMANDE);
rec c%ROWTYPE;
BEGIN
open c;
    LOOP
        fetch c into rec;
        exit when c%notfound;
        DBMS_OUTPUT.PUT_LINE(rec.Numcmd || ' ' || rec.Datcmd || ' ' || rec.Numfour || ' ' || rec.Mncmd);
    END LOOP;
close c;
end;
/

3)
DECLARE
cursor c is select * FROM COMMANDE WHERE Numfour IN (SELECT Numfour FROM FOURNISSEURS WHERE Adrfour = 'Paris');
rec c%ROWTYPE;
BEGIN
open c;
    LOOP
        fetch c into rec;
        exit when c%notfound;
        DBMS_OUTPUT.PUT_LINE(rec.Numcmd || ' ' || rec.Datcmd || ' ' || rec.Numfour || ' ' || rec.Mncmd);
    end loop;
close c;
end;
/

EXERCICE 2

CREATE TABLE DEPT (
    NumD INT PRIMARY KEY,
    NomD VARCHAR(50) NOT NULL,
    Lieu VARCHAR(50)
);

INSERT INTO DEPT (NumD, NomD, Lieu) VALUES
(1, 'Droit', 'Créteil');
(2, 'Commerce', 'Boston');

CREATE TABLE EMP (
    NomE VARCHAR(50),
    Fonction VARCHAR(50),
    NumS INT,
    Embauche DATE,
    Salaire DECIMAL(10,2),
    Comm DECIMAL(10,2),
    NumD INT
);

INSERT INTO EMP (NomE, Fonction, NumS, Embauche, Salaire, Comm, NumD) VALUES
('Gava', 'Président', NULL, TO_DATE('10/10/1979', 'DD/MM/YYYY'), 10000, NULL, NULL);
('Guimezanes', 'Doyen', 1, TO_DATE('01/10/2006', 'DD/MM/YYYY'), 5000, NULL, 1);
('Toto', 'Stagiaire', 1, TO_DATE('01/10/2006', 'DD/MM/YYYY'), 0, NULL, 1);
('Al-Capone', 'Commercial', 2, TO_DATE('01/10/2006', 'DD/MM/YYYY'), 5000, 100, 2);

1)
DECLARE
CURSOR c IS SELECT * FROM EMP WHERE Comm IS NOT NULL ORDER BY Comm;
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.NomE || ' ' || i.Fonction || ' ' || i.NumS || ' ' || i.Embauche || ' ' || i.Salaire || ' ' || i.Comm || ' ' || i.NumD);
END LOOP;
END;
/

2)
DECLARE
CURSOR c IS SELECT * FROM EMP WHERE Embauche > '01-SEP-2006';
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.NomE || ' ' || i.Fonction || ' ' || i.NumS || ' ' || i.Embauche || ' ' || i.Salaire || ' ' || i.Comm || ' ' || i.NumD);
END LOOP;
END;
/

3)
DECLARE
CURSOR c IS SELECT * FROM EMP WHERE NumD IN (SELECT NumD FROM Dept WHERE Lieu = 'Créteil');
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.NomE || ' ' || i.Fonction || ' ' || i.NumS || ' ' || i.Embauche || ' ' || i.Salaire || ' ' || i.Comm || ' ' || i.NumD);
END LOOP;
END;
/

4)
DECLARE
CURSOR c IS SELECT NumS FROM EMP WHERE NomE = 'Guimezanes' ;
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.NumS);
END LOOP;
END;
/

5)
DECLARE
CURSOR c IS SELECT AVG(salaire) AS moy FROM EMP;
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.moy);
END LOOP;
END;
/

6)
DECLARE
CURSOR c IS SELECT COUNT(*) AS n FROM EMP WHERE Comm IS NOT NULL;
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.n);
END LOOP;
END;
/

7)
DECLARE
CURSOR c IS SELECT * FROM EMP WHERE salaire > (SELECT AVG(salaire) FROM EMP);
BEGIN
FOR i IN c LOOP
    DBMS_OUTPUT.PUT_LINE(i.NomE || ' ' || i.Fonction || ' ' || i.NumS || ' ' || i.Embauche || ' ' || i.Salaire || ' ' || i.Comm || ' ' || i.NumD);
END LOOP;
END;
/
*/






