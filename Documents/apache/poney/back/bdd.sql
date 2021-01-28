DROP DATABASE IF EXISTS poney
CREATE DATABASE poney
USE poney

CREATE USER if NOT EXISTS "cordelia"@'localhost' IDENTIFIED BY 'meVrement';--On crée un utilisateur qui aura tout les droits
GRANT ALL ON poney.* TO 'cordelia'@'localhost';

CREATE TABLE IF NOT EXISTS 'adherants'(
    'AdherantId' int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    'Prenom' VARCHAR (255) NOT NULL UNIQUE, 
    'Nom' VARCHAR (255) NOT NULL UNIQUE, 
    'Pseudo' VARCHAR (255) NOT NULL UNIQUE, 
    'Email' VARCHAR (255) NOT NULL UNIQUE, 
    'Numeros' VARCHAR (255) NOT NULL UNIQUE, 
    'Adresse1' VARCHAR (255) NOT NULL, 
    'CodePostal' int(11) NOT NULL,
    'Ville' VARCHAR (255) NOT NULL ,  
    'dateAdhesion' date DEFAULT UNIQUE ,
    
)ENGINE=InnoDB; 


CREATE TABLE IF NOT EXISTS 'profils'(
    'ProfilId' int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    'Titre' VARCHAR (80) NOT NULL UNIQUE, 
    'Photo' VARCHAR (255) NOT NULL UNIQUE, 
   'Description' text not null,
   'AdherantId' int(11) NOT NULL REFERENCES Adherants,
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS 'interetAdherant'(
    'CentreInteretID' int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   'AdherantId' int(11) NOT NULL REFERENCES Adherants,
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS 'interets'(
    'interetID' int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    'Nom' VARCHAR (255) NOT NULL UNIQUE, 
)ENGINE=InnoDB;

INSERT INTO interets (Nom) VALUES
('sport'),('musique'),('jeux vidéos'),('lecture'),('informatique'),
('sorties'),('cuisine'),('aviation'),('mécanique'),('licornes'),
('joaillerie'),('agriculture'),('cinéma'),('politique'),('couture'),
('animaux'),('science'),('histoire'),('svt'),('physique-chimie'),('taxidermie'),('philatélie') ;