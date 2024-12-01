

-- *DISPLAY DATA QUERIES

/*
* ## DESCRIPTION 
* All command clauses here is intended to display the collections within all tables in the database 
* Remove some multiple line command notation to activate the command
* Don't  forget to save any changes after modification ;
*/

-- ? ---------------------------------------------------------------------------------

-- Test connection if all the required data has been passed
-- This Command statement will display all data in the specific table
-- TODO NOTE: You can only use one SELECT CLAUSE AT A TIME
SELECT * FROM player_profile;
SELECT * FROM IN_GAME_VARIABLES;

-- ? ---------------------------------------------------------------------------------



-- * Using Distinct Clause to only display unique records
-- ?> ---------------------------------------------------------------------------------

SELECT DISTINCT player_ID, player_name, Region
FROM player_profile;

SELECT DISTINCT player_ID, player_Rank, primary_Weapon, player_status
FROM in_game_variables;

-- ?> ---------------------------------------------------------------------------------
























--* DESCRIPTION TEMPLATE
-- ?> ---------------------------------------------------------------------------------

-- PROMPT
-- ?> ---------------------------------------------------------------------------------

