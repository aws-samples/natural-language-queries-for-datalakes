CREATE TABLE RugbyTeams ( -- This table contains specific information for rugby teams
    RugbyTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    WorldRanking INTEGER, -- World Rugby ranking. Range 1-20, lower numbers less frequent.
    HomeGroundID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "RugbyTeams": ["Teams", "RugbyPlayers", "Venues"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="RugbyTeams">
-- - Description: This table contains specific information for rugby teams
-- - Data:
-- -- RugbyTeamID: Primary key for the RugbyTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- WorldRanking: World Rugby ranking. Range 1-20, lower numbers less frequent.
-- -- HomeGroundID: References VenueID in Venues table. Range depends on number of venues.
-- - Relationships:
-- -- (RugbyTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (RugbyTeams.RugbyTeamID → RugbyPlayers.RugbyTeamID) - Table containing specific information for rugby players
-- -- (RugbyTeams.HomeGroundID → Venues.VenueID) - Table containing information about sports venues
-- </METADATA>
-- 

-- File: mysports.RugbyTeams.txt 
-- RugbyTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WorldRanking: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeGroundID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
