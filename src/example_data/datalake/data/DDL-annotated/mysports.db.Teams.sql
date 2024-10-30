CREATE TABLE Teams ( -- This table contains information about sports teams
    TeamID INTEGER PRIMARY KEY,
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    TeamName TEXT NOT NULL, -- Full name of the team (e.g., "New York Yankees", "Manchester United"). Typically 100-500 distinct values.
    City TEXT, -- City where the team is based (e.g., "New York", "Manchester"). 50-100 distinct values.
    Country TEXT, -- Country of the team (e.g., "USA", "England"). 20-50 distinct values.
    Founded DATE -- Date when the team was founded. Range from 1800 to present, most values after 1900.
);
-- JOIN GRAPH: "Teams": ["Sports", "Players", "Coaches", "TeamStats", "Games", "Venues"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Teams">
-- - Description: This table contains information about sports teams
-- - Data:
-- -- TeamID: Primary key for the Teams table
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- -- TeamName: Full name of the team (e.g., "New York Yankees", "Manchester United"). Typically 100-500 distinct values.
-- -- City: City where the team is based (e.g., "New York", "Manchester"). 50-100 distinct values.
-- -- Country: Country of the team (e.g., "USA", "England"). 20-50 distinct values.
-- -- Founded: Date when the team was founded. Range from 1800 to present, most values after 1900.
-- - Relationships:
-- -- (Teams.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Teams.TeamID → Players.TeamID) - Table containing information about individual players
-- -- (Teams.TeamID → Coaches.TeamID) - Table containing information about team coaches
-- -- (Teams.TeamID → TeamStats.TeamID) - Table containing aggregated statistics for teams in a season
-- -- (Teams.TeamID → Games.HomeTeamID) - Table containing information about individual games or matches
-- -- (Teams.TeamID → Games.AwayTeamID) - Table containing information about individual games or matches
-- -- (Teams.TeamID → Venues.TeamID) - Table containing information about sports venues
-- </METADATA>
-- 

-- File: mysports.Teams.txt 
-- TeamID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- SportID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- TeamName: TEXT FROM Chicago Bulls TO Toronto Maple Leafs like ['Toronto Maple Leafs', 'New Zealand All Blacks', 'New York Yankees', 'New England Patriots', 'Mumbai Indians', 'Montreal Canadiens', 'Manchester United', 'Los Angeles Lakers', 'Green Bay Packers', 'Chicago Bulls']
-- City: TEXT FROM Boston TO Wellington like ['Wellington', 'Toronto', 'New York', 'Mumbai', 'Montreal', 'Manchester', 'Los Angeles', 'Green Bay', 'Chicago', 'Boston']
-- Country: TEXT FROM Canada TO USA like ['USA', 'Canada', 'New Zealand', 'India', 'England']
-- Founded: TEXT FROM 1878-01-01 TO 2008-01-01 like ['2008-01-01', '1966-01-16', '1959-11-16', '1947-01-01', '1919-08-11', '1917-11-22', '1909-12-04', '1903-01-01', '1901-01-09', '1878-01-01']
-- 
