/*EXERCICE 1*/

CREATE TABLE SEXE (
    Cdsexe CHAR(1) PRIMARY KEY,
    Lbsexe VARCHAR(20) NOT NULL
);

CREATE TABLE ETUDIANT (
    Numetu INT PRIMARY KEY,
    Nometu VARCHAR(100) NOT NULL,
    Dtnaiss DATE,
    Cdsexe CHAR(1),
    FOREIGN KEY (Cdsexe) REFERENCES SEXE(Cdsexe)
);

CREATE TABLE ENSEIGNANT (
    Numens INT PRIMARY KEY,
    Nomens VARCHAR(100) NOT NULL,
    Grade VARCHAR(50),
    Ancien INT
);


CREATE TABLE MATIERE (
    Numat INT PRIMARY KEY,
    Nomat VARCHAR(100) NOT NULL,
    Coeff DECIMAL(3,2),
    Numens INT,
    FOREIGN KEY (Numens) REFERENCES ENSEIGNANT(Numens)
);

CREATE TABLE NOTES (
    Numetu INT,
    Numat INT,
    Note DECIMAL(4,2),
    PRIMARY KEY (Numetu, Numat),
    FOREIGN KEY (Numetu) REFERENCES ETUDIANT(Numetu),
    FOREIGN KEY (Numat) REFERENCES MATIERE(Numat)
);

INSERT INTO SEXE (Cdsexe, Lbsexe) VALUES 
('M', 'Masculin'),
('F', 'Feminin');

INSERT INTO ETUDIANT VALUES 
(1, 'Dupont Jean', '2000-05-15', 'M'),
(2, 'Martin Sophie', '2001-08-22', 'F'),
(3, 'Bernard Lucas', '2000-12-10', 'M'),
(4, 'Petit Emma', '2002-03-18', 'F'),
(5, 'Durand Thomas', '2001-01-30', 'M');

INSERT INTO ENSEIGNANT VALUES 
(101, 'Richard Claire', 'Professeur', 15),
(102, 'Laurent Michel', 'Maitre de conferences', 8),
(103, 'Moreau Sylvie', 'Professeur', 20),
(104, 'Garcia Philippe', 'Assistant', 3);

INSERT INTO MATIERE VALUES 
(201, 'Mathematiques', 4.00, 101),
(202, 'Physique', 3.00, 102),
(203, 'Informatique', 3.00, 103),
(204, 'Anglais', 2.00, 104),
(205, 'Philosophie', 2.00, 101);

INSERT INTO NOTES VALUES 
(1, 201, 15.50),
(1, 202, 14.00),
(1, 203, 16.00),
(1, 204, 12.50),
(1, 205, 13.00),
(2, 201, 17.00),
(2, 202, 15.50),
(2, 203, 18.00),
(2, 204, 14.00),
(2, 205, 16.00),
(3, 201, 10.00),
(3, 202, 11.50),
(3, 203, 9.00),
(3, 204, 13.00),
(3, 205, 12.00),
(4, 201, 14.00),
(4, 202, 13.50),
(4, 203, 15.00),
(4, 204, 16.00),
(4, 205, 14.50),
(5, 201, 8.50),
(5, 202, 9.00),
(5, 203, 10.00),
(5, 204, 11.00),
(5, 205, 9.50);

1) SELECT Numetu, Nometu, Cdsexe FROM etudiant WHERE Dtnaiss IS NULL

2) SELECT Nometu, Dtnaiss FROM etudiant where Nometu LIKE "_a%"

3) SELECT Nomat FROM matiere WHERE coeff BETWEEN 1 AND 2 

4) SELECT Note FROM NOTES WHERE Numetu = 1 AND Note IN (SELECT Note FROM NOTES WHERE Numetu = 2)

5) SELECT Note FROM NOTES WHERE Numetu = 1 AND Note > ANY (SELECT Note FROM NOTES WHERE Numetu = 2)

6) SELECT Note FROM NOTES WHERE Numetu = 1 AND Note < ALL (SELECT Note FROM NOTES WHERE Numetu = 9)

7) SELECT * FROM etudiant WHERE Numetu NOT IN (SELECT Numetu FROM Notes)

8) SELECT Cdsexe, AVG(DATEDIFF(Dtnaiss,'2000-01-01')/365.25) FROM etudiant GROUP BY Cdsexe

9) SELECT Numens, Grade FROM Enseignant WHERE Numens IN (SELECT Numens FROM Matiere WHERE Nomat = "histoire")

10) SELECT Nometu, Numetu FROM etudiant WHERE Numetu NOT IN (SELECT Numetu FROM notes WHERE Numat = (SELECT Numat FROM matiere WHERE Nomat = 'Sociology'))

/*EXERCICE 2*/

CREATE TABLE DEPT (
    NumDept INT PRIMARY KEY,
    NomDept VARCHAR(100) NOT NULL,
    Lieu VARCHAR(100)
);

