USE diarra_care2;



DROP TABLE Consultation_Diagnostic;
CREATE TABLE Consultation_Diagnostic (
    id_consultation INT NOT NULL,
    id_diagnostic INT NOT NULL,
    PRIMARY KEY (id_consultation, id_diagnostic),
    FOREIGN KEY (id_consultation) REFERENCES Consultation(id_consultation),
    FOREIGN KEY (id_diagnostic) REFERENCES Diagnostic(id_diagnostic)
);
SELECT name FROM sys.tables WHERE name = 'Consultation_Diagnostic';
SELECT SCHEMA_NAME(schema_id) AS schema_name, name 
FROM sys.tables 
WHERE name = 'Consultation_Diagnostic';
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'dbo' 
  AND TABLE_NAME = 'Consultation_Diagnostic';
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'dbo' 
  AND TABLE_NAME = 'Consultation_Diagnostic';

IF OBJECT_ID('dbo.Consultation_Diagnostic', 'U') IS NOT NULL
    DROP TABLE dbo.Consultation_Diagnostic;
CREATE TABLE dbo.Consultation_Diagnostic (
    id_consultation INT NOT NULL,
    id_diagnostic INT NOT NULL,
    PRIMARY KEY (id_consultation, id_diagnostic),
    FOREIGN KEY (id_consultation) REFERENCES Consultation(id_consultation),
    FOREIGN KEY (id_diagnostic) REFERENCES Diagnostic(id_diagnostic)
);
SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Consultation_Diagnostic';
DROP TABLE IF EXISTS dbo.Consultation_Diagnostic;
SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Consultation_Diagnostic';


