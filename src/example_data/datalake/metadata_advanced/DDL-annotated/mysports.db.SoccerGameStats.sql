CREATE TABLE SoccerGameStats ( -- This table contains statistics for soccer games
    SoccerGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamPossession FLOAT, -- Ball possession percentage for home team. Range 0-100, normally distributed around 50.
    AwayTeamPossession FLOAT, -- Ball possession percentage for away team. Range 0-100, normally distributed around 50.
    HomeTeamShots INTEGER, -- Shots on goal for home team. Range 0-30, most values 5-20.
    AwayTeamShots INTEGER -- Shots on goal for away team. Range 0-30, most values 5-20.
);
-- JOIN GRAPH: "SoccerGameStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SoccerGameStats">
-- - Description: This table contains statistics for soccer games
-- - Data:
-- -- SoccerGameStatID: Primary key for the SoccerGameStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamPossession: Ball possession percentage for home team. Range 0-100, normally distributed around 50.
-- -- AwayTeamPossession: Ball possession percentage for away team. Range 0-100, normally distributed around 50.
-- -- HomeTeamShots: Shots on goal for home team. Range 0-30, most values 5-20.
-- -- AwayTeamShots: Shots on goal for away team. Range 0-30, most values 5-20.
-- - Relationships:
-- -- (SoccerGameStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.SoccerGameStats.txt 
-- SoccerGameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamPossession: NUMERIC FROM 47.3 TO 55.2 like [55.2, 54.6, 53.8, 52.8, 52.1, 51.9, 50.5, 49.2, 48.7, 47.3]
-- AwayTeamPossession: NUMERIC FROM 44.8 TO 52.7 like [52.7, 51.3, 50.8, 49.5, 48.1, 47.9, 47.2, 46.2, 45.4, 44.8]
-- HomeTeamShots: INTEGER FROM 10 TO 18 like [15, 18, 17, 16, 14, 13, 12, 11, 10]
-- AwayTeamShots: INTEGER FROM 7 TO 15 like [11, 15, 14, 13, 12, 10, 9, 8, 7]
-- 