CREATE TABLE EMP (
    Matr INT PRIMARY KEY,
    NomE VARCHAR(100) NOT NULL,
    Poste VARCHAR(50),
    DatEmb DATE,
    Sup INT,
    Salaire DECIMAL(10,2),
    Commission DECIMAL(10,2),
    NumDept INT,
    FOREIGN KEY (NumDept) REFERENCES DEPT(NumDept),
    FOREIGN KEY (Sup) REFERENCES EMP(Matr)
);

CREATE TABLE PROJET (
    CodeP VARCHAR(20) PRIMARY KEY,
    NomP VARCHAR(100) NOT NULL
);


CREATE TABLE PARTICIPATION (
    Matr INT,
    CodeP VARCHAR(20),
    Fonction VARCHAR(100),
    PRIMARY KEY (Matr, CodeP),
    FOREIGN KEY (Matr) REFERENCES EMP(Matr),
    FOREIGN KEY (CodeP) REFERENCES PROJET(CodeP)
);


INSERT INTO DEPT VALUES 
(10, 'Informatique', 'Paris'),
(20, 'Ressources Humaines', 'Lyon'),
(30, 'Comptabilite', 'Paris'),
(40, 'Marketing', 'Marseille'),
(50, 'Recherche', 'Toulouse');


INSERT INTO EMP VALUES 
(1001, 'Martin Jean', 'Directeur', '2010-01-15', NULL, 75000, 10000, 10),
(1002, 'Durand Sophie', 'Chef Projet', '2012-03-20', 1001, 55000, 5000, 10),
(1003, 'Bernard Pierre', 'Analyste', '2015-06-10', 1002, 45000, 3000, 10),
(1004, 'Petit Marie', 'Developpeur', '2018-01-05', 1003, 38000, 2000, 10),
(1005, 'Robert Paul', 'Developpeur', '2019-09-12', 1003, 35000, 1500, 10),
(2001, 'Richard Claire', 'Directeur RH', '2011-04-22', NULL, 65000, 8000, 20),
(2002, 'Dubois Luc', 'Recruteur', '2016-08-15', 2001, 42000, 2000, 20),
(3001, 'Moreau Alain', 'Comptable', '2014-11-01', NULL, 48000, 3000, 30),
(3002, 'Garcia Maria', 'Assistant Comptable', '2020-02-10', 3001, 32000, 1000, 30),
(4001, 'Lefevre Julie', 'Chef Marketing', '2013-07-19', NULL, 52000, 4000, 40),
(5001, 'Simon Thomas', 'Chercheur', '2017-12-03', NULL, 47000, 2500, 50);


INSERT INTO PROJET VALUES 
('P001', 'Migration Cloud'),
('P002', 'IA pour RH'),
('P003', 'ERP Nouvelle Version'),
('P004', 'Application Mobile'),
('P005', 'Securite Donnees');


INSERT INTO PARTICIPATION VALUES 
(1001, 'P001', 'Sponsor'),
(1002, 'P001', 'Chef Projet'),
(1003, 'P001', 'Architecte'),
(1004, 'P001', 'Developpeur'),
(1005, 'P001', 'Developpeur'),
(1002, 'P002', 'Chef Projet'),
(2002, 'P002', 'Expert Metier'),
(1003, 'P003', 'Lead Technique'),
(1004, 'P003', 'Developpeur'),
(3001, 'P003', 'Expert Comptable'),
(1001, 'P004', 'Sponsor'),
(1004, 'P004', 'Lead Developpeur'),
(1005, 'P004', 'Developpeur'),
(5001, 'P005', 'Chercheur Principal');

11) SELECT DISTINCT Lieu FROM dept WHERE Numdept IN (SELECT Numdept FROM emp WHERE Commission IS NOT NULL)

12) SELECT Lieu, NomDept FROM dept WHERE Numdept IN (SELECT Numdept FROM emp WHERE Poste = 'Ingénieur')

13) SELECT NomDept, Lieu FROM dept WHERE Numdept NOT IN (SELECT Numdept FROM emp WHERE Poste = 'Ingénieur')

14) SELECT * FROM emp e1 WHERE e1.salaire*2 < (SELECT e2.salaire FROM emp e2 WHERE e2.Matr = e1.Sup)

15) SELECT NomE FROM emp WHERE salaire > ALL (SELECT salaire FROM emp WHERE poste = 'Commerce')

16) a) SELECT NomE FROM emp WHERE NumDept NOT IN (SELECT DISTINCT NumDept FROM emp WHERE Poste = 'commerce')

16) b) SELECT NomE FROM emp WHERE NumDept IN (SELECT DISTINCT NumDept FROM emp WHERE Poste = 'commerce')

17) SELECT * FROM emp WHERE (Poste, Sup) = (SELECT Poste, Sup FROM emp WHERE NomE = 'BERGER')