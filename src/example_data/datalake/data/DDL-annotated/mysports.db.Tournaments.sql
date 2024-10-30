CREATE TABLE Tournaments ( -- This table contains information about sports tournaments
    TournamentID INTEGER PRIMARY KEY,
    TournamentName TEXT NOT NULL, -- Name of the tournament (e.g., "World Cup", "Wimbledon"). 50-100 distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    StartDate DATE, -- Start date of the tournament. Range from 1950 to present.
    EndDate DATE, -- End date of the tournament. Range from 1950 to present, always after StartDate.
    VenueID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "Tournaments": ["Sports", "Venues", "Games", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Tournaments">
-- - Description: This table contains information about sports tournaments
-- - Data:
-- -- TournamentID: Primary key for the Tournaments table
-- -- TournamentName: Name of the tournament (e.g., "World Cup", "Wimbledon"). 50-100 distinct values.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- -- StartDate: Start date of the tournament. Range from 1950 to present.
-- -- EndDate: End date of the tournament. Range from 1950 to present, always after StartDate.
-- -- VenueID: References VenueID in Venues table. Range depends on number of venues.
-- - Relationships:
-- -- (Tournaments.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Tournaments.VenueID → Venues.VenueID) - Table containing information about sports venues
-- -- (Tournaments.TournamentID → Games.TournamentID) - Table containing information about individual games or matches
-- -- (Tournaments.TournamentID → Teams.TournamentID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.Tournaments.txt 
-- TournamentID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TournamentName: TEXT FROM IPL Final TO World Series like ['World Series', 'Wimbledon', 'UEFA Champions League Final', 'The Masters', 'Super Bowl LV', 'Stanley Cup Finals', 'Rugby World Cup Final', 'NBA Finals', 'Mayweather vs. Paul', 'IPL Final']
-- SportID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- StartDate: TEXT FROM 2019-11-02 TO 2021-07-08 like ['2021-06-28', '2021-07-08', '2021-06-06', '2021-05-29', '2021-04-08', '2021-02-07', '2020-11-10', '2020-10-20', '2019-11-02']
-- EndDate: TEXT FROM 2019-11-02 TO 2021-07-22 like ['2021-07-22', '2021-07-11', '2021-07-07', '2021-06-06', '2021-05-29', '2021-04-11', '2021-02-07', '2020-11-10', '2020-10-27', '2019-11-02']
-- VenueID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
