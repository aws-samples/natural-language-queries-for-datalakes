CREATE TABLE Sports ( -- This table contains a list of all sports covered in the database
    SportID INTEGER PRIMARY KEY,
    SportName TEXT NOT NULL -- Name of the sport (e.g., "Football", "Basketball", "Tennis"). Typically 10-20 distinct values.
);
-- JOIN GRAPH: "Sports": ["Teams", "Players", "Venues", "Leagues", "Tournaments"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Sports">
-- - Description: This table contains a list of all sports covered in the database
-- - Data:
-- -- SportID: Primary key for the Sports table
-- -- SportName: Name of the sport (e.g., "Football", "Basketball", "Tennis"). Typically 10-20 distinct values.
-- - Relationships:
-- -- (Sports.SportID → Teams.SportID) - Table containing information about sports teams
-- -- (Sports.SportID → Players.SportID) - Table containing information about individual players
-- -- (Sports.SportID → Venues.SportID) - Table containing information about sports venues
-- -- (Sports.SportID → Leagues.SportID) - Table containing information about sports leagues
-- -- (Sports.SportID → Tournaments.SportID) - Table containing information about sports tournaments
-- </METADATA>
-- 

-- File: mysports.Sports.txt 
-- SportID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- SportName: TEXT FROM Baseball TO Tennis like ['Tennis', 'Soccer', 'Rugby', 'Hockey', 'Golf', 'Football', 'Cricket', 'Boxing', 'Basketball', 'Baseball']
-- 
