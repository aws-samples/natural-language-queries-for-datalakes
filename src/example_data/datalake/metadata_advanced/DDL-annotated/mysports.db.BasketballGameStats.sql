CREATE TABLE BasketballGameStats ( -- This table contains statistics for basketball games
    BasketballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamRebounds INTEGER, -- Rebounds for home team. Range 20-80, normally distributed around 40.
    AwayTeamRebounds INTEGER, -- Rebounds for away team. Range 20-80, normally distributed around 40.
    HomeTeamAssists INTEGER, -- Assists for home team. Range 10-40, normally distributed around 25.
    AwayTeamAssists INTEGER -- Assists for away team. Range 10-40, normally distributed around 25.
);
-- JOIN GRAPH: "BasketballGameStats": ["GameStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BasketballGameStats">
-- - Description: This table contains statistics for basketball games
-- - Data:
-- -- BasketballGameStatID: Primary key for the BasketballGameStats table
-- -- GameStatID: References GameStatID in GameStats table. Range depends on number of game stats.
-- -- HomeTeamRebounds: Rebounds for home team. Range 20-80, normally distributed around 40.
-- -- AwayTeamRebounds: Rebounds for away team. Range 20-80, normally distributed around 40.
-- -- HomeTeamAssists: Assists for home team. Range 10-40, normally distributed around 25.
-- -- AwayTeamAssists: Assists for away team. Range 10-40, normally distributed around 25.
-- - Relationships:
-- -- (BasketballGameStats.GameStatID → GameStats.GameStatID) - Table containing statistics for games
-- </METADATA>
-- 

-- File: mysports.BasketballGameStats.txt 
-- BasketballGameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamRebounds: INTEGER FROM 39 TO 48 like [48, 47, 46, 45, 44, 43, 42, 41, 40, 39]
-- AwayTeamRebounds: INTEGER FROM 37 TO 46 like [46, 45, 44, 43, 42, 41, 40, 39, 38, 37]
-- HomeTeamAssists: INTEGER FROM 25 TO 33 like [28, 33, 32, 31, 30, 29, 27, 26, 25]
-- AwayTeamAssists: INTEGER FROM 22 TO 30 like [25, 30, 29, 28, 27, 26, 24, 23, 22]
-- 
