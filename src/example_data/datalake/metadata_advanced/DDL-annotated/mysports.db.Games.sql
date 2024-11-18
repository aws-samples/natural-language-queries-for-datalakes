CREATE TABLE Games ( -- This table contains information about individual games or matches
    GameID INTEGER PRIMARY KEY,
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    HomeTeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    AwayTeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    VenueID INTEGER, -- References VenueID in Venues table. Range depends on number of venues.
    GameDate DATE, -- Date of the game. Range from 1950 to present, most recent years more frequent.
    SeasonID INTEGER, -- References SeasonID in Seasons table. Range depends on number of seasons.
    Attendance INTEGER -- Number of attendees. Range 0-100000, depends on venue capacity.
);
-- JOIN GRAPH: "Games": ["Sports", "Teams", "Venues", "Seasons", "GameStats", "Tickets", "Bets"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Games">
-- - Description: This table contains information about individual games or matches
-- - Data:
-- -- GameID: Primary key for the Games table
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- -- HomeTeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- AwayTeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- VenueID: References VenueID in Venues table. Range depends on number of venues.
-- -- GameDate: Date of the game. Range from 1950 to present, most recent years more frequent.
-- -- SeasonID: References SeasonID in Seasons table. Range depends on number of seasons.
-- -- Attendance: Number of attendees. Range 0-100000, depends on venue capacity.
-- - Relationships:
-- -- (Games.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Games.HomeTeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (Games.AwayTeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (Games.VenueID → Venues.VenueID) - Table containing information about sports venues
-- -- (Games.SeasonID → Seasons.SeasonID) - Table containing information about sports seasons
-- -- (Games.GameID → GameStats.GameID) - Table containing statistics for games
-- -- (Games.GameID → Tickets.GameID) - Table containing information about ticket sales
-- -- (Games.GameID → Bets.GameID) - Table containing information about sports bets
-- </METADATA>
-- 

-- File: mysports.Games.txt 
-- GameID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- SportID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- HomeTeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- AwayTeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- VenueID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- GameDate: TEXT FROM 2019-10-19 TO 2021-03-20 like ['2021-03-20', '2021-02-14', '2021-01-13', '2020-12-25', '2020-12-20', '2020-11-15', '2020-10-24', '2020-10-10', '2020-08-03', '2019-10-19']
-- SeasonID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- Attendance: INTEGER FROM 18500 TO 74140 like [74140, 65878, 65000, 54251, 50000, 33108, 19800, 19500, 19079, 18500]
-- 
