CREATE TABLE CricketTeams ( -- This table contains specific information for cricket teams
    CricketTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ICCRanking INTEGER, -- ICC ranking of the team. Range 1-20, lower numbers less frequent.
    HomeGroundID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "CricketTeams": ["Teams", "CricketPlayers", "Venues"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CricketTeams">
-- - Description: This table contains specific information for cricket teams
-- - Data:
-- -- CricketTeamID: Primary key for the CricketTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- ICCRanking: ICC ranking of the team. Range 1-20, lower numbers less frequent.
-- -- HomeGroundID: References VenueID in Venues table. Range depends on number of venues.
-- - Relationships:
-- -- (CricketTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (CricketTeams.CricketTeamID → CricketPlayers.CricketTeamID) - Table containing specific information for cricket players
-- -- (CricketTeams.HomeGroundID → Venues.VenueID) - Table containing information about sports venues
-- </METADATA>
-- 

-- File: mysports.CricketTeams.txt 
-- CricketTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ICCRanking: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeGroundID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
