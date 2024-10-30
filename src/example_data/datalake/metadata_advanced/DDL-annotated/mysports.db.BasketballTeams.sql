CREATE TABLE BasketballTeams ( -- This table contains specific information for basketball teams
    BasketballTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    HomeCourtAdvantage FLOAT, -- Home court advantage factor. Range 1.0-1.5, normally distributed around 1.2.
    ConferenceRank INTEGER -- Rank within the conference. Range 1-15, evenly distributed.
);
-- JOIN GRAPH: "BasketballTeams": ["Teams", "BasketballPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BasketballTeams">
-- - Description: This table contains specific information for basketball teams
-- - Data:
-- -- BasketballTeamID: Primary key for the BasketballTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- HomeCourtAdvantage: Home court advantage factor. Range 1.0-1.5, normally distributed around 1.2.
-- -- ConferenceRank: Rank within the conference. Range 1-15, evenly distributed.
-- - Relationships:
-- -- (BasketballTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (BasketballTeams.BasketballTeamID → BasketballPlayers.BasketballTeamID) - Table containing specific information for basketball players
-- </METADATA>
-- 

-- File: mysports.BasketballTeams.txt 
-- BasketballTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeCourtAdvantage: NUMERIC FROM 1.14 TO 1.23 like [1.23, 1.22, 1.21, 1.2, 1.19, 1.18, 1.17, 1.16, 1.15, 1.14]
-- ConferenceRank: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
