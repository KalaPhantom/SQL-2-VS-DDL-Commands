

-- *DISPLAY DATA QUERIES USING SELECT CLAUSES

/*
* ## DESCRIPTION 
* All command clauses here is intended to display the collections within all tables in the database 
* Remove some multiple line command notation to activate the command
* Don't  forget to save any changes after modification ;
*/

-- ? ---------------------------------------------------------------------------------

-- Test connection if all the required data has been passed
-- This Command statement will display all data in the specific table
-- TODO NOTE: You can only use one SELECT CLAUSE AT A TIME USING THIS COMPILER
SELECT * FROM player_profile;
SELECT * FROM IN_GAME_VARIABLES;





-- * Using Distinct Clause to only display unique records
-- ?> ---------------------------------------------------------------------------------

SELECT DISTINCT player_ID, player_name, Region
FROM player_profile;

SELECT DISTINCT player_ID, player_Rank, primary_Weapon, player_status
FROM in_game_variables;


-- ?>  CREATE INDEX ----------------------------------------------------------------------
-- * it sort or filter by class  
CREATE INDEX index_by_class
ON IN_GAME_VARIABLES(class);




-- ?> count ----------------------------------------------------------------------------
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


-- ?> it counts
SELECT player_Rank, COUNT(*) AS Player_Count
FROM IN_GAME_VARIABLES
WHERE LVL > 30
GROUP BY player_Rank
HAVING COUNT(*) >= 2;




-- ?> CREATE INDEX ----------------------------------------------------------------------





















--* DESCRIPTION TEMPLATE
-- ?> ---------------------------------------------------------------------------------

-- PROMPT
-- ?> ---------------------------------------------------------------------------------

