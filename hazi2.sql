--Maszkolt tábla létrehozása

CREATE TABLE Ugyfel_maszk (
    LOGIN VARCHAR(32) PRIMARY KEY,
    EMAIL VARCHAR(64) MASKED WITH (FUNCTION = 'email()'),
    NEV VARCHAR(64) MASKED WITH (FUNCTION = 'partial(1, "****", 1)'),
    SZULEV NUMERIC(4) MASKED WITH (FUNCTION = 'random(1950, 2005)'),
    NEM VARCHAR(1),
    CIM VARCHAR(128)
);

--Maszkolt tábla feltöltése

INSERT INTO Ugyfel_maszk (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)
SELECT LOGIN, EMAIL, NEV, SZULEV, NEM, CIM FROM Ugyfel;

--SELECT permission-el rendelkező user létrehozása

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON Ugyfel_maszk TO MaskUser

--SELECT permission-el rendelkező userrel a tábla lekérdezése

EXECUTE AS User= 'MaskUser';
SELECT * FROM Ugyfel_maszk
REVERT