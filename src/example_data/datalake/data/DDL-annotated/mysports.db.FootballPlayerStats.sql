CREATE TABLE FootballPlayerStats ( -- This table contains statistics for football players
    FootballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Goals INTEGER, -- Number of goals scored. Range 0-50, most values under 20.
    Assists INTEGER, -- Number of assists. Range 0-30, most values under 15.
    YellowCards INTEGER, -- Number of yellow cards received. Range 0-20, most values under 10.
    RedCards INTEGER -- Number of red cards received. Range 0-5, most values 0 or 1.
);
-- JOIN GRAPH: "FootballPlayerStats": ["PlayerStats", "FootballPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="FootballPlayerStats">
-- - Description: This table contains statistics for football players
-- - Data:
-- -- FootballPlayerStatID: Primary key for the FootballPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- Goals: Number of goals scored. Range 0-50, most values under 20.
-- -- Assists: Number of assists. Range 0-30, most values under 15.
-- -- YellowCards: Number of yellow cards received. Range 0-20, most values under 10.
-- -- RedCards: Number of red cards received. Range 0-5, most values 0 or 1.
-- - Relationships:
-- -- (FootballPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (FootballPlayerStats.FootballPlayerStatID → FootballPlayers.FootballPlayerStatID) - Table containing specific information for football players
-- </METADATA>
-- 

-- File: mysports.FootballPlayerStats.txt 
-- FootballPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Goals: INTEGER FROM 0 TO 40 like [0, 40, 35, 28, 10, 5, 3, 2, 1]
-- Assists: INTEGER FROM 0 TO 25 like [25, 20, 15, 12, 10, 8, 7, 5, 2, 0]
-- YellowCards: INTEGER FROM 1 TO 10 like [1, 10, 8, 7, 6, 5, 4, 3, 2]
-- RedCards: INTEGER FROM 0 TO 1 like [0, 1]
-- 
