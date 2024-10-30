CREATE TABLE HockeyGameStats ( -- This table contains statistics for hockey games
    HockeyGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamShots INTEGER, -- Shots on goal for home team. Range 15-60, normally distributed around 30.
    AwayTeamShots INTEGER, -- Shots on goal for away team. Range 15-60, normally distributed around 30.
    HomeTeamPenaltyMinutes INTEGER, -- Penalty minutes for home team. Range 0-40, most values under 20.
    AwayTeamPenaltyMinutes INTEGER -- Penalty minutes for away team. Range 0-40, most values under 20.
);
-- JOIN GRAPH: "HockeyGameStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="HockeyGameStats">
-- - Description: This table contains statistics for hockey games
-- - Data:
-- -- HockeyGameStatID: Primary key for the HockeyGameStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamShots: Shots on goal for home team. Range 15-60, normally distributed around 30.
-- -- AwayTeamShots: Shots on goal for away team. Range 15-60, normally distributed around 30.
-- -- HomeTeamPenaltyMinutes: Penalty minutes for home team. Range 0-40, most values under 20.
-- -- AwayTeamPenaltyMinutes: Penalty minutes for away team. Range 0-40, most values under 20.
-- - Relationships:
-- -- (HockeyGameStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.HockeyGameStats.txt 
-- HockeyGameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamShots: INTEGER FROM 27 TO 35 like [30, 35, 34, 33, 32, 31, 29, 28, 27]
-- AwayTeamShots: INTEGER FROM 26 TO 35 like [29, 35, 33, 32, 31, 30, 28, 27, 26]
-- HomeTeamPenaltyMinutes: INTEGER FROM 6 TO 14 like [10, 8, 12, 14, 6]
-- AwayTeamPenaltyMinutes: INTEGER FROM 6 TO 16 like [12, 10, 8, 6, 16, 14]
-- 
