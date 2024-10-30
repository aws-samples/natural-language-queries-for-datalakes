CREATE TABLE GolfPlayerStats ( -- This table contains statistics for golf players
    GolfPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    WorldRanking INTEGER, -- World Golf Ranking. Range 1-1000, lower numbers less frequent.
    SeasonEarnings DECIMAL(15,2), -- Season earnings in dollars. Range 0-20000000, log-normally distributed.
    DrivingAccuracy FLOAT, -- Driving accuracy percentage. Range 0.00-100.00, normally distributed around 60.
    GreenInRegulationPercentage FLOAT -- Green in regulation percentage. Range 0.00-100.00, normally distributed around 65.
);
-- JOIN GRAPH: "GolfPlayerStats": ["PlayerStats", "GolfPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GolfPlayerStats">
-- - Description: This table contains statistics for golf players
-- - Data:
-- -- GolfPlayerStatID: Primary key for the GolfPlayerStats table
-- -- PlayerStatID: References PlayerStatID in PlayerStats table. Range depends on number of player stats.
-- -- WorldRanking: World Golf Ranking. Range 1-1000, lower numbers less frequent.
-- -- SeasonEarnings: Season earnings in dollars. Range 0-20000000, log-normally distributed.
-- -- DrivingAccuracy: Driving accuracy percentage. Range 0.00-100.00, normally distributed around 60.
-- -- GreenInRegulationPercentage: Green in regulation percentage. Range 0.00-100.00, normally distributed around 65.
-- - Relationships:
-- -- (GolfPlayerStats.PlayerStatID → PlayerStats.PlayerStatID) - Table containing statistics for players
-- -- (GolfPlayerStats.GolfPlayerStatID → GolfPlayers.GolfPlayerStatID) - Table containing specific information for golf players
-- </METADATA>
-- 

-- File: mysports.GolfPlayerStats.txt 
-- GolfPlayerStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerStatID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WorldRanking: INTEGER FROM 1 TO 25 like [25, 20, 15, 12, 8, 7, 5, 3, 2, 1]
-- SeasonEarnings: INTEGER FROM 1500000 TO 7500000 like [7500000, 6500000, 5800000, 4200000, 3500000, 3100000, 2800000, 2200000, 1800000, 1500000]
-- DrivingAccuracy: NUMERIC FROM 61.9 TO 68.2 like [68.2, 67.9, 66.1, 65.8, 65.5, 64.6, 64.3, 63.7, 62.8, 61.9]
-- GreenInRegulationPercentage: NUMERIC FROM 66.4 TO 73.2 like [73.2, 72.3, 71.5, 70.9, 70.1, 69.8, 68.7, 68.2, 67.6, 66.4]
-- 
