CREATE TABLE BaseballGameStats ( -- This table contains statistics for baseball games
    BaseballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamHits INTEGER, -- Hits for home team. Range 0-25, most values 4-12.
    AwayTeamHits INTEGER, -- Hits for away team. Range 0-25, most values 4-12.
    HomeTeamErrors INTEGER, -- Errors for home team. Range 0-5, most values 0-2.
    AwayTeamErrors INTEGER -- Errors for away team. Range 0-5, most values 0-2.
);
-- JOIN GRAPH: "BaseballGameStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BaseballGameStats">
-- - Description: This table contains statistics for baseball games
-- - Data:
-- -- BaseballGameStatID: Primary key for the BaseballGameStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamHits: Hits for home team. Range 0-25, most values 4-12.
-- -- AwayTeamHits: Hits for away team. Range 0-25, most values 4-12.
-- -- HomeTeamErrors: Errors for home team. Range 0-5, most values 0-2.
-- -- AwayTeamErrors: Errors for away team. Range 0-5, most values 0-2.
-- - Relationships:
-- -- (BaseballGameStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.BaseballGameStats.txt 
-- BaseballGameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamHits: INTEGER FROM 6 TO 13 like [10, 8, 13, 12, 11, 9, 7, 6]
-- AwayTeamHits: INTEGER FROM 4 TO 11 like [9, 7, 11, 10, 8, 6, 5, 4]
-- HomeTeamErrors: INTEGER FROM 0 TO 2 like [1, 2, 0]
-- AwayTeamErrors: INTEGER FROM 0 TO 3 like [1, 2, 0, 3]
-- 
