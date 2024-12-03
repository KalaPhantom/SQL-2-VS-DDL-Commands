

-- *DISPLAY DATA QUERIES USING SELECT CLAUSES

/*
* ## DESCRIPTION ##
* All command clauses here is intended to display the collections within all tables in the database 
* Remove some multiple line command notation to activate the command
* Don't  forget to save any changes after modification ;
*/

-- ?> ---------------------------------------------------------------------------------

-- Test connection if all the required data has been passed
-- This Command statement will display all data in the specific table
-- TODO NOTE: You can only use one SELECT CLAUSE AT A TIME USING THIS COMPILER
-- TODO NOTE: USE THE RUN BUTTON ON EACH COMMAND TO EXECUTE IT


SELECT * FROM player_profile;
SELECT * FROM IN_GAME_VARIABLES;




-- * ## Display both tables ## ----
-- Displaying table contents using LEFT JOIN
SELECT 
    player_profile.player_ID,
    player_profile.player_name,
    player_profile.Age,
    player_profile.Region,
    player_profile.Email
FROM player_profile
LEFT JOIN in_game_variables
ON player_profile.player_ID = in_game_variables.player_ID;



-- * Using DISTINCT Clause to only display unique records
-- ?> ---------------------------------------------------------------------------------

-- Display Current data from the first table
SELECT player_ID, player_name, Region
FROM player_profile;

SELECT DISTINCT  player_name, Region
FROM player_profile;

SELECT DISTINCT  player_Rank, primary_Weapon, player_status
FROM in_game_variables;







-- * WHERE
-- ? ---------------------------------------------------------------------------------
--  USING THE FIRST TABLE



-- Display data from the first table
SELECT player_name,Age, Region
FROM player_profile;


-- Will display player data where their region is set to the Philippines
 SELECT player_name,Age, Region
 FROM player_profile
 WHERE Region = 'Philippines';





-- *> AND || OR
-- ? ---------------------------------------------------------------------------------
-- USING THE SECOND TABLE

SELECT player_ID, player_Rank, LVL
FROM in_game_variables;

SELECT player_ID, player_Rank, LVL
FROM in_game_variables
WHERE LVL > 12 OR player_Rank LIKE 'GOLD%';

SELECT player_ID, player_Rank, LVL
FROM in_game_variables
WHERE LVL > 3 AND player_Rank LIKE 'BRONZE%';




-- *> IN CLAUSE
-- ? ---------------------------------------------------------------------------------
-- USING THE SECOND TABLE

SELECT player_ID, player_Rank, class, primary_Weapon
FROM in_game_variables;

SELECT player_ID, player_Rank, class, primary_Weapon
FROM in_game_variables
WHERE class IN ('Herbalist', 'Mage', 'MAGE');






-- *> BETWEEN CLAUSE
-- ? ---------------------------------------------------------------------------------

-- Display data from the first table
SELECT player_name,Age
FROM player_profile;

-- Select players with the age from 15 to 18
SELECT player_name,Age
FROM player_profile
WHERE AGE BETWEEN 8 AND 18;

-- USING STRINGS 
SELECT player_name,Age
FROM player_profile
WHERE player_name BETWEEN  'A%' AND 'G%';




-- *> -- WHERE CLAUSE WITH LIKE 
-- ? ---------------------------------------------------------------------------------

Select player_ID,player_Rank,class,primary_Weapon,LVL,player_status
from in_game_variables
where player_Rank like('DIAMOND%'); 
 




 -- *>  -- ORDER BY
-- ? ---------------------------------------------------------------------------------

Select player_ID,player_Rank,class,primary_Weapon,LVL
from in_game_variables
where player_Rank like('DIAMOND%')
Order by LVL ASC;






-- *>  -- GROUP BY
-- ? ---------------------------------------------------------------------------------

-- *Using max operation
Select max(LVL),class
from in_game_variables
group by class
ORDER BY max(LVL) ASC;




-- *CREATE AND REMOVE INDEX
-- ?>  CREATE INDEX ----------------------------------------------------------------------
CREATE INDEX index_by_class
ON IN_GAME_VARIABLES(class);


-- *Remove Index 
-- ! Removes the index in a table
ALTER TABLE in_game_variables
DROP INDEX index_by_class;




-- ? ---------------------------------------------------------------------------------
-- * Using DROP INDEX to delete an index in a table
SELECT * FROM PLAYER_PROFILE;
 CREATE INDEX idx_player_name ON PLAYER_PROFILE(player_name);
 DROP INDEX idx_player_name ON PLAYER_PROFILE;




