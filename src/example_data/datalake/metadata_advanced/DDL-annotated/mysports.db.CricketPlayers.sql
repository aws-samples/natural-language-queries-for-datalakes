CREATE TABLE CricketPlayers ( -- This table contains specific information for cricket players
    CricketPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    BattingStyle TEXT, -- Batting style (e.g., "Right-handed", "Left-handed"). 2 distinct values, about 70% "Right-handed".
    BowlingStyle TEXT -- Bowling style (e.g., "Right-arm fast", "Left-arm spin"). 8-10 distinct values.
);
-- JOIN GRAPH: "CricketPlayers": ["Players", "CricketTeams", "CricketPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CricketPlayers">
-- - Description: This table contains specific information for cricket players
-- - Data:
-- -- CricketPlayerID: Primary key for the CricketPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- BattingStyle: Batting style (e.g., "Right-handed", "Left-handed"). 2 distinct values, about 70% "Right-handed".
-- -- BowlingStyle: Bowling style (e.g., "Right-arm fast", "Left-arm spin"). 8-10 distinct values.
-- - Relationships:
-- -- (CricketPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (CricketPlayers.CricketPlayerID → CricketTeams.CricketPlayerID) - Table containing specific information for cricket teams
-- -- (CricketPlayers.CricketPlayerID → CricketPlayerStats.CricketPlayerID) - Table containing statistics for cricket players
-- </METADATA>
-- 

-- File: mysports.CricketPlayers.txt 
-- CricketPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- BattingStyle: TEXT FROM Left-handed TO Right-handed like ['Right-handed', 'Left-handed']
-- BowlingStyle: TEXT FROM Left-arm chinaman TO Right-arm off-break like ['Right-arm off-break', 'Right-arm medium', 'Right-arm leg-break', 'Right-arm fast-medium', 'Right-arm fast', 'Left-arm spin', 'Left-arm orthodox', 'Left-arm fast', 'Left-arm chinaman']
-- 
