/*EXERCICE 1*/

CREATE TABLE DEPT (
    NumDept   INT PRIMARY KEY,
    NomDept   VARCHAR(100) NOT NULL,
    Lieu      VARCHAR(100)
);


CREATE TABLE EMP (
    Matr       INT PRIMARY KEY,
    NomE       VARCHAR(100) NOT NULL,
    Poste      VARCHAR(100),
    DatEmb     DATE,
    Sup        INT,
    Salaire    DECIMAL(10,2),
    Commission DECIMAL(10,2),
    NumDept    INT,
    FOREIGN KEY (NumDept) REFERENCES DEPT(NumDept),
    FOREIGN KEY (Sup) REFERENCES EMP(Matr)
);


CREATE TABLE PROJET (
    CodeP   VARCHAR(20) PRIMARY KEY,
    NomP    VARCHAR(100) NOT NULL
);


CREATE TABLE PARTICIPATION (
    Matr    INT,
    CodeP   VARCHAR(20),
    Fonction VARCHAR(100),
    PRIMARY KEY (Matr, CodeP),
    FOREIGN KEY (Matr) REFERENCES EMP(Matr),
    FOREIGN KEY (CodeP) REFERENCES PROJET(CodeP)
);

INSERT INTO DEPT (NumDept, NomDept, Lieu) VALUES
(10, 'IT', 'New York'),
(20, 'HR', 'London'),
(30, 'Sales', 'Paris'),
(40, 'Marketing', 'Berlin'),
(50, 'Finance', 'Tokyo');


INSERT INTO EMP (Matr, NomE, Poste, DatEmb, Sup, Salaire, Commission, NumDept) VALUES
(1001, 'Alice Johnson', 'Manager', '2020-01-15', NULL, 75000.00, 5000.00, 10),
(1002, 'Bob Smith', 'Developer', '2021-03-20', 1001, 55000.00, 2000.00, 10),
(1003, 'Charlie Brown', 'Analyst', '2022-06-10', 1001, 48000.00, 1500.00, 10),
(1004, 'Diana Prince', 'HR Director', '2019-11-01', NULL, 70000.00, 4000.00, 20),
(1005, 'Evan Wright', 'Recruiter', '2021-08-15', 1004, 45000.00, 1000.00, 20),
(1006, 'Fiona Davis', 'Sales Lead', '2020-05-22', NULL, 68000.00, 8000.00, 30),
(1007, 'George Hill', 'Sales Rep', '2022-01-30', 1006, 42000.00, 6000.00, 30),
(1008, 'Hannah Lee', 'Marketing Specialist', '2021-09-12', NULL, 52000.00, 2500.00, 40),
(1009, 'Ian Clark', 'Financial Analyst', '2022-04-18', NULL, 58000.00, 3000.00, 50),
(1010, 'Julia Adams', 'Accountant', '2023-02-28', 1009, 44000.00, 1500.00, 50);


INSERT INTO PROJET (CodeP, NomP) VALUES
('P001', 'Mobile App Development'),
('P002', 'HR Management System'),
('P003', 'Sales CRM Platform'),
('P004', 'Marketing Campaign Q4'),
('P005', 'Financial Dashboard'),
('P006', 'Cloud Migration'),
('P007', 'Data Analytics Project');


INSERT INTO PARTICIPATION (Matr, CodeP, Fonction) VALUES
(1001, 'P001', 'Project Manager'),
(1002, 'P001', 'Backend Developer'),
(1003, 'P001', 'Database Analyst'),
(1004, 'P002', 'Project Sponsor'),
(1005, 'P002', 'HR Consultant'),
(1006, 'P003', 'Team Lead'),
(1007, 'P003', 'Sales Consultant'),
(1008, 'P004', 'Campaign Manager'),
(1001, 'P005', 'Technical Advisor'),
(1009, 'P005', 'Lead Analyst'),
(1010, 'P005', 'Data Entry'),
(1002, 'P006', 'Cloud Engineer'),
(1003, 'P007', 'Data Analyst'),
(1006, 'P007', 'Business Analyst'),
(1008, 'P007', 'Data Visualizer');

1) CREATE VIEW  V_EMP AS SELECT e.Matr, e.NomE, e.NumDept, (e.salaire + e.commission) AS GAINS, d.lieu FROM emp e INNER JOIN dept d ON e.NumDept = d.NumDept;

2) SELECT * FROM V_EMP WHERE GAINS > 10000;

3) UPDATE V_EMP SET NomE = 'M' WHERE NomE = 'MARTIN';
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

4) CREATE VIEW VEMP10 AS SELECT * FROM emp WHERE NumDept = 10;
INSERT INTO VEMP10 VALUES (1011, 'SOULIER', 'Manager', '2020-01-15', NULL, 75000.00, 5000.00, 20);
SELECT * FROM VEMP10 WHERE NomE = 'SOULIER'
SELECT * FROM emp WHERE NomE = 'SOULIER'

5) DROP VIEW VEMP10;
CREATE VIEW VEMP10 AS SELECT * FROM emp WHERE NumDept = 10 WITH CHECK OPTION;

6) INSERT INTO VEMP10 VALUES (1012, 'BALARD', 'Manager', '2020-01-15', NULL, 75000.00, 5000.00, 30);
Error Code: 1369. CHECK OPTION failed 'new_schema.vemp10'

UPDATE VEMP10 SET NumDept = 9 WHERE Matr = 1001;
Error Code: 1369. CHECK OPTION failed 'new_schema.vemp10'

7) CREATE VIEW totsa AS SELECT NumDept, SUM(Salaire) AS salaire_totale FROM emp GROUP BY NumDept;
SELECT NomE,(e1.salaire / (SELECT salaire_totale FROM totsa WHERE Numdept = e1.NumDept))*100 FROM emp e1;

SELECT NomE,(e1.salaire / (SELECT SUM(Salaire) FROM emp WHERE Numdept = e1.NumDept GROUP BY NumDept))*100 FROM emp e1;

/*EXERCICE 2*/

1) CREATE UNIQUE INDEX idx_emp_nome ON EMP(NomE);
CREATE INDEX idx_emp_numdept ON EMP(NumDept);

2) DROP INDEX idx_emp_nome ON EMP;



