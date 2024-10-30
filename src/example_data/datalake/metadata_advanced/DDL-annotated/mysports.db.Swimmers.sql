CREATE TABLE Swimmers ( -- This table contains specific information for swimmers
    SwimmerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Specialization TEXT -- Swimmer's specialization (e.g., "Freestyle", "Butterfly"). 5-7 distinct values.
);
-- JOIN GRAPH: "Swimmers": ["Players", "SwimmingResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Swimmers">
-- - Description: This table contains specific information for swimmers
-- - Data:
-- -- SwimmerID: Primary key for the Swimmers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Specialization: Swimmer's specialization (e.g., "Freestyle", "Butterfly"). 5-7 distinct values.
-- - Relationships:
-- -- (Swimmers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (Swimmers.SwimmerID → SwimmingResults.SwimmerID) - Table containing results of swimming events
-- </METADATA>
-- 

-- File: mysports.Swimmers.txt 
-- SwimmerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Specialization: TEXT FROM Backstroke TO Sprint Freestyle like ['Butterfly', 'Breaststroke', 'Backstroke', 'Sprint Freestyle', 'Individual Medley', 'Freestyle', 'Distance Freestyle']
-- 
