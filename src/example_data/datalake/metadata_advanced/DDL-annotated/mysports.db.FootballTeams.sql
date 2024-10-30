CREATE TABLE FootballTeams ( -- This table contains specific information for football teams
    FootballTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    Formation TEXT, -- Preferred formation (e.g., "4-4-2", "3-5-2"). 10-20 distinct values.
    LeaguePosition INTEGER -- Current position in the league. Range 1-20, evenly distributed.
);
-- JOIN GRAPH: "FootballTeams": ["Teams", "FootballPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="FootballTeams">
-- - Description: This table contains specific information for football teams
-- - Data:
-- -- FootballTeamID: Primary key for the FootballTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- Formation: Preferred formation (e.g., "4-4-2", "3-5-2"). 10-20 distinct values.
-- -- LeaguePosition: Current position in the league. Range 1-20, evenly distributed.
-- - Relationships:
-- -- (FootballTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (FootballTeams.FootballTeamID → FootballPlayers.FootballTeamID) - Table containing specific information for football players
-- </METADATA>
-- 

-- File: mysports.FootballTeams.txt 
-- FootballTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Formation: TEXT FROM 3-4-2-1 TO 5-3-2 like ['5-3-2', '4-4-2', '4-3-3', '4-3-1-2', '4-2-3-1', '4-2-2-2', '4-1-4-1', '3-5-2', '3-4-3', '3-4-2-1']
-- LeaguePosition: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
