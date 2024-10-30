CREATE TABLE TennisMatchStats ( -- This table contains statistics for tennis matches
    TennisMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    Player1Aces INTEGER, -- Number of aces for Player 1. Range 0-50, most values under 20.
    Player2Aces INTEGER, -- Number of aces for Player 2. Range 0-50, most values under 20.
    Player1DoubleFaults INTEGER, -- Number of double faults for Player 1. Range 0-20, most values under 10.
    Player2DoubleFaults INTEGER -- Number of double faults for Player 2. Range 0-20, most values under 10.
);
-- JOIN GRAPH: "TennisMatchStats": ["GameStats", "TennisMatches"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TennisMatchStats">
-- - Description: This table contains statistics for tennis matches
-- - Data:
-- -- TennisMatchStatID: Primary key for the TennisMatchStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- Player1Aces: Number of aces for Player 1. Range 0-50, most values under 20.
-- -- Player2Aces: Number of aces for Player 2. Range 0-50, most values under 20.
-- -- Player1DoubleFaults: Number of double faults for Player 1. Range 0-20, most values under 10.
-- -- Player2DoubleFaults: Number of double faults for Player 2. Range 0-20, most values under 10.
-- - Relationships:
-- -- (TennisMatchStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- -- (TennisMatchStats.TennisMatchStatID → TennisMatches.TennisMatchStatID) - Table containing information about tennis matches
-- </METADATA>
-- 

-- File: mysports.TennisMatchStats.txt 
-- TennisMatchStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Player1Aces: INTEGER FROM 7 TO 20 like [20, 16, 15, 13, 12, 11, 10, 9, 8, 7]
-- Player2Aces: INTEGER FROM 8 TO 18 like [14, 18, 15, 13, 12, 11, 10, 9, 8]
-- Player1DoubleFaults: INTEGER FROM 1 TO 4 like [2, 1, 3, 4]
-- Player2DoubleFaults: INTEGER FROM 1 TO 4 like [3, 2, 4, 1]
-- 
