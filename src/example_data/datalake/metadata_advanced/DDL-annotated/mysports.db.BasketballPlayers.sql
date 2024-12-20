CREATE TABLE BasketballPlayers ( -- This table contains specific information for basketball players
    BasketballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Point Guard", "Center"). 5 distinct values.
    JerseyNumber INTEGER -- Player's jersey number. Range 0-99, some numbers more common than others.
);
-- JOIN GRAPH: "BasketballPlayers": ["Players", "BasketballTeams", "BasketballPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BasketballPlayers">
-- - Description: This table contains specific information for basketball players
-- - Data:
-- -- BasketballPlayerID: Primary key for the BasketballPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Point Guard", "Center"). 5 distinct values.
-- -- JerseyNumber: Player's jersey number. Range 0-99, some numbers more common than others.
-- - Relationships:
-- -- (BasketballPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (BasketballPlayers.BasketballPlayerID → BasketballTeams.BasketballPlayerID) - Table containing specific information for basketball teams
-- -- (BasketballPlayers.BasketballPlayerID → BasketballPlayerStats.BasketballPlayerID) - Table containing statistics for basketball players
-- </METADATA>
-- 

-- File: mysports.BasketballPlayers.txt 
-- BasketballPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Center TO Small Forward like ['Small Forward', 'Shooting Guard', 'Power Forward', 'Point Guard', 'Center']
-- JerseyNumber: INTEGER FROM 3 TO 41 like [41, 34, 33, 30, 24, 23, 21, 11, 8, 3]
-- 
