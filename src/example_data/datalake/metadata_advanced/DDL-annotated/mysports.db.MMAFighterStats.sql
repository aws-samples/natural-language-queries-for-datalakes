CREATE TABLE MMAFighterStats ( -- This table contains statistics for MMA fighters
    MMAFighterStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Wins INTEGER, -- Number of wins. Range 0-50, depends on career length.
    Losses INTEGER, -- Number of losses. Range 0-30, usually less than wins.
    Draws INTEGER, -- Number of draws. Range 0-5, most values 0-1.
    KOTKOs INTEGER -- Number of knockout/technical knockout wins. Range 0-30, usually less than total wins.
);
-- JOIN GRAPH: "MMAFighterStats": ["PlayerStats", "MMAFighters"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="MMAFighterStats">
-- - Description: This table contains statistics for MMA fighters
-- - Data:
-- -- MMAFighterStatID: Primary key for the MMAFighterStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- Wins: Number of wins. Range 0-50, depends on career length.
-- -- Losses: Number of losses. Range 0-30, usually less than wins.
-- -- Draws: Number of draws. Range 0-5, most values 0-1.
-- -- KOTKOs: Number of knockout/technical knockout wins. Range 0-30, usually less than total wins.
-- - Relationships:
-- -- (MMAFighterStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (MMAFighterStats.MMAFighterStatID → MMAFighters.MMAFighterStatID) - Table containing specific information for MMA fighters
-- </METADATA>
-- 

-- File: mysports.MMAFighterStats.txt 
-- MMAFighterStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Wins: INTEGER FROM 16 TO 25 like [25, 24, 23, 22, 21, 20, 19, 18, 17, 16]
-- Losses: INTEGER FROM 1 TO 8 like [3, 2, 8, 7, 6, 5, 4, 1]
-- Draws: INTEGER FROM 0 TO 2 like [0, 1, 2]
-- KOTKOs: INTEGER FROM 7 TO 16 like [16, 15, 14, 13, 12, 11, 10, 9, 8, 7]
-- 
