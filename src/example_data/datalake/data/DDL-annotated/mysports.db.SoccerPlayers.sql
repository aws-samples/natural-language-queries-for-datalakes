CREATE TABLE SoccerPlayers ( -- This table contains specific information for soccer players
    SoccerPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Forward", "Midfielder"). 4-6 distinct values.
    PreferredFoot TEXT -- Preferred foot ("Left", "Right", "Both"). 3 distinct values, about 70% "Right".
);
-- JOIN GRAPH: "SoccerPlayers": ["Players", "SoccerTeams", "SoccerPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SoccerPlayers">
-- - Description: This table contains specific information for soccer players
-- - Data:
-- -- SoccerPlayerID: Primary key for the SoccerPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Forward", "Midfielder"). 4-6 distinct values.
-- -- PreferredFoot: Preferred foot ("Left", "Right", "Both"). 3 distinct values, about 70% "Right".
-- - Relationships:
-- -- (SoccerPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (SoccerPlayers.SoccerPlayerID → SoccerTeams.SoccerPlayerID) - Table containing specific information for soccer teams
-- -- (SoccerPlayers.SoccerPlayerID → SoccerPlayerStats.SoccerPlayerID) - Table containing statistics for soccer players
-- </METADATA>
-- 

-- File: mysports.SoccerPlayers.txt 
-- SoccerPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Defender TO Midfielder like ['Midfielder', 'Forward', 'Defender', 'Goalkeeper']
-- PreferredFoot: TEXT FROM Left TO Right like ['Right', 'Left']
-- 
