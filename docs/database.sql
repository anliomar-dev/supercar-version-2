CREATE TABLE CONTACTS(
  IdContact INT AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(20) NOT NULL,
  email VARCHAR(80) NOT NULL,
  NumTel VARCHAR(15) NOT NULL,
  PRIMARY KEY(IdContact)
);

CREATE TABLE EVENNEMENT(
  IdEvenement INT AUTO_INCREMENT,
  Titre VARCHAR(100) NOT NULL,
  DateDebut DATE NOT NULL,
  DateFin DATE NOT NULL,
  Description TEXT NOT NULL,
  image VARCHAR(255),
  location VARCHAR(50) NOT NULL,
  PRIMARY KEY(IdEvenement)
);

CREATE TABLE UTILISATEUR(
  IdUtilisateur INT AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(20) NOT NULL,
  Adresse VARCHAR(150) NOT NULL,
  NumTel VARCHAR(15) NOT NULL,
  email VARCHAR(80) NOT NULL,
  MotDePasse VARCHAR(100) NOT NULL,
  PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE MARQUE(
  IdMarque INT AUTO_INCREMENT,
  NomMarque VARCHAR(50) NOT NULL,
  Logo VARCHAR(100) NOT NULL,
  PRIMARY KEY(IdMarque),
  UNIQUE(Logo)
);

CREATE TABLE MODELE(
  IdModele INT AUTO_INCREMENT,
  NomModele VARCHAR(50) NOT NULL,
  Prix DECIMAL(15,2) NOT NULL,
  TypeMoteur VARCHAR(50) NOT NULL,
  BoiteVitesse VARCHAR(50) NOT NULL,
  Caburant VARCHAR(50),
  Annee SMALLINT NOT NULL,
  Description TEXT,
  IdMarque INT NOT NULL,
  PRIMARY KEY(IdModele),
  FOREIGN KEY(IdMarque) REFERENCES MARQUE(IdMarque)
);

CREATE TABLE GROUPES(
  IdGroupe INT,
  NomGroupe VARCHAR(65) NOT NULL,
  PRIMARY KEY(IdGroupe),
  UNIQUE(NomGroupe)
);

CREATE TABLE HORAIRES(
  IdHoraire INT,
  Heure TIME NOT NULL,
  PRIMARY KEY(IdHoraire)
);

CREATE TABLE IMAGES(
  IdImage INT,
  Nom VARCHAR(50) NOT NULL,
  Type VARCHAR(50) NOT NULL,
  Color VARCHAR(50) NOT NULL,
  IdModele INT NOT NULL,
  PRIMARY KEY(IdImage),
  UNIQUE(Nom),
  FOREIGN KEY(IdModele) REFERENCES MODELE(IdModele)
);

CREATE TABLE PERMISSIONS(
  IdPermission INT,
  NomPermission VARCHAR(115) NOT NULL,
  PRIMARY KEY(IdPermission)
);

CREATE TABLE VISITES(
  IdVisite INT,
  DateVisite DATE NOT NULL,
  HeureVisite VARCHAR(50) NOT NULL,
  IdUtilisateur INT,
  PRIMARY KEY(IdVisite),
  FOREIGN KEY(IdUtilisateur) REFERENCES UTILISATEUR(IdUtilisateur)
);

CREATE TABLE NEWSLETTER(
  Id INT,
  email VARCHAR(100) NOT NULL,
  PRIMARY KEY(Id),
  UNIQUE(email)
);

CREATE TABLE Horodotage(
  IdHorodotage INT,
  NomUtilisateur VARCHAR(100) NOT NULL,
  DateAction DATE NOT NULL,
  HeureAction TIME NOT NULL,
  Action VARCHAR(100) NOT NULL,
  IdUtilisateur INT NOT NULL,
  PRIMARY KEY(IdHorodotage),
  FOREIGN KEY(IdUtilisateur) REFERENCES UTILISATEUR(IdUtilisateur)
);

CREATE TABLE ESSAIS(
  IdEssaie INT AUTO_INCREMENT,
  DateEssaie DATE NOT NULL,
  Heure TIME NOT NULL,
  status VARCHAR(50) NOT NULL,
  IdMarque INT NOT NULL,
  IdModele INT NOT NULL,
  IdUtilisateur INT NOT NULL,
  PRIMARY KEY(IdEssaie),
  FOREIGN KEY(IdMarque) REFERENCES MARQUE(IdMarque),
  FOREIGN KEY(IdModele) REFERENCES MODELE(IdModele),
  FOREIGN KEY(IdUtilisateur) REFERENCES UTILISATEUR(IdUtilisateur)
);

CREATE TABLE GROUPE_PERMISSIONS(
  IdGroupe INT,
  IdPermission INT,
  PRIMARY KEY(IdGroupe, IdPermission),
  FOREIGN KEY(IdGroupe) REFERENCES GROUPES(IdGroupe),
  FOREIGN KEY(IdPermission) REFERENCES PERMISSIONS(IdPermission)
);

CREATE TABLE UTILISATEUR_GROUPES(
  IdUtilisateur INT,
  IdGroupe INT,
  PRIMARY KEY(IdUtilisateur, IdGroupe),
  FOREIGN KEY(IdUtilisateur) REFERENCES UTILISATEUR(IdUtilisateur),
  FOREIGN KEY(IdGroupe) REFERENCES GROUPES(IdGroupe)
);

CREATE TABLE utilisateur_permissions(
  IdUtilisateur INT,
  IdPermission INT,
  PRIMARY KEY(IdUtilisateur, IdPermission),
  FOREIGN KEY(IdUtilisateur) REFERENCES UTILISATEUR(IdUtilisateur),
  FOREIGN KEY(IdPermission) REFERENCES PERMISSIONS(IdPermission)
);
