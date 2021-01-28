DROP DATABASE IF EXISTS poney;
CREATE DATABASE poney;
USE poney;

CREATE USER if NOT EXISTS "cordelia"@'localhost' IDENTIFIED BY 'meVrement';--On crée un utilisateur qui aura tout les droits
GRANT ALL ON poney.* TO 'cordelia'@'localhost';

CREATE TABLE IF NOT EXISTS `adherants`(
    `adherantId` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `prenom` VARCHAR (255) NOT NULL , 
    `nom` VARCHAR (255) NOT NULL , 
    `pseudo` VARCHAR (255) NOT NULL, 
    `email` VARCHAR (255) NOT NULL, 
    `numeros` VARCHAR (255) NOT NULL, 
    `adresse1` VARCHAR (255) NOT NULL, 
    `codePostal` int(11) NOT NULL,
    `ville` VARCHAR (255) NOT NULL ,  
    `dateAdhesion` date DEFAULT NULL,
     UNIQUE KEY `pseudo` (`pseudo`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `numeros` (`numeros`)
)ENGINE=InnoDB; 


CREATE TABLE IF NOT EXISTS `profils`(
    `profilId` int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    `titre` VARCHAR (80) NOT NULL, 
    `photo` VARCHAR (255) NOT NULL , 
   `description` text not null,
   `adherantId` int(11) NOT NULL REFERENCES Adherants   
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `interetAdherant`(
    `centreInteretID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `adherantId` int(11) NOT NULL REFERENCES Adherants
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `interets`(
    `interetID` int(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR (255) NOT NULL UNIQUE
)ENGINE=InnoDB;

INSERT INTO interets (nom) VALUES
('sport'),('musique'),('jeux vidéos'),('lecture'),('informatique'),
('sorties'),('cuisine'),('aviation'),('mécanique'),('licornes'),
('joaillerie'),('agriculture'),('cinéma'),('politique'),('couture'),
('animaux'),('science'),('histoire'),('svt'),('physique-chimie'),('taxidermie'),('philatélie');