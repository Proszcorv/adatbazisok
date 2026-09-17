--stadion tabla
CREATE TABLE Stadion (
    stadion_id INT PRIMARY KEY,
    nev VARCHAR(100),
    helyszin VARCHAR(100)
);

--csapat tabla
CREATE TABLE Csapat (
    csapat_id INT PRIMARY KEY,
    nev VARCHAR(100),
  	edzo VARCHAR(100)
);

--jatekos tabla
CREATE TABLE Jatekos (
    jatekos_id INT PRIMARY KEY,
    nev VARCHAR(100),
    poszt VARCHAR(50),
    szul_dat DATE,
    mezszam INT,
    allampolgarsag VARCHAR(50),
    csapat_id INT,
    FOREIGN KEY (csapat_id) REFERENCES Csapat(csapat_id)
);

--merkozes tabla
CREATE TABLE Merkozes (
    merkozes_id INT PRIMARY KEY,
    datum DATE,
    stadion_id INT,
    hazai_csapat_id INT,
    vendeg_csapat_id INT,
    hazai_gol INT,
    vendeg_gol INT,
    FOREIGN KEY (stadion_id) REFERENCES Stadion(stadion_id),
    FOREIGN KEY (hazai_csapat_id) REFERENCES Csapat(csapat_id),
    FOREIGN KEY (vendeg_csapat_id) REFERENCES Csapat(csapat_id)
);

--lap tabla
CREATE TABLE Lap (
    lap_id INT PRIMARY KEY,
    merkozes_id INT,
    jatekos_id INT,
    tipus VARCHAR(10),
    FOREIGN KEY (merkozes_id) REFERENCES Merkozes(merkozes_id),
    FOREIGN KEY (jatekos_id) REFERENCES Jatekos(jatekos_id)
);




--tablak feltoltese teszt adatokkal

INSERT INTO Stadion (stadion_id, nev, helyszin) VALUES
(1, 'Szusza Ferenc Stadion', 'Budapest'),
(2, 'Groupama Aréna', 'Budapest'),
(3, 'MOL Aréna Sóstó', 'Székesfehérvár'),
(4, 'Bozsik Aréna', 'Budapest');

INSERT INTO Csapat (csapat_id, nev, edzo) VALUES
(1, 'Újpest', 'Károly Róbert'),
(2, 'Ferencváros','Resszer Tibor'),
(3, 'Fehérvár','Palotai Péter'),
(4, 'Honvéd','Cserei Hunor');

INSERT INTO Jatekos (jatekos_id, nev, poszt, szul_dat, mezszam, allampolgarsag, csapat_id) VALUES
(1,  'Eperjesi Benedek', 'csatár', '1995-06-12', 9, 'magyar', 1),
(2,  'Nagy Timur', 'kapus', '1990-01-01', 1, 'magyar', 1),
(3,  'Balogh Dániel', 'védő', '1992-03-14', 4, 'magyar', 1),
(4,  'Tóth Bercel', 'középpályás', '1996-07-09', 6, 'magyar', 1),
(5,  'Molnár Máté', 'védő', '1993-11-25', 5, 'magyar', 1),
(6,  'Árvai Kristóf', 'védő', '1993-08-24', 4, 'magyar', 2),
(7,  'Sáska Máté', 'kapus', '1989-12-12', 1, 'magyar', 2),
(8,  'Matolcsy András', 'középpályás', '1997-04-03', 7, 'magyar', 2),
(9,  'Kállay Dániel', 'csatár', '1995-05-15', 9, 'magyar', 2),
(10, 'Lányi Konor', 'védő', '1992-09-17', 3, 'magyar', 2),
(11, 'Bara Milán', 'kapus', '1992-05-10', 1, 'magyar', 3),
(12, 'Liebmann Marcell', 'csatár', '1994-02-22', 10, 'magyar', 3),
(13, 'Hegedűs Ádám', 'védő', '1993-10-10', 2, 'magyar', 3),
(14, 'Kovács András', 'középpályás', '1996-08-18', 6, 'magyar', 3),
(15, 'Végh Levente', 'védő', '1990-07-29', 5, 'magyar', 3),
(16, 'Bodoni László', 'középpályás', '1994-02-17', 8, 'magyar', 4),
(17, 'Szemereki Márk', 'kapus', '1991-03-05', 1, 'magyar', 4),
(18, 'Tóth Viktor', 'csatár', '1995-10-30', 11, 'magyar', 4),
(19, 'Lukátsy Máté', 'védő', '1993-06-06', 4, 'magyar', 4),
(20, 'Sepp Márton', 'védő', '1992-01-21', 2, 'magyar', 4);

INSERT INTO Merkozes (merkozes_id, datum, stadion_id, hazai_csapat_id, vendeg_csapat_id, hazai_gol, vendeg_gol) VALUES
(1,  '2023-09-01', 1, 1, 2, 0, 3),
(2,  '2023-09-08', 2, 2, 1, 2, 0),
(3,  '2023-09-02', 1, 1, 3, 1, 3),
(4,  '2023-09-09', 3, 3, 1, 2, 1),
(5,  '2023-09-03', 1, 1, 4, 1, 2),
(6,  '2023-09-10', 4, 4, 1, 3, 1),
(7,  '2023-09-04', 2, 2, 3, 2, 2),
(8,  '2023-09-11', 3, 3, 2, 1, 2),
(9,  '2023-09-05', 2, 2, 4, 1, 0),
(10, '2023-09-12', 4, 4, 2, 2, 2),
(11, '2023-09-06', 3, 3, 4, 1, 1),
(12, '2023-09-13', 4, 4, 3, 0, 1);

INSERT INTO Lap (lap_id, merkozes_id, jatekos_id, tipus) VALUES
(1, 1, 1, 'sarga'),
(2, 1, 6, 'sarga'),
(3, 2, 6, 'piros'),
(4, 3, 1, 'sarga'),
(5, 4, 14, 'sarga'),
(6, 5, 1, 'piros'),
(7, 6, 17, 'sarga'),
(8, 8, 14, 'sarga'),
(9, 9, 10, 'sarga'),
(10, 10, 17, 'piros'),
(11, 11, 13, 'sarga'),
(12, 12, 11, 'sarga'),
(13, 4, 2, 'sarga'),
(14, 9, 9, 'sarga'),
(15, 12, 5, 'sarga');

