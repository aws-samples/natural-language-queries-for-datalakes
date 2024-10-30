CREATE TABLE SoccerTeams ( -- This table contains specific information for soccer teams
    SoccerTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    LeaguePosition INTEGER, -- Current position in the league. Range 1-20, evenly distributed.
    GoalDifference INTEGER -- Goal difference (goals scored minus goals conceded). Range -100 to 100, normally distributed around 0.
);
-- JOIN GRAPH: "SoccerTeams": ["Teams", "SoccerPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SoccerTeams">
-- - Description: This table contains specific information for soccer teams
-- - Data:
-- -- SoccerTeamID: Primary key for the SoccerTeams table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- LeaguePosition: Current position in the league. Range 1-20, evenly distributed.
-- -- GoalDifference: Goal difference (goals scored minus goals conceded). Range -100 to 100, normally distributed around 0.
-- - Relationships:
-- -- (SoccerTeams.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (SoccerTeams.SoccerTeamID → SoccerPlayers.SoccerTeamID) - Table containing specific information for soccer players
-- </METADATA>
-- 

-- File: mysports.SoccerTeams.txt 
-- SoccerTeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- LeaguePosition: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- GoalDifference: INTEGER FROM -5 TO 45 like [45, 38, 30, 25, 20, 15, 10, 5, 0, -5]
-- 
