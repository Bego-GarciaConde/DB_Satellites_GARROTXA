-- Active: 1695540853913@@127.0.0.1@3306@Rockstar_satellites_GARROTXA
SELECT satellites_characteristics.id, satellites_crossmatch.S620, satellites_crossmatch.S689, satellites_crossmatch.S720, satellites_crossmatch.S910
FROM satellites_characteristics
JOIN satellites_crossmatch
ON satellites_characteristics.id = satellites_crossmatch.id
WHERE M200 > 1E8 AND Rmin < 50;

SHOW TABLE STATUS LIKE 'satellites_crossmatch';

SHOW TABLE STATUS LIKE 'satellites_characteristics';

-- See crossmatch at certain snapshot
SELECT *
FROM satellites_crossmatch
WHERE S689 IS NOT NULL;

-- Where there is mass
SELECT * 
FROM halos_S720
WHERE M200 IS NOT NULL

-- See crossmatch of the more massive satellites
SELECT *
FROM satellites_characteristics
WHERE M200 > 5E8 AND Rmin < 50;


-- Find specific crossmatches and compare how the masses have changed
SELECT sc.id, cx.S720, hs.id AS id_720, sc.M200, hs.M200 AS M200_720, sc.Rmin
FROM satellites_characteristics AS sc
JOIN satellites_crossmatch AS cx ON sc.id = cx.id
JOIN halos_S720 AS hs ON cx.S720 = hs.id
WHERE sc.M200 > 1E8 AND sc.Rmin < 50;

-- Find crossmatch for specific halo
SELECT *
FROM halos_S720
WHERE id = 2443;

 
-- Find crossmatch for specific halo and the differences between masses
SELECT sc.id, cx.S720, hs.id AS id_720, sc.M200, hs.M200 AS M200_720, hs.X, hs.Y, hs.Z
FROM satellites_characteristics AS sc
JOIN satellites_crossmatch AS cx ON sc.id = cx.id
JOIN halos_S720 AS hs ON cx.S720 = hs.id
WHERE sc.id = 1119;

-- 
SELECT sc.id, cx.S720, hs.id AS id_720, sc.M200, hs.M200 AS M200_720, hs.X, hs.Y, hs.Z
FROM satellites_characteristics AS sc
JOIN satellites_crossmatch AS cx ON sc.id = cx.id
JOIN halos_S720 AS hs ON cx.S720 = hs.id
WHERE sc.M200 > 1E8 AND sc.Rmin < 50;