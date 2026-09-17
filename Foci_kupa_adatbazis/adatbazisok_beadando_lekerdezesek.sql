--Melyik stadionban hány gól született

SELECT 
    s.nev AS stadion,
    SUM(m.hazai_gol + m.vendeg_gol) AS golok_szama
FROM Merkozes m
JOIN Stadion s ON m.stadion_id = s.stadion_id
GROUP BY s.nev
ORDER BY golok_szama DESC;


--Melyik csapat hány lapot kapott

SELECT 
    cs.nev AS csapat,
    COUNT(l.lap_id) AS lapok_szama
FROM Lap l
JOIN Jatekos j ON l.jatekos_id = j.jatekos_id
JOIN Csapat cs ON j.csapat_id = cs.csapat_id
GROUP BY cs.nev
ORDER BY lapok_szama DESC;


--Melyik csapat hány pontot szerzett

SELECT 
    cs.nev AS csapat,
    SUM(
        CASE
            WHEN cs.csapat_id = m.hazai_csapat_id AND m.hazai_gol > m.vendeg_gol THEN 3
            WHEN cs.csapat_id = m.vendeg_csapat_id AND m.vendeg_gol > m.hazai_gol THEN 3
            WHEN m.hazai_gol = m.vendeg_gol THEN 1
            ELSE 0
        END
    ) AS pont
FROM Csapat cs
 	JOIN Merkozes m 
    ON cs.csapat_id = m.hazai_csapat_id OR cs.csapat_id = m.vendeg_csapat_id
GROUP BY cs.nev
ORDER BY pont DESC;


--Melyik csapatnak ki az edzője, melyik a stadionja, hol van a stadion

SELECT 
    cs.nev AS csapat,
    cs.edzo,
    s.nev AS stadion,
    s.helyszin
FROM Csapat cs
JOIN Merkozes m ON cs.csapat_id = m.hazai_csapat_id
JOIN Stadion s ON m.stadion_id = s.stadion_id
GROUP BY cs.csapat_id, cs.nev, cs.edzo, s.nev, s.helyszin;


--Újpest meccsei, és eredményeik

SELECT
    h.nev AS hazai,
    v.nev AS vendeg,
    CONCAT(m.hazai_gol, ' : ', m.vendeg_gol) AS eredmeny
FROM Merkozes m
JOIN Csapat h ON m.hazai_csapat_id = h.csapat_id
JOIN Csapat v ON m.vendeg_csapat_id = v.csapat_id
WHERE h.nev = 'Újpest' OR v.nev = 'Újpest'
Order By hazai desc


--Lapok játékosok szerint

SELECT 
    j.nev AS jatekos,
    SUM(CASE WHEN l.tipus = 'piros' THEN 1 ELSE 0 END) AS piros,
    SUM(CASE WHEN l.tipus = 'sarga' THEN 1 ELSE 0 END) AS sarga
FROM Lap l
JOIN Jatekos j ON l.jatekos_id = j.jatekos_id
GROUP BY j.nev
ORDER BY 
    piros DESC,
    sarga DESC;
	

--Életkor sorrend csapaton belul
	
SELECT 
  cs.nev AS csapat,
  j.nev AS jatekos,
  j.szul_dat,
  RANK() OVER (PARTITION BY j.csapat_id ORDER BY j.szul_dat) AS Legfiatalabb_csapaton_belul
FROM Jatekos j
JOIN Csapat cs ON j.csapat_id = cs.csapat_id
ORDER BY csapat, Legfiatalabb_csapaton_belul;


