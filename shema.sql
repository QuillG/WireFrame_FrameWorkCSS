-- Create Schema
CREATE DATABASE cinema;

-- Create Table Salle
DROP TABLE IF EXISTS Salle;
CREATE TABLE Salle 
(
  id INT PRIMARY KEY NOT NULL,
  Nom VARCHAR(45) NOT NULL,
  Nb_Places INT NOT NULL
);

-- Create Table Langue
DROP TABLE IF EXISTS Langue;
CREATE TABLE Langue 
(
  id INT PRIMARY KEY NOT NULL,
  Langue VARCHAR(45) NOT NULL
);

-- Create Table Personne
DROP TABLE IF EXISTS Personne;
CREATE TABLE Personne 
(
  id INT PRIMARY KEY NOT NULL,
  Nom VARCHAR(45) NULL,
  Prénom VARCHAR(45) NULL
);

-- Create Table Réalisateur
DROP TABLE IF EXISTS Réalisateur;
CREATE TABLE Réalisateur 
(
  id INT PRIMARY KEY NOT NULL,
  Personne_id INT NOT NULL,
  FOREIGN KEY (Personne_id) REFERENCES Personne(id)
);

-- Create table LimiteAge
DROP TABLE IF EXISTS LimiteAge;
CREATE TABLE LimiteAge 
(
  id INT PRIMARY KEY NOT NULL,
  Intitulé VARCHAR(45) NOT NULL,
  Age_Mini INT NOT NULL
);

-- Create Table Tarif
DROP TABLE IF EXISTS Tarif
CREATE TABLE Tarif 
(
  id INT PRIMARY KEY NOT NULL,
  Intitulé VARCHAR(45) NOT NULL,
  Prix FLOAT NOT NULL
);

