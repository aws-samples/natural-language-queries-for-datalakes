CREATE TABLE Venues ( -- This table contains information about sports venues
    VenueID INTEGER PRIMARY KEY,
    VenueName TEXT NOT NULL, -- Name of the venue (e.g., "Madison Square Garden", "Wembley Stadium"). Many distinct values.
    City TEXT, -- City where the venue is located. 50-100 distinct values.
    Country TEXT, -- Country where the venue is located. 20-50 distinct values.
    Capacity INTEGER, -- Seating capacity of the venue. Range 1000-100000, log-normally distributed.
    Opened DATE, -- Date when the venue was opened. Range from 1800 to present, most values after 1950.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Venues": ["Sports", "Teams", "Games", "Tournaments"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Venues">
-- - Description: This table contains information about sports venues
-- - Data:
-- -- VenueID: Primary key for the Venues table
-- -- VenueName: Name of the venue (e.g., "Madison Square Garden", "Wembley Stadium"). Many distinct values.
-- -- City: City where the venue is located. 50-100 distinct values.
-- -- Country: Country where the venue is located. 20-50 distinct values.
-- -- Capacity: Seating capacity of the venue. Range 1000-100000, log-normally distributed.
-- -- Opened: Date when the venue was opened. Range from 1800 to present, most values after 1950.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- - Relationships:
-- -- (Venues.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Venues.VenueID → Teams.VenueID) - Table containing information about sports teams
-- -- (Venues.VenueID → Games.VenueID) - Table containing information about individual games or matches
-- -- (Venues.VenueID → Tournaments.VenueID) - Table containing information about sports tournaments
-- </METADATA>
-- 

-- File: mysports.Venues.txt 
-- VenueID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- VenueName: TEXT FROM Augusta National Golf Club TO Yankee Stadium like ['Yankee Stadium', 'Wimbledon Centre Court', 'Wankhede Stadium', 'Staples Center', 'Scotiabank Arena', 'Old Trafford', 'MGM Grand Garden Arena', 'Gillette Stadium', 'Eden Park', 'Augusta National Golf Club']
-- City: TEXT FROM Auckland TO Toronto like ['Toronto', 'New York', 'Mumbai', 'Manchester', 'Los Angeles', 'London', 'Las Vegas', 'Foxborough', 'Augusta', 'Auckland']
-- Country: TEXT FROM Canada TO USA like ['USA', 'England', 'New Zealand', 'India', 'Canada']
-- Capacity: INTEGER FROM 14979 TO 74140 like [74140, 65878, 54251, 50000, 40000, 33108, 19800, 19079, 17157, 14979]
-- Opened: TEXT FROM 1900-01-01 TO 2009-04-02 like ['2009-04-02', '2002-05-11', '1999-10-17', '1999-02-19', '1993-12-18', '1974-03-01', '1933-01-13', '1922-06-26', '1910-02-19', '1900-01-01']
-- SportID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
