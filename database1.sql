CREATE DATABASE gestion_produits;

USE gestion_produits;

CREATE TABLE produit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    libelle VARCHAR(100),
    type VARCHAR(100),
    quantite_en_stock INT,
    disponibilite TINYINT
);

INSERT INTO produit (id, code, libelle, type, quantite_en_stock, disponibilite) VALUES
(4, 'P004', 'Lait', 'Produits laitiers', 50, 1),
(23, 'P0077', 'Pain sans gluten', 'Boulangerie', 44, 1),
(26, 'P006', 'Fromage blanc', 'Produits laitiers', 68, 1),
(27, 'PO091', 'Chausson aux pommes', 'Boulangerie', 78, 1);