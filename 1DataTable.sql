CREATE DATABASE FitnessCenter;
GO

USE FitnessCenter;

CREATE TABLE Orte (
    OrtId int not null IDENTITY, 
    PLZ varchar(10), 
    Ortname varchar(50) not null, 
    Kanton char(2), 
    CONSTRAINT pk_Orte PRIMARY KEY(OrtId)
)

CREATE TABLE Kunden (
    Kundennummer int IDENTITY(1,1) not null,
    Vorname varchar(30) not null,
    Nachname varchar(30) not null, 
    Geschlecht char(1),
    Geburtsdatum smalldatetime, 
    Wohnort int, 
    CONSTRAINT pk_Kunden PRIMARY KEY (Kundennummer), 
    CONSTRAINT fk_KundenOrte FOREIGN KEY (Wohnort) REFERENCES Orte(OrtId)
);

CREATE TABLE Mitarbeiter (
    Personalnummer int IDENTITY(1,1) PRIMARY KEY,
    Vorname VARCHAR(30),
    Nachname VARCHAR(30)
);

CREATE TABLE Betreuung (
    Kundennummer int NOT NULL,
    Personalnummer int NOT NULL,
    CONSTRAINT pk_Betreuung PRIMARY KEY (Kundennummer, Personalnummer),
    CONSTRAINT fk_BetreuungMitarbeiter FOREIGN KEY (Personalnummer) REFERENCES Mitarbeiter(Personalnummer),
    CONSTRAINT fk_BetreuungKunden FOREIGN KEY (Kundennummer) REFERENCES Kunden(Kundennummer)
);

ALTER TABLE Betreuung  ADD Notizen varchar(2000)
ALTER TABLE Betreuung ADD VonKKBezahlt bit DEFAULT 0
ALTER TABLE Kunden ADD Krankenkasse varchar(50)
ALTER TABLE Mitarbeiter ADD Monatslohn int null

DROP DATABASE FitnessCenter;