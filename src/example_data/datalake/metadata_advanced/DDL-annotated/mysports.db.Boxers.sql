CREATE TABLE Boxers ( -- This table contains specific information for boxers
    BoxerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Stance TEXT, -- Boxing stance ("Orthodox", "Southpaw"). 2 distinct values, about 90% "Orthodox".
    ReachInches FLOAT -- Boxer's reach in inches. Range 60-90, normally distributed around 70.
);
-- JOIN GRAPH: "Boxers": ["Players", "BoxingMatchResults", "BoxerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Boxers">
-- - Description: This table contains specific information for boxers
-- - Data:
-- -- BoxerID: Primary key for the Boxers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Stance: Boxing stance ("Orthodox", "Southpaw"). 2 distinct values, about 90% "Orthodox".
-- -- ReachInches: Boxer's reach in inches. Range 60-90, normally distributed around 70.
-- - Relationships:
-- -- (Boxers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (Boxers.BoxerID → BoxingMatchResults.WinnerID) - Table containing results of boxing matches
-- -- (Boxers.BoxerID → BoxingMatchResults.LoserID) - Table containing results of boxing matches
-- -- (Boxers.BoxerID → BoxerStats.BoxerID) - Table containing statistics for boxers
-- </METADATA>
-- 

-- File: mysports.Boxers.txt 
-- BoxerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Stance: TEXT FROM Orthodox TO Southpaw like ['Orthodox', 'Southpaw']
-- ReachInches: NUMERIC FROM 66.0 TO 76.0 like [76.0, 74.0, 73.0, 72.0, 71.0, 70.0, 69.0, 68.0, 67.0, 66.0]
-- 
