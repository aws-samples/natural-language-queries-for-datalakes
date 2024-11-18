CREATE TABLE BaseballPlayerStats ( -- This table contains statistics for baseball players
    BaseballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    BattingAverage FLOAT, -- Batting average. Range 0.000-0.400, most values 0.200-0.300.
    HomeRuns INTEGER, -- Number of home runs. Range 0-73, most values under 30.
    RBI INTEGER, -- Runs batted in. Range 0-200, most values under 100.
    ERA FLOAT, -- Earned run average (for pitchers). Range 0.00-10.00, most values 2.00-5.00.
    Strikeouts INTEGER -- Number of strikeouts (for pitchers). Range 0-383, depends on games played.
);
-- JOIN GRAPH: "BaseballPlayerStats": ["PlayerStats", "BaseballPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BaseballPlayerStats">
-- - Description: This table contains statistics for baseball players
-- - Data:
-- -- BaseballPlayerStatID: Primary key for the BaseballPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- BattingAverage: Batting average. Range 0.000-0.400, most values 0.200-0.300.
-- -- HomeRuns: Number of home runs. Range 0-73, most values under 30.
-- -- RBI: Runs batted in. Range 0-200, most values under 100.
-- -- ERA: Earned run average (for pitchers). Range 0.00-10.00, most values 2.00-5.00.
-- -- Strikeouts: Number of strikeouts (for pitchers). Range 0-383, depends on games played.
-- - Relationships:
-- -- (BaseballPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (BaseballPlayerStats.BaseballPlayerStatID → BaseballPlayers.BaseballPlayerStatID) - Table containing specific information for baseball players
-- </METADATA>
-- 

-- File: mysports.BaseballPlayerStats.txt 
-- BaseballPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- BattingAverage: NUMERIC FROM 0.0 TO 0.31 like [0.31, 0.305, 0.29, 0.285, 0.28, 0.275, 0.27, 0.26, 0.185, 0.0]
-- HomeRuns: INTEGER FROM 0 TO 45 like [0, 45, 40, 35, 30, 25, 20, 15, 10]
-- RBI: INTEGER FROM 0 TO 110 like [110, 100, 95, 85, 80, 75, 60, 55, 5, 0]
-- ERA: NUMERIC FROM 2.75 TO 3.5 like [None, 3.5, 2.75]
-- Strikeouts: INTEGER FROM 180 TO 220 like [None, 220, 180]
-- 
