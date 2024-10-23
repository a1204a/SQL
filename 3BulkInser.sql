USE FitnessCenter
GO

CREATE TABLE tmp_Ort
(
    ONRP               int NOT NULL PRIMARY KEY, 
    PLZTyp             tinyint NOT NULL,
    PLZ                smallint NOT NULL, 
    PLZZusatz          smallint NOT NULL, 
    Ortsbezeichnung18  varchar(18) NOT NULL,
    Ortsbezeichnung27  varchar(27) NOT NULL,
    Kanton             char(2) NOT NULL
 );

USE FitnessCenter
GO

BULK INSERT FitnessCenter..tmp_Ort 
    FROM 'C:\Desktop\Verzeichnis-PLZ-light.csv'  
    WITH 
    (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2 , 
        CODEPAGE = 'RAW'
    );


SELECT COUNT(*) AS AnzahlOrte FROM tmp_Ort;

USE FitnessCenter
GO

INSERT INTO Orte (PLZ, Ortname, Kanton) 
   SELECT PLZ, Ortsbezeichnung27, Kanton 
   FROM tmp_Ort WHERE PLZTyp = 10 OR PLZTyp = 20  

SELECT COUNT(*) AS AnzahlOrte FROM Orte;

DROP TABLE tmp_Ort;

INSERT INTO Kunden(Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) 
VALUES 
('Beatrix', 'Hugentobler', 'w', '1963-03-24', (SELECT OrtId FROM Orte WHERE PLZ='6032'), 'CSS Versicherung'),
('Viktor', 'Meyer', 'm', '1960-12-18', (SELECT OrtId FROM Orte WHERE PLZ='6012'), 'Group Mutuel'),
('Yanick', 'Merz', 'm', '1996-08-03', (SELECT OrtId FROM Orte WHERE PLZ='6043'), ''),
('Joshua', 'Pfister', 'm', '2001-05-28', (SELECT OrtId FROM Orte WHERE PLZ='6030'), 'Concordia'),
('Franziska', 'Tobler', 'w', '1975-03-04', (SELECT OrtId FROM Orte WHERE PLZ='6000'), 'CSS Versicherung'),
('Michele', 'dAngelo', 'm', '2002-06-30', (SELECT OrtId FROM Orte WHERE PLZ='6003'), 'CSS Versicherung'),
('Petra', 'Nussbaumer', 'w', '1969-08-25', (SELECT OrtId FROM Orte WHERE PLZ='6016'), 'Group Mutuel'),
('Admir', 'Samjic', 'm', '1963-09-07', (SELECT OrtId FROM Orte WHERE PLZ='6020'), 'CSS Versicherung'),
('Lars', 'Ramseier', 'm', '1999-01-25', (SELECT OrtId FROM Orte WHERE Ortname = 'Gisikon'), ''),
('Erna', 'Tschurtschenthaler', 'w', '1989-11-13', (SELECT OrtId FROM Orte WHERE PLZ='6024'), 'CSS Versicherung');

