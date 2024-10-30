CREATE TABLE PlayerStats (
    PlayerStatID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table
    SeasonID INTEGER, -- References SeasonID in Seasons table
    TeamID INTEGER, -- References TeamID in Teams table
    GameID INTEGER, -- References GameID in Games table
    GamesPlayed INTEGER, -- Number of games played
    MinutesPlayed INTEGER, -- Total minutes played
    PointsScored INTEGER, -- Total points scored
    Period TEXT, -- Period of the season (e.g., "Regular Season", "Playoffs")
    Assists INTEGER -- Number of assists
);
-- JOIN GRAPH: "PlayerStats": ["Players", "Seasons", "Teams", "Games"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="PlayerStats">
-- - Description: This table contains statistics for players
-- - Data:
-- -- PlayerStatID: Primary key for the PlayerStats table
-- -- PlayerID: References PlayerID in Players table
-- -- SeasonID: References SeasonID in Seasons table
-- -- TeamID: References TeamID in Teams table
-- -- GameID: References GameID in Games table
-- -- GamesPlayed: Number of games played
-- -- MinutesPlayed: Total minutes played
-- -- PointsScored: Total points scored
-- -- Period: Period of the season (e.g., "Regular Season", "Playoffs")
-- -- Assists: Number of assists
-- - Relationships:
-- -- (PlayerStats.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (PlayerStats.SeasonID → Seasons.SeasonID) - Table containing information about sports seasons
-- -- (PlayerStats.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (PlayerStats.GameID → Games.GameID) - Table containing information about individual games or matches
-- </METADATA>
-- 

-- File: mysports.PlayerStats.txt 
-- PlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- SeasonID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- TeamID: INTEGER FROM 1 TO 7 like [None, 7, 6, 5, 4, 3, 2, 1]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- GamesPlayed: INTEGER FROM 1 TO 162 like [162, 72, 65, 60, 38, 18, 16, 14, 7, 1]
-- MinutesPlayed: INTEGER FROM 36 TO 5850 like [5850, 5400, 3420, 2500, 1458, 1200, 960, 840, 560, 36]
-- PointsScored: INTEGER FROM 35 TO 3900 like [3900, 2000, 1300, 550, 120, 95, 80, 40, 35, None]
-- Period: TEXT FROM Regular Season TO Regular Season like ['Regular Season']
-- Assists: INTEGER FROM 0 TO 500 like [500, 100, 80, 40, 30, 20, 15, 10, 5, 0]
-- 
