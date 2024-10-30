CREATE TABLE RugbyPlayers ( -- This table contains specific information for rugby players
    RugbyPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Fly-half", "Prop"). 15 distinct values.
    Caps INTEGER -- Number of international appearances. Range 0-150, most values under 50.
);
-- JOIN GRAPH: "RugbyPlayers": ["Players", "RugbyTeams", "RugbyPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="RugbyPlayers">
-- - Description: This table contains specific information for rugby players
-- - Data:
-- -- RugbyPlayerID: Primary key for the RugbyPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Fly-half", "Prop"). 15 distinct values.
-- -- Caps: Number of international appearances. Range 0-150, most values under 50.
-- - Relationships:
-- -- (RugbyPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (RugbyPlayers.RugbyPlayerID → RugbyTeams.RugbyPlayerID) - Table containing specific information for rugby teams
-- -- (RugbyPlayers.RugbyPlayerID → RugbyPlayerStats.RugbyPlayerID) - Table containing statistics for rugby players
-- </METADATA>
-- 

-- File: mysports.RugbyPlayers.txt 
-- RugbyPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Centre TO Wing like ['Wing', 'Scrum-half', 'Prop', 'Number 8', 'Lock', 'Hooker', 'Full-back', 'Fly-half', 'Flanker', 'Centre']
-- Caps: INTEGER FROM 68 TO 112 like [112, 103, 95, 92, 89, 86, 81, 78, 75, 68]
-- 
