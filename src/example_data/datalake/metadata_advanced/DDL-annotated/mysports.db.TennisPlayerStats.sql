CREATE TABLE TennisPlayerStats ( -- This table contains statistics for tennis players
    TennisPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    ATPRanking INTEGER, -- ATP ranking. Range 1-2000, lower numbers less frequent.
    GrandSlamTitles INTEGER, -- Number of Grand Slam titles won. Range 0-20, most values 0.
    CareerTitles INTEGER, -- Total career titles. Range 0-100, most values under 20.
    WinLossRatio FLOAT -- Win-loss ratio. Range 0.000-1.000, normally distributed around 0.500.
);
-- JOIN GRAPH: "TennisPlayerStats": ["PlayerStats", "TennisPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TennisPlayerStats">
-- - Description: This table contains statistics for tennis players
-- - Data:
-- -- TennisPlayerStatID: Primary key for the TennisPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- ATPRanking: ATP ranking. Range 1-2000, lower numbers less frequent.
-- -- GrandSlamTitles: Number of Grand Slam titles won. Range 0-20, most values 0.
-- -- CareerTitles: Total career titles. Range 0-100, most values under 20.
-- -- WinLossRatio: Win-loss ratio. Range 0.000-1.000, normally distributed around 0.500.
-- - Relationships:
-- -- (TennisPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (TennisPlayerStats.TennisPlayerStatID → TennisPlayers.TennisPlayerStatID) - Table containing specific information for tennis players
-- </METADATA>
-- 

-- File: mysports.TennisPlayerStats.txt 
-- TennisPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ATPRanking: INTEGER FROM 1 TO 25 like [25, 20, 15, 10, 8, 5, 4, 3, 2, 1]
-- GrandSlamTitles: INTEGER FROM 0 TO 20 like [0, 20, 17, 12, 7, 3, 1]
-- CareerTitles: INTEGER FROM 2 TO 103 like [103, 82, 70, 45, 25, 15, 10, 5, 3, 2]
-- WinLossRatio: NUMERIC FROM 0.58 TO 0.819 like [0.819, 0.802, 0.785, 0.76, 0.735, 0.68, 0.65, 0.62, 0.6, 0.58]
-- 
