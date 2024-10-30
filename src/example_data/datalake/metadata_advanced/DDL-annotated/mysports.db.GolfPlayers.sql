CREATE TABLE GolfPlayers ( -- This table contains specific information for golf players
    GolfPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    ProSince DATE, -- Date when player turned professional. Range from 1950 to present.
    Handedness TEXT -- Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
);
-- JOIN GRAPH: "GolfPlayers": ["Players", "GolfPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GolfPlayers">
-- - Description: This table contains specific information for golf players
-- - Data:
-- -- GolfPlayerID: Primary key for the GolfPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- ProSince: Date when player turned professional. Range from 1950 to present.
-- -- Handedness: Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
-- - Relationships:
-- -- (GolfPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (GolfPlayers.GolfPlayerID → GolfPlayerStats.GolfPlayerID) - Table containing statistics for golf players
-- </METADATA>
-- 

-- File: mysports.GolfPlayers.txt 
-- GolfPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ProSince: TEXT FROM 1996-08-29 TO 2013-11-01 like ['2013-11-01', '2012-08-30', '2011-05-22', '2010-03-05', '2009-01-15', '2007-10-10', '2005-09-01', '2000-06-15', '1998-07-20', '1996-08-29']
-- Handedness: TEXT FROM Left TO Right like ['Right', 'Left']
-- 
