CREATE TABLE CricketMatchStats ( -- This table contains statistics for cricket matches
    CricketMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamRuns INTEGER, -- Runs scored by home team. Range 50-700, depends on match format.
    AwayTeamRuns INTEGER, -- Runs scored by away team. Range 50-700, depends on match format.
    HomeTeamWickets INTEGER, -- Wickets lost by home team. Range 0-10.
    AwayTeamWickets INTEGER -- Wickets lost by away team. Range 0-10.
);
-- JOIN GRAPH: "CricketMatchStats": ["GameStats", "CricketMatches"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CricketMatchStats">
-- - Description: This table contains statistics for cricket matches
-- - Data:
-- -- CricketMatchStatID: Primary key for the CricketMatchStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamRuns: Runs scored by home team. Range 50-700, depends on match format.
-- -- AwayTeamRuns: Runs scored by away team. Range 50-700, depends on match format.
-- -- HomeTeamWickets: Wickets lost by home team. Range 0-10.
-- -- AwayTeamWickets: Wickets lost by away team. Range 0-10.
-- - Relationships:
-- -- (CricketMatchStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- -- (CricketMatchStats.CricketMatchStatID → CricketMatches.CricketMatchStatID) - Table containing information about cricket matches
-- </METADATA>
-- 

-- File: mysports.CricketMatchStats.txt 
-- CricketMatchStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamRuns: INTEGER FROM 170 TO 420 like [420, 400, 380, 350, 310, 280, 270, 195, 180, 170]
-- AwayTeamRuns: INTEGER FROM 160 TO 400 like [400, 380, 360, 290, 275, 260, 250, 180, 165, 160]
-- HomeTeamWickets: INTEGER FROM 6 TO 10 like [10, 8, 6, 9, 7]
-- AwayTeamWickets: INTEGER FROM 7 TO 10 like [10, 9, 8, 7]
-- 
