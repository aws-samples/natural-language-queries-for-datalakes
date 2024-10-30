CREATE TABLE MMAFightResults ( -- This table contains results of MMA fights
    MMAFightResultID INTEGER PRIMARY KEY,
    MMAFightID INTEGER, -- References MMAFightID in MMAFights table. Range depends on number of fights.
    WinnerID INTEGER, -- References MMAFighterID in MMAFighters table. Range depends on number of fighters.
    LoserID INTEGER, -- References MMAFighterID in MMAFighters table. Range depends on number of fighters.
    Result TEXT, -- Result of the fight (e.g., "KO", "Submission", "Decision"). 5-7 distinct values.
    RoundEnded INTEGER -- Round in which the fight ended. Range 1-5, depends on scheduled rounds.
);
-- JOIN GRAPH: "MMAFightResults": ["MMAFights", "MMAFighters"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="MMAFightResults">
-- - Description: This table contains results of MMA fights
-- - Data:
-- -- MMAFightResultID: Primary key for the MMAFightResults table
-- -- MMAFightID: References MMAFightID in MMAFights table. Range depends on number of fights.
-- -- WinnerID: References MMAFighterID in MMAFighters table. Range depends on number of fighters.
-- -- LoserID: References MMAFighterID in MMAFighters table. Range depends on number of fighters.
-- -- Result: Result of the fight (e.g., "KO", "Submission", "Decision"). 5-7 distinct values.
-- -- RoundEnded: Round in which the fight ended. Range 1-5, depends on scheduled rounds.
-- - Relationships:
-- -- (MMAFightResults.MMAFightID → MMAFights.MMAFightID) - Table containing information about MMA fights
-- -- (MMAFightResults.WinnerID → MMAFighters.MMAFighterID) - Table containing specific information for MMA fighters
-- -- (MMAFightResults.LoserID → MMAFighters.MMAFighterID) - Table containing specific information for MMA fighters
-- </METADATA>
-- 

-- File: mysports.MMAFightResults.txt 
-- MMAFightResultID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- MMAFightID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WinnerID: INTEGER FROM 1 TO 9 like [9, 5, 1, 7, 6, 3, 2]
-- LoserID: INTEGER FROM 2 TO 10 like [10, 8, 4, 7, 6, 3, 2]
-- Result: TEXT FROM Decision TO TKO like ['Submission', 'Decision', 'TKO', 'KO']
-- RoundEnded: INTEGER FROM 1 TO 5 like [3, 5, 4, 2, 1]
-- 
