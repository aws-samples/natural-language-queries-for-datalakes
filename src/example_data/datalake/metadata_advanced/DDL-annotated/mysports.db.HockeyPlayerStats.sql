CREATE TABLE HockeyPlayerStats ( -- This table contains statistics for hockey players
    HockeyPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Goals INTEGER, -- Number of goals scored. Range 0-100, most values under 50.
    Assists INTEGER, -- Number of assists. Range 0-150, depends on position and games played.
    PenaltyMinutes INTEGER, -- Penalty minutes. Range 0-300, log-normally distributed.
    PlusMinus INTEGER -- Plus/minus statistic. Range -50 to 50, normally distributed around 0.
);
-- JOIN GRAPH: "HockeyPlayerStats": ["PlayerStats", "HockeyPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="HockeyPlayerStats">
-- - Description: This table contains statistics for hockey players
-- - Data:
-- -- HockeyPlayerStatID: Primary key for the HockeyPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- Goals: Number of goals scored. Range 0-100, most values under 50.
-- -- Assists: Number of assists. Range 0-150, depends on position and games played.
-- -- PenaltyMinutes: Penalty minutes. Range 0-300, log-normally distributed.
-- -- PlusMinus: Plus/minus statistic. Range -50 to 50, normally distributed around 0.
-- - Relationships:
-- -- (HockeyPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (HockeyPlayerStats.HockeyPlayerStatID → HockeyPlayers.HockeyPlayerStatID) - Table containing specific information for hockey players
-- </METADATA>
-- 

-- File: mysports.HockeyPlayerStats.txt 
-- HockeyPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Goals: INTEGER FROM 0 TO 35 like [0, 35, 30, 28, 26, 25, 22, 10, 8]
-- Assists: INTEGER FROM 3 TO 55 like [55, 50, 45, 42, 40, 38, 35, 30, 5, 3]
-- PenaltyMinutes: INTEGER FROM 0 TO 70 like [70, 60, 40, 35, 32, 30, 28, 25, 2, 0]
-- PlusMinus: INTEGER FROM 0 TO 25 like [0, 25, 22, 20, 19, 18, 16, 15, 10]
-- 
