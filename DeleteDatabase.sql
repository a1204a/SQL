USE master;
GO

-- Schließt alle Verbindungen zur Datenbank „FitnessCenterDemo“
ALTER DATABASE FitnessCenterDemo 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO

-- Löscht die Datenbank
DROP DATABASE FitnessCenterDemo;
GO