-- Create Table Film
DROP TABLE IF EXISTS Film;
CREATE TABLE Film 
(
  id INT PRIMARY KEY NOT NULL,
  Titre VARCHAR(100) NOT NULL,
  Durée VARCHAR(45) NOT NULL,
  Date_de_sortie DATE NOT NULL,
  Synopsis LONGTEXT NULL,
  Commentaire_additionnel LONGTEXT NULL,
  Avant_première TINYINT NULL,
  durée_exploitation DATE NOT NULL,
  Version_id INT NOT NULL,
  Réalisateur_id INT NOT NULL,
  LimiteAge_id INT NOT NULL,
  Tarif_id INT NOT NULL,
  INDEX fk_Film_Réalisateur1_idx (Réalisateur_id ASC),
  INDEX fk_Film_LimiteAge1_idx (LimiteAge_id ASC),
  INDEX fk_Film_Tarif1_idx (Tarif_id ASC),
  CONSTRAINT fk_Film_Réalisateur1
    FOREIGN KEY (Réalisateur_id)
    REFERENCES mydb.Réalisateur (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_LimiteAge1
    FOREIGN KEY (LimiteAge_id)
    REFERENCES mydb.LimiteAge (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_Tarif1
    FOREIGN KEY (Tarif_id)
    REFERENCES mydb.Tarif (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create table Date
DROP TABLE IF EXISTS Date;
CREATE TABLE Date
(
  id INT PRIMARY KEY NOT NULL,
  Date DATETIME NULL
);

-- Create Table Plan_Seance
DROP TABLE IF EXISTS Plan_Seance;
CREATE TABLE Plan_Seance
(
  id INT PRIMARY KEY NOT NULL,
  Salle_id INT NOT NULL,
  Film_id INT NOT NULL,
  Date_id INT NOT NULL,
  Langue_id INT NOT NULL,
  INDEX fk_Seance_Salle1_idx (Salle_id ASC),
  INDEX fk_Plan_Seance_Film1_idx (Film_id ASC),
  INDEX fk_Plan_Seance_Date1_idx (Date_id ASC),
  INDEX fk_Plan_Seance_Langue1_idx (Langue_id ASC),
  CONSTRAINT fk_Seance_Salle1
    FOREIGN KEY (Salle_id)
    REFERENCES mydb.Salle (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Film1
    FOREIGN KEY (Film_id)
    REFERENCES mydb.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Date1
    FOREIGN KEY (Date_id)
    REFERENCES mydb.Date (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Seance_Langue1
    FOREIGN KEY (Langue_id)
    REFERENCES mydb.Langue (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create Table Acteur
DROP TABLE IF EXISTS Acteur;
CREATE TABLE Acteur
(
  id INT NOT NULL,
  Personne_id INT NOT NULL,
  PRIMARY KEY (id, Personne_id),
  INDEX fk_Acteur_Personne1_idx (Personne_id ASC),
  CONSTRAINT fk_Acteur_Personne1
    FOREIGN KEY (Personne_id)
    REFERENCES mydb.Personne (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create Table Genre
DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre
(
  id INT PRIMARY KEY NOT NULL,
  Intitulé VARCHAR(45) NOT NULL
);

-- Create Table Film_has_Genre
DROP TABLE IF EXISTS Film_has_Genre;
CREATE TABLE Film_has_Genre (
  Film_id INT NOT NULL,
  Genre_id INT NOT NULL,
  PRIMARY KEY (Film_id, Genre_id),
  INDEX fk_Film_has_Genre_Genre1_idx (Genre_id ASC),
  INDEX fk_Film_has_Genre_Film1_idx (Film_id ASC),
  CONSTRAINT fk_Film_has_Genre_Film1
    FOREIGN KEY (Film_id)
    REFERENCES mydb.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_has_Genre_Genre1
    FOREIGN KEY (Genre_id)
    REFERENCES mydb.Genre (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Billet;
CREATE TABLE Billet
(
  id INT NOT NULL,
  Tarif_id INT NOT NULL,
  Seance_id INT NOT NULL,
  Salle_id INT NOT NULL,
  PRIMARY KEY (id, Tarif_id, Seance_id, Salle_id),
  INDEX fk_Billet_Tarif1_idx (Tarif_id ASC),
  INDEX fk_Billet_Seance1_idx (Seance_id ASC),
  INDEX fk_Billet_Salle1_idx (Salle_id ASC),
  CONSTRAINT fk_Billet_Tarif1
    FOREIGN KEY (Tarif_id)
    REFERENCES mydb.Tarif (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Billet_Seance1
    FOREIGN KEY (Seance_id)
    REFERENCES mydb.Plan_Seance (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Billet_Salle1
    FOREIGN KEY (Salle_id)
    REFERENCES mydb.Salle (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create table Film_has_Acteur
DROP TABLE IF EXISTS Film_has_Acteur;
CREATE TABLE Film_has_Acteur
(
  Film_id INT NOT NULL,
  Acteur_id INT NOT NULL,
  PRIMARY KEY (Film_id, Acteur_id),
  INDEX fk_Film_has_Acteur_Acteur1_idx (Acteur_id ASC),
  INDEX fk_Film_has_Acteur_Film1_idx (Film_id ASC),
  CONSTRAINT fk_Film_has_Acteur_Film1
    FOREIGN KEY (Film_id)
    REFERENCES mydb.Film (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Film_has_Acteur_Acteur1
    FOREIGN KEY (Acteur_id)
    REFERENCES mydb.Acteur (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)

INSERT INTO Personne (id, Nom, Prénom) VALUES (1, 'Spielberg', 'Steven');
INSERT INTO Réalisateur (id, Personne_id) VALUES (1, 1);
INSERT INTO Personne (id, Nom, Prénom) VALUES (2, 'Hanks', 'Tom');
INSERT INTO Acteur (id, Personne_id) VALUES (1, 2);
INSERT INTO Personne (id, Nom, Prénom) VALUES (3, 'Damon', 'Matt');
INSERT INTO Acteur (id, Personne_id) VALUES (2, 3);
INSERT INTO Personne (id, Nom, Prénom) VALUES (4, 'Dujardin', 'Jean');
INSERT INTO Acteur (id, Personne_id) VALUES (3, 4);
Insert Into Réalisateur (id, Personne_id) VALUES (3, 4);

INSERT INTO Salle (id, Nom, Nb_Places) VALUES (1, 'Salle 1', 100);
INSERT INTO Salle (id, Nom, Nb_Places) VALUES (2, 'Salle 2', 200);
INSERT INTO Salle (id, Nom, Nb_Places) VALUES (3, 'Salle 3', 300);

INSERT INTO Langue (id, Langue) VALUES (1, 'Français');
INSERT INTO Langue (id, Langue) VALUES (2, 'Anglais');
INSERT INTO Langue (id, Langue) VALUES (3, 'Espagnol');

INSERT INTO LimiteAge (id, Intitulé, Age_Mini) VALUES (1, 'Tous publics', 0);
INSERT INTO LimiteAge (id, Intitulé, Age_Mini) VALUES (2, '-12 ans', 12);
INSERT INTO LimiteAge (id, Intitulé, Age_Mini) VALUES (3, '-16 ans', 16);
INSERT INTO LimiteAge (id, Intitulé, Age_Mini) VALUES (4, '-18 ans', 18);

INSERT INTO Tarif (id, Intitulé, Prix) VALUES (1, 'Normal', 10);
INSERT INTO Tarif (id, Intitulé, Prix) VALUES (2, 'Réduit', 8);
INSERT INTO Tarif (id, Intitulé, Prix) VALUES (3, 'Enfant', 5);

