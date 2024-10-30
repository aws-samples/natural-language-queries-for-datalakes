CREATE TABLE FootballGameStats ( -- This table contains statistics for football games
    FootballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    Possession FLOAT, -- Ball possession percentage for home team. Range 0-100, normally distributed around 50.
    Corners INTEGER, -- Number of corners for home team. Range 0-20, most values under 10.
    Fouls INTEGER, -- Number of fouls committed by home team. Range 0-30, most values 10-20.
    Offsides INTEGER -- Number of offsides for home team. Range 0-10, most values under 5.
);
-- JOIN GRAPH: "FootballGameStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="FootballGameStats">
-- - Description: This table contains statistics for football games
-- - Data:
-- -- FootballGameStatID: Primary key for the FootballGameStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- Possession: Ball possession percentage for home team. Range 0-100, normally distributed around 50.
-- -- Corners: Number of corners for home team. Range 0-20, most values under 10.
-- -- Fouls: Number of fouls committed by home team. Range 0-30, most values 10-20.
-- -- Offsides: Number of offsides for home team. Range 0-10, most values under 5.
-- - Relationships:
-- -- (FootballGameStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.FootballGameStats.txt 
-- FootballGameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Possession: NUMERIC FROM 47.2 TO 55.2 like [55.2, 54.8, 53.6, 52.8, 52.1, 51.5, 50.9, 49.3, 48.7, 47.2]
-- Corners: INTEGER FROM 4 TO 9 like [8, 7, 6, 5, 9, 4]
-- Fouls: INTEGER FROM 9 TO 16 like [12, 11, 16, 15, 14, 13, 10, 9]
-- Offsides: INTEGER FROM 1 TO 4 like [2, 4, 3, 1]
-- 
