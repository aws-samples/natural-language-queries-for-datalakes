CREATE TABLE TeamStats ( -- This table contains aggregated statistics for teams in a season
    TeamStatID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    SeasonID INTEGER, -- References SeasonID in Seasons table. Range depends on number of seasons.
    Wins INTEGER, -- Number of wins. Range 0-100, typically 0-50.
    Losses INTEGER, -- Number of losses. Range 0-100, typically 0-50.
    Draws INTEGER, -- Number of draws (if applicable). Range 0-50, many sports will have 0.
    PointsScored INTEGER, -- Total points scored. Range 0-10000, depends on sport.
    PointsConceded INTEGER -- Total points conceded. Range 0-10000, depends on sport.
);
-- JOIN GRAPH: "TeamStats": ["Teams", "Seasons"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TeamStats">
-- - Description: This table contains aggregated statistics for teams in a season
-- - Data:
-- -- TeamStatID: Primary key for the TeamStats table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- SeasonID: References SeasonID in Seasons table. Range depends on number of seasons.
-- -- Wins: Number of wins. Range 0-100, typically 0-50.
-- -- Losses: Number of losses. Range 0-100, typically 0-50.
-- -- Draws: Number of draws (if applicable). Range 0-50, many sports will have 0.
-- -- PointsScored: Total points scored. Range 0-10000, depends on sport.
-- -- PointsConceded: Total points conceded. Range 0-10000, depends on sport.
-- - Relationships:
-- -- (TeamStats.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (TeamStats.SeasonID → Seasons.SeasonID) - Table containing information about sports seasons
-- </METADATA>
-- 

-- File: mysports.TeamStats.txt 
-- TeamStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- SeasonID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- Wins: INTEGER FROM 7 TO 95 like [95, 52, 48, 35, 32, 22, 12, 10, 9, 7]
-- Losses: INTEGER FROM 0 TO 67 like [20, 67, 24, 23, 9, 6, 5, 4, 0]
-- Draws: INTEGER FROM 0 TO 7 like [0, 5, 7]
-- PointsScored: INTEGER FROM 70 TO 8500 like [8500, 8200, 2500, 850, 450, 400, 320, 210, 200, 70]
-- PointsConceded: INTEGER FROM 40 TO 8100 like [8100, 8000, 2300, 700, 380, 350, 190, 180, 120, 40]
-- 
