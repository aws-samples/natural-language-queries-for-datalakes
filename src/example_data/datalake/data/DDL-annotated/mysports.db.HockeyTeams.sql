CREATE TABLE HockeyTeams ( -- This table contains specific information for hockey teams
    HockeyTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ConferenceRank INTEGER, -- Rank within the conference. Range 1-16, evenly distributed.
    PenaltyKillPercentage FLOAT -- Penalty kill success rate. Range 0.00-100.00, normally distributed around 80.
);
-- JOIN GRAPH: "HockeyTeams": ["Teams", "HockeyPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="HockeyTeams">
-- - Description: This table contains specific information for hockey teams
-- - Data:
-- -- HockeyTeamID: Primary key for the HockeyTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- ConferenceRank: Rank within the conference. Range 1-16, evenly distributed.
-- -- PenaltyKillPercentage: Penalty kill success rate. Range 0.00-100.00, normally distributed around 80.
-- - Relationships:
-- -- (HockeyTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (HockeyTeams.HockeyTeamID → HockeyPlayers.HockeyTeamID) - Table containing specific information for hockey players
-- </METADATA>
-- 

-- File: mysports.HockeyTeams.txt 
-- HockeyTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ConferenceRank: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- PenaltyKillPercentage: NUMERIC FROM 75.8 TO 85.5 like [85.5, 83.2, 82.7, 81.9, 80.5, 79.8, 78.6, 77.9, 76.4, 75.8]
-- 
