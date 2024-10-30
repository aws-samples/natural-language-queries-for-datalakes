CREATE TABLE BoxingMatches ( -- This table contains information about boxing matches
    BoxingMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    WeightClass TEXT, -- Weight class of the match (e.g., "Heavyweight", "Welterweight"). 17 distinct values.
    Rounds INTEGER, -- Scheduled number of rounds. Common values: 4, 6, 8, 10, 12.
    Title TEXT -- Title at stake, if any (e.g., "WBA Heavyweight", "IBF Welterweight"). Many distinct values, often NULL.
);
-- JOIN GRAPH: "BoxingMatches": ["Games", "BoxingMatchResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BoxingMatches">
-- - Description: This table contains information about boxing matches
-- - Data:
-- -- BoxingMatchID: Primary key for the BoxingMatches table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- WeightClass: Weight class of the match (e.g., "Heavyweight", "Welterweight"). 17 distinct values.
-- -- Rounds: Scheduled number of rounds. Common values: 4, 6, 8, 10, 12.
-- -- Title: Title at stake, if any (e.g., "WBA Heavyweight", "IBF Welterweight"). Many distinct values, often NULL.
-- - Relationships:
-- -- (BoxingMatches.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (BoxingMatches.BoxingMatchID → BoxingMatchResults.BoxingMatchID) - Table containing results of boxing matches
-- </METADATA>
-- 

-- File: mysports.BoxingMatches.txt 
-- BoxingMatchID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WeightClass: TEXT FROM Bantamweight TO Welterweight like ['Welterweight', 'Super Middleweight', 'Middleweight', 'Lightweight', 'Light Heavyweight', 'Heavyweight', 'Flyweight', 'Featherweight', 'Cruiserweight', 'Bantamweight']
-- Rounds: INTEGER FROM 12 TO 12 like [12]
-- Title: TEXT FROM IBF Bantamweight Championship TO WBO Lightweight Championship like [None, 'WBO Lightweight Championship', 'WBO Flyweight Championship', 'WBC Welterweight Championship', 'WBC Cruiserweight Championship', 'WBA Heavyweight Championship', 'WBA Featherweight Championship', 'IBF Middleweight Championship', 'IBF Bantamweight Championship']
-- 
