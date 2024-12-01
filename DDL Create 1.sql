
--  DDL COMMANDS

-- CREATING A NEW DATABASE 
CREATE DATABASE PLAYER;

-- MAKE THE PLAYER-DATABASE AS THE ACTIVE SCHEMA
USE PLAYER;

-- < CREATE TABLE > --------------------------------------------------------------- <<<

-- Creating Player profile table
CREATE TABLE PLAYER_PROFILE (
    player_ID int PRIMARY KEY NOT NULL CONSTRAINT  SevenDigitMax_Constraint CHECK (player_ID BETWEEN 0 AND 9999999),
    player_name VARCHAR(30) DEFAULT 'GUEST PLAYER',
    Age INT,
    Region VARCHAR(255),
    Email VARCHAR(50)
);


-- Creating In Game variable table
CREATE TABLE IN_GAME_VARIABLES (

    player_ID int,
    player_Rank  VARCHAR(255) DEFAULT 'BRONZE',
    class VARCHAR(255),
    primary_Weapon VARCHAR(255),
    LVL INT CONSTRAINT DoNot_Exceed_Constraint CHECK (LVL BETWEEN 0 and 99),
    player_status VARCHAR(255),
    FOREIGN KEY (player_ID) REFERENCES PLAYER_PROFILE(player_ID)
);

-- < Inserting new records in the TABLES > ---------------------------------------------------------------------------------

-- Inserting records into SUBJECTS table
INSERT INTO PLAYER_PROFILE (player_ID, player_name, AGE, Region, Email)
VALUES 
(20012, 'alpha_orion', 14 ,  'Philippines', 'hakdogs23@gmail.com'),
(13452, 'silent_machine', 15 ,  'Pakistan', 'hakernot4000@gmail.com'),
(45679, 'RENIEL', 18 ,  'Philippines', 'elyen45677@gmail.com'),
(22445, 'The_Force', 34 ,  'Philippines', 'lapatata7000@gmail.com'),
(99090, 'Filipino_Pride_Chickennn2', 24 ,  'Philippines', 'deepfreezed70orion@gmail.com'),
(45098, 'Kim', 45 ,  'North Korea (DPRK)', 'sauhogin45632@ilovemissiles.com'),
(45678, 'Noster_Atlas', 32 ,  'Sweden', 'atlas4@gmail.com'),
(99878, 'Mory_Bassil', 18 ,  'Sweden', 'baselisk45@gmail.com'),
(46779, 'lilypad', 24 ,  'Japan ', 'kalalilyan456@gmail.com'),
(36472, 'JoeMAMA', 23 ,  'Canada', 'juggernaut453@gmail.com'),
(30300, 'Kala_Phantom', 19, 'Philippines' , 'coffeeaddict40@nosleep.com'),
(20321, 'Silician', 18 ,  'Sweden', 'silica43@gmail.com'),
(46771, 'Colourway', 24 ,  'Japan ', 'Kalahand6@gmail.com'),
(36473, 'MamaJoe', 23 ,  'Canada', 'nautjagger453@gmail.com'),
(30302, 'Nashida_Ado', 19, 'Japan' , 'nahidasenecca@nosleep.com');

-- Inserting records in the In game variable table with respect to the primary key
INSERT INTO IN_GAME_VARIABLES (player_ID, player_Rank, class, primary_Weapon, LVl, player_status)
VALUES 
(20012, 'BRONZE i' , 'Ranged' , 'sling shot' , 12, 'active'),
(13452, 'DIAMOND II' , 'Melee', 'Random Tree Stick' ,99, 'inactive'),
(45679, 'GOLD I' , 'MAGE', 'Magic Pendant of Youth', 55, 'active'),
(22445, 'SILVER IV', 'Hunter', 'Buckshot Hand Cannon' , 34, 'active'),
(99090, 'PLATINUM III' , 'Ranger', 'Magic C4 luncher', 78, 'active'),
(45098, 'SILVER III', 'Ranger' , 'Intercontinental Ballistic Missile (ICBM-K.I.M_UN)', 2, 'identified_cheater'),
(45678, 'GOLD IV' , 'Melee' , 'Last Blade of Aragon', 34, 'active' ),
(99878, 'DIAMOND III', 'Herbalist', 'Totem of Lola Remedios', 40, 'active'),
(46779, 'GOLD IV', 'Herbalist', 'Magic Essence of Efficanssent Oil' , 44 , 'inactive'),
(36472, 'DIAMOND I', 'Herbalist', 'Dahon ng Saging', 50 , 'active'),
(30300, 'PLATINUM III', 'Ranger', 'Spirit Huntsman Rifle', 80, 'active' ),
(20321, 'SILVER II', 'Hunter', 'Crab trap blade', 23, 'active'),
(46771, 'PLATINUM III', 'Mage', 'Totem of Undying' , 34, 'active'  ),
(36473, 'PLATINUM II', 'Ranger', 'Flintlock Rifle', 70, 'inactive'),
(30302, 'DIAMOND III', 'Melee' , ' Damned Soul Blade', 99, 'active');








