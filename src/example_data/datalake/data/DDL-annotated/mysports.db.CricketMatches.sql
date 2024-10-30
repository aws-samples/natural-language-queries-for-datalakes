CREATE TABLE CricketMatches ( -- This table contains information about cricket matches
    CricketMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    Format TEXT, -- Match format (e.g., "Test", "ODI", "T20"). 3-5 distinct values.
    Overs INTEGER -- Number of overs in the match. Common values: 20, 50, or 450 (for Test matches).
);
-- JOIN GRAPH: "CricketMatches": ["Games", "CricketMatchStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CricketMatches">
-- - Description: This table contains information about cricket matches
-- - Data:
-- -- CricketMatchID: Primary key for the CricketMatches table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- Format: Match format (e.g., "Test", "ODI", "T20"). 3-5 distinct values.
-- -- Overs: Number of overs in the match. Common values: 20, 50, or 450 (for Test matches).
-- - Relationships:
-- -- (CricketMatches.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (CricketMatches.CricketMatchID → CricketMatchStats.CricketMatchID) - Table containing statistics for cricket matches
-- </METADATA>
-- 

-- File: mysports.CricketMatches.txt 
-- CricketMatchID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Format: TEXT FROM ODI TO Test like ['Test', 'T20', 'ODI']
-- Overs: INTEGER FROM 20 TO 450 like [450, 50, 20]
-- 
