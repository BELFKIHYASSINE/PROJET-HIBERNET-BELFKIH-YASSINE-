
CREATE TABLE Departement (
dept_id INT PRIMARY KEY,
nom_dept VARCHAR(50),
ville VARCHAR(50)
);
CREATE TABLE Employe (
emp_id INT PRIMARY KEY,
nom VARCHAR(50),
salaire DECIMAL(8,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departement(dept_id)
);

1) CREATE VIEW empxpublic AS SELECT emp_id, nom, dept_id FROM employe;
2) NON, une vue n'améliore PAS les performances, une vue est juste une requête stockée.
'
EXERCICE 6
1)
CREATE TABLE EMP (
    Matr INT PRIMARY KEY,
    NomE VARCHAR(50) NOT NULL,
    Poste VARCHAR(50),
    DatEmb DATE,
    Sup INT,                    
    Salaire DECIMAL(10,2),
    Commission DECIMAL(8,2),
    NumDept INT,
    Site VARCHAR(50),          
    Pays VARCHAR(50),
    Role VARCHAR(20)            
);

CREATE TABLE DEPT (
    NumDept INT PRIMARY KEY,
    NomDept VARCHAR(50),
    Lieu VARCHAR(50),
    ManagerMatr INT,            
    FOREIGN KEY (ManagerMatr) REFERENCES EMP(Matr)
);

CREATE VIEW v_emp_public AS
SELECT 
    Matr,
    NomE,
    Poste,
    DatEmb,
    NumDept,
    Site,
    Pays
FROM EMP;

CREATE VIEW v_emp_manager AS
SELECT 
    e.Matr,
    e.NomE,
    e.Poste,
    e.DatEmb,
    e.Salaire,       
    e.Commission,
    e.NumDept,
    e.Site,
    e.Pays
FROM EMP e
INNER JOIN DEPT d ON e.NumDept = d.NumDept
WHERE d.ManagerMatr = CURRENT_USER_ID();  

CREATE VIEW v_emp_rh AS
SELECT * FROM EMP;

2)
les vues classiques présentent trois limites majeures : l'absence de stockage physique, la vue est réexécutée intégralement à chaque appel, ce qui force la base à recalculer toutes les jointures et agrégations même si seul un petit filtre est appliqué, l'impossibilité d'indexation, on ne peut pas créer d'index sur une vue pour accélérer les recherches, contrairement à une table, et l'optimisation limitée, l'optimiseur de requêtes ne peut pas toujours pousser les filtres à l'intérieur de la vue

3)
les vues matérialisées stockent physiquement les données sur le disque, ce qui les rend extrêmement intéressantes pour les bases de données de plusieurs centaines de milliers d'enregistrements : elles permettent d'indexer les colonnes , d'accélérer drastiquement les requêtes, et de réduire la charge CPU car les jointures complexes et les agrégations ne sont plus recalculées à chaque appel

4)
Les vues et les privilèges GRANT/REVOKE répondent à des besoins de sécurité complémentaires mais avec des approches différentes. Les vues offrent un contrôle au niveau des colonnes et des lignes : elles permettent de masquer sélectivement des colonnes sensibles (comme le salaire) et de filtrer les lignes accessibles (par exemple, un manager ne voit que son département). Les privilèges GRANT/REVOKE agissent au niveau des objets (tables, colonnes, bases) mais ne permettent pas facilement de filtrer les lignes dynamiquement selon l'utilisateur connecté. En revanche, les vues ont un coût en performances (réexécution à chaque appel) et ne sont pas adaptées aux très grands volumes, alors que GRANT/REVOKE est purement déclaratif et n'impacte pas les performances des requêtes

5)
Non, car elle présente des failles fondamentales. Tout d'abord, les vues ne protègent pas contre les accès directs aux tables sous-jacentes : si un utilisateur a le privilège SELECT sur la table EMP, il peut contourner complètement la vue et accéder directement aux salaires. Ensuite, les utilisateurs malveillants peuvent exploiter des failles via des sous-requêtes ou des jointures pour inférer des informations sensibles non présentes dans la vue (par exemple, en croisant des données publiques avec d'autres sources)

6)
Créer des indexes sur toutes les colonnes utilisées dans les clauses WHERE, JOIN et ORDER BY : NumDept, Sup, DatEmb, Site, Pays. Utiliser des indexes composites pour les requêtes fréquentes, par exemple (NumDept, DatEmb) ou (Site, Pays). Éviter les indexes sur les colonnes trop peu sélectives (ex: sexe) et surveiller la fragmentation.