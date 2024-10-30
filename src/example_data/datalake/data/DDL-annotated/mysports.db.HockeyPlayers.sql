CREATE TABLE HockeyPlayers ( -- This table contains specific information for hockey players
    HockeyPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Center", "Defenseman"). 6 distinct values.
    ShootingSide TEXT -- Shooting side ("Left", "Right"). 2 distinct values, about 60% "Left".
);
-- JOIN GRAPH: "HockeyPlayers": ["Players", "HockeyTeams", "HockeyPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="HockeyPlayers">
-- - Description: This table contains specific information for hockey players
-- - Data:
-- -- HockeyPlayerID: Primary key for the HockeyPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Center", "Defenseman"). 6 distinct values.
-- -- ShootingSide: Shooting side ("Left", "Right"). 2 distinct values, about 60% "Left".
-- - Relationships:
-- -- (HockeyPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (HockeyPlayers.HockeyPlayerID → HockeyTeams.HockeyPlayerID) - Table containing specific information for hockey teams
-- -- (HockeyPlayers.HockeyPlayerID → HockeyPlayerStats.HockeyPlayerID) - Table containing statistics for hockey players
-- </METADATA>
-- 

-- File: mysports.HockeyPlayers.txt 
-- HockeyPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Center TO Right Wing like ['Right Wing', 'Left Wing', 'Goalie', 'Defenseman', 'Center']
-- ShootingSide: TEXT FROM Left TO Right like ['Left', 'Right']
-- 
