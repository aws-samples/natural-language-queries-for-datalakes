CREATE TABLE MMAFights ( -- This table contains information about MMA fights
    MMAFightID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    WeightClass TEXT, -- Weight class of the fight (e.g., "Heavyweight", "Lightweight"). 8-10 distinct values.
    Rounds INTEGER, -- Scheduled number of rounds. Common values: 3, 5.
    Title TEXT -- Title at stake, if any (e.g., "UFC Heavyweight Championship"). Many distinct values, often NULL.
);
-- JOIN GRAPH: "MMAFights": ["Games", "MMAFightResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="MMAFights">
-- - Description: This table contains information about MMA fights
-- - Data:
-- -- MMAFightID: Primary key for the MMAFights table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- WeightClass: Weight class of the fight (e.g., "Heavyweight", "Lightweight"). 8-10 distinct values.
-- -- Rounds: Scheduled number of rounds. Common values: 3, 5.
-- -- Title: Title at stake, if any (e.g., "UFC Heavyweight Championship"). Many distinct values, often NULL.
-- - Relationships:
-- -- (MMAFights.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (MMAFights.MMAFightID → MMAFightResults.MMAFightID) - Table containing results of MMA fights
-- </METADATA>
-- 

-- File: mysports.MMAFights.txt 
-- MMAFightID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WeightClass: TEXT FROM Bantamweight TO Welterweight like ['Heavyweight', 'Welterweight', 'Strawweight', 'Middleweight', 'Lightweight', 'Light Heavyweight', 'Flyweight', 'Featherweight', 'Bantamweight']
-- Rounds: INTEGER FROM 3 TO 5 like [5, 3]
-- Title: TEXT FROM UFC Bantamweight Championship TO UFC Middleweight Championship like [None, 'UFC Middleweight Championship', 'UFC Lightweight Championship', 'UFC Light Heavyweight Championship', 'UFC Heavyweight Championship', 'UFC Bantamweight Championship']
-- 
