CREATE TABLE FootballPlayers ( -- This table contains specific information for football players
    FootballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Striker", "Midfielder"). 10-15 distinct values.
    PreferredFoot TEXT -- Preferred foot ("Left", "Right", "Both"). 3 distinct values.
);
-- JOIN GRAPH: "FootballPlayers": ["Players", "FootballTeams", "FootballPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="FootballPlayers">
-- - Description: This table contains specific information for football players
-- - Data:
-- -- FootballPlayerID: Primary key for the FootballPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Striker", "Midfielder"). 10-15 distinct values.
-- -- PreferredFoot: Preferred foot ("Left", "Right", "Both"). 3 distinct values.
-- - Relationships:
-- -- (FootballPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (FootballPlayers.FootballPlayerID → FootballTeams.FootballPlayerID) - Table containing specific information for football teams
-- -- (FootballPlayers.FootballPlayerID → FootballPlayerStats.FootballPlayerID) - Table containing statistics for football players
-- </METADATA>
-- 

-- File: mysports.FootballPlayers.txt 
-- FootballPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Center Back TO Wide Receiver like ['Wide Receiver', 'Striker', 'Quarterback', 'Midfielder', 'Goalkeeper', 'Full Back', 'Forward', 'Defensive Midfielder', 'Defender', 'Center Back']
-- PreferredFoot: TEXT FROM Left TO Right like ['Right', 'Left']
-- 
