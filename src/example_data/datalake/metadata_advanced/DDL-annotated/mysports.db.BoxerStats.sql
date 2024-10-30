CREATE TABLE BoxerStats ( -- This table contains statistics for boxers
    BoxerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Wins INTEGER, -- Number of wins. Range 0-100, depends on career length.
    Losses INTEGER, -- Number of losses. Range 0-50, usually less than wins.
    Draws INTEGER, -- Number of draws. Range 0-10, most values 0-2.
    KOs INTEGER -- Number of knockout wins. Range 0-80, usually less than total wins.
);
-- JOIN GRAPH: "BoxerStats": ["PlayerStats", "Boxers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BoxerStats">
-- - Description: This table contains statistics for boxers
-- - Data:
-- -- BoxerStatID: Primary key for the BoxerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- Wins: Number of wins. Range 0-100, depends on career length.
-- -- Losses: Number of losses. Range 0-50, usually less than wins.
-- -- Draws: Number of draws. Range 0-10, most values 0-2.
-- -- KOs: Number of knockout wins. Range 0-80, usually less than total wins.
-- - Relationships:
-- -- (BoxerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (BoxerStats.BoxerStatID → Boxers.BoxerStatID) - Table containing specific information for boxers
-- </METADATA>
-- 

-- File: mysports.BoxerStats.txt 
-- BoxerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Wins: INTEGER FROM 33 TO 50 like [50, 45, 42, 40, 39, 38, 37, 36, 35, 33]
-- Losses: INTEGER FROM 0 TO 7 like [5, 2, 7, 6, 4, 3, 1, 0]
-- Draws: INTEGER FROM 0 TO 2 like [1, 0, 2]
-- KOs: INTEGER FROM 20 TO 35 like [35, 33, 31, 30, 28, 27, 26, 25, 22, 20]
-- 
