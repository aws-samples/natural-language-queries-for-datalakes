CREATE TABLE CricketPlayerStats ( -- This table contains statistics for cricket players
    CricketPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    BattingAverage FLOAT, -- Batting average. Range 0-100, most values 20-50.
    BowlingAverage FLOAT, -- Bowling average. Range 10-100, most values 20-40.
    Centuries INTEGER, -- Number of centuries scored. Range 0-100, most values under 20.
    Wickets INTEGER -- Number of wickets taken. Range 0-1000, depends on player role.
);
-- JOIN GRAPH: "CricketPlayerStats": ["PlayerStats", "CricketPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CricketPlayerStats">
-- - Description: This table contains statistics for cricket players
-- - Data:
-- -- CricketPlayerStatID: Primary key for the CricketPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- BattingAverage: Batting average. Range 0-100, most values 20-50.
-- -- BowlingAverage: Bowling average. Range 10-100, most values 20-40.
-- -- Centuries: Number of centuries scored. Range 0-100, most values under 20.
-- -- Wickets: Number of wickets taken. Range 0-1000, depends on player role.
-- - Relationships:
-- -- (CricketPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (CricketPlayerStats.CricketPlayerStatID → CricketPlayers.CricketPlayerStatID) - Table containing specific information for cricket players
-- </METADATA>
-- 

-- File: mysports.CricketPlayerStats.txt 
-- CricketPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- BattingAverage: NUMERIC FROM 33.2 TO 54.3 like [54.3, 51.2, 49.9, 47.5, 45.7, 42.1, 39.4, 38.5, 36.8, 33.2]
-- BowlingAverage: NUMERIC FROM 25.4 TO 35.2 like [35.2, 34.6, 33.9, 32.1, 31.7, 30.5, 29.3, 28.7, 27.8, 25.4]
-- Centuries: INTEGER FROM 5 TO 28 like [28, 25, 22, 20, 18, 15, 12, 10, 8, 5]
-- Wickets: INTEGER FROM 100 TO 250 like [250, 200, 180, 160, 150, 140, 130, 120, 110, 100]
-- 
