CREATE TABLE TennisPlayers ( -- This table contains specific information for tennis players
    TennisPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Handedness TEXT, -- Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
    PlayingStyle TEXT -- Playing style (e.g., "Serve-and-Volley", "Baseline"). 5-10 distinct values.
);
-- JOIN GRAPH: "TennisPlayers": ["Players", "TennisPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TennisPlayers">
-- - Description: This table contains specific information for tennis players
-- - Data:
-- -- TennisPlayerID: Primary key for the TennisPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Handedness: Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
-- -- PlayingStyle: Playing style (e.g., "Serve-and-Volley", "Baseline"). 5-10 distinct values.
-- - Relationships:
-- -- (TennisPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (TennisPlayers.TennisPlayerID → TennisPlayerStats.TennisPlayerID) - Table containing statistics for tennis players
-- </METADATA>
-- 

-- File: mysports.TennisPlayers.txt 
-- TennisPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Handedness: TEXT FROM Left TO Right like ['Right', 'Left']
-- PlayingStyle: TEXT FROM Aggressive baseliner TO Serve-and-volley like ['Serve-and-volley', 'Counterpuncher', 'Baseline', 'All-court', 'Aggressive baseliner']
-- 
