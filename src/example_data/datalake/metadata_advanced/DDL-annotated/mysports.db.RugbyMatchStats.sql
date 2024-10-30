CREATE TABLE RugbyMatchStats ( -- This table contains statistics for rugby matches
    RugbyMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamTries INTEGER, -- Number of tries scored by home team. Range 0-10, most values 1-5.
    AwayTeamTries INTEGER, -- Number of tries scored by away team. Range 0-10, most values 1-5.
    HomeTeamPenalties INTEGER, -- Number of penalties scored by home team. Range 0-10, most values 1-5.
    AwayTeamPenalties INTEGER -- Number of penalties scored by away team. Range 0-10, most values 1-5.
);
-- JOIN GRAPH: "RugbyMatchStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="RugbyMatchStats">
-- - Description: This table contains statistics for rugby matches
-- - Data:
-- -- RugbyMatchStatID: Primary key for the RugbyMatchStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamTries: Number of tries scored by home team. Range 0-10, most values 1-5.
-- -- AwayTeamTries: Number of tries scored by away team. Range 0-10, most values 1-5.
-- -- HomeTeamPenalties: Number of penalties scored by home team. Range 0-10, most values 1-5.
-- -- AwayTeamPenalties: Number of penalties scored by away team. Range 0-10, most values 1-5.
-- - Relationships:
-- -- (RugbyMatchStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.RugbyMatchStats.txt 
-- RugbyMatchStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamTries: INTEGER FROM 1 TO 5 like [4, 3, 2, 5, 1]
-- AwayTeamTries: INTEGER FROM 1 TO 5 like [3, 2, 1, 5, 4]
-- HomeTeamPenalties: INTEGER FROM 2 TO 5 like [3, 2, 5, 4]
-- AwayTeamPenalties: INTEGER FROM 1 TO 4 like [3, 2, 1, 4]
-- 
