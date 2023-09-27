-- Active: 1695540853913@@127.0.0.1@3306@Rockstar_satellites_GARROTXA
CREATE TABLE satellites_characteristics(
        id INT PRIMARY KEY,
        R200 DECIMAL (5, 2),
        M200 BIGINT,
        Mstars BIGINT,
        Rmin DECIMAL (8,2),
        Init DECIMAL (5,2),
        Fin DECIMAL (5,2)
) ;

LOAD DATA INFILE '/var/lib/mysql-files/general_data_halos.csv'
INTO TABLE satellites_characteristics
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, @dummy, R200, M200, Mstars, Rmin, Init, Fin)
SET id = NULLIF(@dummy, ''), M200 = CAST(M200 AS DECIMAL(20,0)), Mstars = CAST(Mstars AS DECIMAL(20,0));




CREATE TABLE satellites_crossmatch (
    id INT PRIMARY KEY,
    S620 INT,
    S689 INT,
    S720 INT,
    S740 INT,
    S805 INT,
    S850 INT,
    S900 INT,
    S910 INT,
    S993 INT
);

LOAD DATA INFILE '/var/lib/mysql-files/crossmatch_of_halos.csv'
INTO TABLE satellites_crossmatch
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, @dummy, @S620, @S689, @S720, @S740, @S805, @S850, @S900, @S910, @S993)
SET id = NULLIF(@dummy, ''),
    S620 = NULLIF(@S620,''),
    S689 = NULLIF(@S689,''),
    S720 = NULLIF(@S720,''),
    S740 = NULLIF(@S720,''),
    S805 = NULLIF(@S805,''),
    S850 = NULLIF(@S850,''),
    S900 = NULLIF(@S900,''),
    S910 = NULLIF(@S910,''),
    S993 = NULLIF(@S993,'');



-- --------------------
CREATE TABLE halos_S620 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );


LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_620.csv'
INTO TABLE halos_S620
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s620
FOREIGN KEY (S620)
REFERENCES halos_S620(id);



-- ----------

CREATE TABLE halos_S689 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );


LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_689.csv'
INTO TABLE halos_S689
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s689
FOREIGN KEY (S689)
REFERENCES halos_S689(id);


-- -------------

CREATE TABLE halos_S720 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );


LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_720.csv'
INTO TABLE halos_S720
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s720
FOREIGN KEY (S720)
REFERENCES halos_S720(id);

-- ---------


CREATE TABLE halos_S740 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_740.csv'
INTO TABLE halos_S740
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s740
FOREIGN KEY (S740)
REFERENCES halos_S740(id);



-- ------------

CREATE TABLE halos_S805 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_805.csv'
INTO TABLE halos_S805
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s805
FOREIGN KEY (S805)
REFERENCES halos_S805(id);

-- ---------

CREATE TABLE halos_S850 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_850.csv'
INTO TABLE halos_S850
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s850
FOREIGN KEY (S850)
REFERENCES halos_S850(id);

-- ------

CREATE TABLE halos_S900 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_900.csv'
INTO TABLE halos_S900
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s900
FOREIGN KEY (S900)
REFERENCES halos_S900(id);


-- ------

CREATE TABLE halos_S910 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_910.csv'
INTO TABLE halos_S910
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s910
FOREIGN KEY (S910)
REFERENCES halos_S910(id);


-- ------

CREATE TABLE halos_S993 (
    id INT PRIMARY KEY,
    id_pre INT,
    X DECIMAL (8,2),
    Y DECIMAL (8,2),
    Z DECIMAL (8,2),
    M200 BIGINT,
    Mstars BIGINT,
    Rvir DECIMAL (10,2)
        );

LOAD DATA INFILE '/var/lib/mysql-files/DF_halos_900.csv'
INTO TABLE halos_S993
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@index, id_pre, X,Y,Z,M200,Rvir,id,Mstars)
SET M200 = CAST(M200 AS DECIMAL(20,0)), 
 Mstars = CAST(Mstars AS DECIMAL(20,0))
 ;


ALTER TABLE satellites_crossmatch
ADD CONSTRAINT fk_s993
FOREIGN KEY (S993)
REFERENCES halos_S993(id);