-- *
-- ? ORDER BY WITH DESC AND ASC ORDER ---------------------------------------------------------------------------------
-- * Use ORDER BY DESC TO SORT COLUMNS FROM HIGHEST TO LOWEST, YOU CAN USE ASC (ascending order) TO SORT FROM LOWEST TO HIGHEST


SELECT * FROM PLAYER_PROFILE
ORDER BY Age DESC;

SELECT * FROM PLAYER_PROFILE
ORDER BY Age ASC;






-- ? TRUNCATE ---------------------------------------------------------------------------------
-- * TRUNCATE is used to delete all the rows/ records in the table on the table
SELECT * FROM in_game_variables;

TRUNCATE table in_game_variables;

-- -- ! This one will throw an error
-- The reason behind the error is that it has a primary key associated to the truncated table 
-- We can only truncate this table if the other table referencing this table is dropped
TRUNCATE TABLE PLAYER_PROFILE; 

DROp TABLE in_game_variables;

ROLLBACK;

-- TODO: Reset the dropped table







-- ?> COUNT ----------------------------------------------------------------------------
-- * 

-- * it count all active player in game
SELECT  player_profile.player_name, in_game_variables.player_status
FROM player_profile
JOIN in_game_variables ON player_profile.player_ID= in_game_variables.player_ID
WHERE player_status = 'active';


SELECT COUNT(*) AS Active_Players 
FROM IN_GAME_VARIABLES
WHERE player_status = 'active';





-- ? Having Clause ----------------------------------------------------------------------------
-- *> calculate active player per rank showing the ranks with atleast 1 active player----

SELECT player_Rank, COUNT(*) AS Active_Players
FROM IN_GAME_VARIABLES
WHERE player_status = 'active'
GROUP BY player_Rank
HAVING COUNT(*) >= 1;




-- *> it counts players by their player rank, with at least 2 players
SELECT player_Rank, COUNT(*) AS Player_Count
FROM IN_GAME_VARIABLES
WHERE LVL > 30
GROUP BY player_Rank
HAVING COUNT(*) >= 2;






-- ? Alter Add column to a table  ----------------------------------------------------------------------------
-- * Add a column to track guild membership.

SELECT * FROM in_game_variables;
ALTER TABLE IN_GAME_VARIABLES ADD guild_name VARCHAR(50);






-- ? Alter  Rename ----------------------------------------------------------------------------
-- * Rename the table from 'IN_GAME_VARIABLES' to 'HEROES'.
ALTER TABLE IN_GAME_VARIABLES RENAME TO HEROES;


-- ! >>>- - - - - - - - - -  Reset - - - - - - - - - - <<<
ALTER TABLE heroes RENAME TO IN_GAME_VARIABLES; --!

-- ! >>- - - - - - - - - - - - - - - - - - - - - - - -<<<





-- ? INSERT INTO ----------------------------------------------------------------------------
-- Insert a new record into the HEROES table.

INSERT INTO PLAYER_PROFILE (player_ID, player_name, AGE, Region, Email)
VALUES (10034, 'GHMN_Reniel', 19, 'Philippines', 'renegade40@gmail.com'  )

INSERT INTO heroes (player_ID, player_Rank, class, primary_Weapon, LVL, player_status, guild_name)
VALUES (10034, 'GOLD II', 'Warrior', 'Broad Sword', 10, 'active', 'Guild of Reniel');

-- Test data

SELECT * FROM player_profile
WHERE player_name LIKE'GHMN%';

SELECT * FROM heroes
WHERE guild_name LIKE '%Reniel';





-- ? UPDATE CLAUSE ----------------------------------------------------------------------------
--* Update Player Name from "MamaJoe" to "PapaB"
UPDATE PLAYER_PROFILE
SET player_name='PapaB'
WHERE player_ID='36473'


-- ? DELETE CLAUSE ----------------------------------------------------------------------------
-- *Delete The Player ID "45098" from the database
DELETE from heroes
WHERE player_ID=45098

DELETE from PLAYER_PROFILE
WHERE player_ID=45098

-- * To View the database
SELECT * from PLAYER_PROFILE

SELECT * from heroes;

-- ! Reset changes
ROLLBACK;








--* DESCRIPTION TEMPLATE
-- ?> ---------------------------------------------------------------------------------

-- PROMPT
-- ?> ---------------------------------------------------------------------------------

