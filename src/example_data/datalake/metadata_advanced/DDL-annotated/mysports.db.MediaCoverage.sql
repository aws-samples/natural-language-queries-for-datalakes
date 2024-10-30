CREATE TABLE MediaCoverage ( -- This table contains information about media coverage of games
    CoverageID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    NetworkName TEXT, -- Name of the broadcasting network. 20-30 distinct values.
    ViewershipMillions FLOAT, -- Viewership in millions. Range 0.1-100, log-normally distributed.
    Revenue DECIMAL(15,2) -- Revenue generated from the broadcast in dollars. Range 10000-10000000, log-normally distributed.
);
-- JOIN GRAPH: "MediaCoverage": ["Games"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="MediaCoverage">
-- - Description: This table contains information about media coverage of games
-- - Data:
-- -- CoverageID: Primary key for the MediaCoverage table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- NetworkName: Name of the broadcasting network. 20-30 distinct values.
-- -- ViewershipMillions: Viewership in millions. Range 0.1-100, log-normally distributed.
-- -- Revenue: Revenue generated from the broadcast in dollars. Range 10000-10000000, log-normally distributed.
-- - Relationships:
-- -- (MediaCoverage.GameID → Games.GameID) - Table containing information about individual games or matches
-- </METADATA>
-- 

-- File: mysports.MediaCoverage.txt 
-- CoverageID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- NetworkName: TEXT FROM ABC TO TNT like ['TNT', 'Sky Sports', 'NBC', 'Fox Sports', 'Eurosport', 'ESPN', 'CBS', 'BT Sport', 'BBC', 'ABC']
-- ViewershipMillions: NUMERIC FROM 6.2 TO 18.7 like [18.7, 16.8, 15.5, 14.1, 12.3, 10.2, 9.6, 8.9, 7.5, 6.2]
-- Revenue: INTEGER FROM 2000000 TO 6000000 like [6000000, 5500000, 5000000, 4500000, 4000000, 3500000, 3200000, 3000000, 2500000, 2000000]
-- 
