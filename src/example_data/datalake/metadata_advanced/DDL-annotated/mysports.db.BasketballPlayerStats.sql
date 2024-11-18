CREATE TABLE BasketballPlayerStats ( -- This table contains statistics for basketball players
    BasketballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    PointsPerGame FLOAT, -- Average points per game. Range 0-40, most values 5-25.
    Rebounds INTEGER, -- Total rebounds. Range 0-1000, depends on games played and position.
    Assists INTEGER, -- Total assists. Range 0-800, depends on games played and position.
    Steals INTEGER, -- Total steals. Range 0-200, most values under 100.
    Blocks INTEGER -- Total blocks. Range 0-200, most values under 100.
);
-- JOIN GRAPH: "BasketballPlayerStats": ["PlayerStats", "BasketballPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BasketballPlayerStats">
-- - Description: This table contains statistics for basketball players
-- - Data:
-- -- BasketballPlayerStatID: Primary key for the BasketballPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- PointsPerGame: Average points per game. Range 0-40, most values 5-25.
-- -- Rebounds: Total rebounds. Range 0-1000, depends on games played and position.
-- -- Assists: Total assists. Range 0-800, depends on games played and position.
-- -- Steals: Total steals. Range 0-200, most values under 100.
-- -- Blocks: Total blocks. Range 0-200, most values under 100.
-- - Relationships:
-- -- (BasketballPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (BasketballPlayerStats.BasketballPlayerStatID → BasketballPlayers.BasketballPlayerStatID) - Table containing specific information for basketball players
-- </METADATA>
-- 

-- File: mysports.BasketballPlayerStats.txt 
-- BasketballPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- PointsPerGame: NUMERIC FROM 15.6 TO 27.5 like [27.5, 24.1, 22.3, 21.9, 20.5, 19.2, 18.7, 17.3, 16.8, 15.6]
-- Rebounds: INTEGER FROM 200 TO 900 like [900, 850, 800, 750, 700, 600, 350, 300, 250, 200]
-- Assists: INTEGER FROM 100 TO 800 like [800, 750, 700, 450, 400, 300, 250, 200, 150, 100]
-- Steals: INTEGER FROM 40 TO 150 like [150, 130, 120, 110, 100, 90, 80, 70, 50, 40]
-- Blocks: INTEGER FROM 15 TO 180 like [180, 160, 120, 100, 80, 70, 30, 25, 20, 15]
-- 
