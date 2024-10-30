CREATE TABLE BoxingMatchResults ( -- This table contains results of boxing matches
    BoxingMatchResultID INTEGER PRIMARY KEY,
    BoxingMatchID INTEGER, -- References BoxingMatchID in BoxingMatches table. Range depends on number of matches.
    WinnerID INTEGER, -- References BoxerID in Boxers table. Range depends on number of boxers.
    LoserID INTEGER, -- References BoxerID in Boxers table. Range depends on number of boxers.
    Result TEXT, -- Result of the match (e.g., "KO", "TKO", "Decision"). 5-7 distinct values.
    RoundEnded INTEGER -- Round in which the match ended. Range 1-12, depends on scheduled rounds.
);
-- JOIN GRAPH: "BoxingMatchResults": ["BoxingMatches", "Boxers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BoxingMatchResults">
-- - Description: This table contains results of boxing matches
-- - Data:
-- -- BoxingMatchResultID: Primary key for the BoxingMatchResults table
-- -- BoxingMatchID: References BoxingMatchID in BoxingMatches table. Range depends on number of matches.
-- -- WinnerID: References BoxerID in Boxers table. Range depends on number of boxers.
-- -- LoserID: References BoxerID in Boxers table. Range depends on number of boxers.
-- -- Result: Result of the match (e.g., "KO", "TKO", "Decision"). 5-7 distinct values.
-- -- RoundEnded: Round in which the match ended. Range 1-12, depends on scheduled rounds.
-- - Relationships:
-- -- (BoxingMatchResults.BoxingMatchID → BoxingMatches.BoxingMatchID) - Table containing information about boxing matches
-- -- (BoxingMatchResults.WinnerID → Boxers.BoxerID) - Table containing specific information for boxers
-- -- (BoxingMatchResults.LoserID → Boxers.BoxerID) - Table containing specific information for boxers
-- </METADATA>
-- 

-- File: mysports.BoxingMatchResults.txt 
-- BoxingMatchResultID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- BoxingMatchID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WinnerID: INTEGER FROM 1 TO 9 like [9, 5, 1, 7, 6, 3, 2]
-- LoserID: INTEGER FROM 2 TO 10 like [10, 8, 4, 7, 6, 3, 2]
-- Result: TEXT FROM Decision TO TKO like ['Decision', 'KO', 'TKO']
-- RoundEnded: INTEGER FROM 4 TO 12 like [12, 11, 9, 7, 6, 4]
-- 
