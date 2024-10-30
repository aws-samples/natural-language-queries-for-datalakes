CREATE TABLE MMAFighters ( -- This table contains specific information for MMA fighters
    MMAFighterID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Stance TEXT, -- Fighting stance (e.g., "Orthodox", "Southpaw", "Switch"). 3-4 distinct values.
    ReachInches FLOAT -- Fighter's reach in inches. Range 60-90, normally distributed around 70.
);
-- JOIN GRAPH: "MMAFighters": ["Players", "MMAFightResults", "MMAFighterStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="MMAFighters">
-- - Description: This table contains specific information for MMA fighters
-- - Data:
-- -- MMAFighterID: Primary key for the MMAFighters table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Stance: Fighting stance (e.g., "Orthodox", "Southpaw", "Switch"). 3-4 distinct values.
-- -- ReachInches: Fighter's reach in inches. Range 60-90, normally distributed around 70.
-- - Relationships:
-- -- (MMAFighters.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (MMAFighters.MMAFighterID → MMAFightResults.WinnerID) - Table containing results of MMA fights
-- -- (MMAFighters.MMAFighterID → MMAFightResults.LoserID) - Table containing results of MMA fights
-- -- (MMAFighters.MMAFighterID → MMAFighterStats.MMAFighterID) - Table containing statistics for MMA fighters
-- </METADATA>
-- 

-- File: mysports.MMAFighters.txt 
-- MMAFighterID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Stance: TEXT FROM Orthodox TO Switch like ['Orthodox', 'Southpaw', 'Switch']
-- ReachInches: NUMERIC FROM 68.0 TO 77.0 like [77.0, 76.0, 75.0, 74.0, 73.0, 72.0, 71.0, 70.0, 69.0, 68.0]
-- 
