CREATE TABLE RugbyPlayerStats ( -- This table contains statistics for rugby players
    RugbyPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Tries INTEGER, -- Number of tries scored. Range 0-50, most values under 20.
    Conversions INTEGER, -- Number of conversions. Range 0-100, depends on player role.
    PenaltyGoals INTEGER, -- Number of penalty goals. Range 0-100, depends on player role.
    TacklesMade INTEGER -- Number of tackles made. Range 0-300, depends on position and games played.
);
-- JOIN GRAPH: "RugbyPlayerStats": ["PlayerStats", "RugbyPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="RugbyPlayerStats">
-- - Description: This table contains statistics for rugby players
-- - Data:
-- -- RugbyPlayerStatID: Primary key for the RugbyPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- Tries: Number of tries scored. Range 0-50, most values under 20.
-- -- Conversions: Number of conversions. Range 0-100, depends on player role.
-- -- PenaltyGoals: Number of penalty goals. Range 0-100, depends on player role.
-- -- TacklesMade: Number of tackles made. Range 0-300, depends on position and games played.
-- - Relationships:
-- -- (RugbyPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (RugbyPlayerStats.RugbyPlayerStatID → RugbyPlayers.RugbyPlayerStatID) - Table containing specific information for rugby players
-- </METADATA>
-- 

-- File: mysports.RugbyPlayerStats.txt 
-- RugbyPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Tries: INTEGER FROM 5 TO 40 like [40, 30, 25, 22, 20, 15, 12, 10, 8, 5]
-- Conversions: INTEGER FROM 0 TO 250 like [0, 250, 180]
-- PenaltyGoals: INTEGER FROM 0 TO 180 like [0, 180, 150]
-- TacklesMade: INTEGER FROM 280 TO 620 like [620, 580, 550, 520, 480, 450, 380, 350, 320, 280]
-- 
