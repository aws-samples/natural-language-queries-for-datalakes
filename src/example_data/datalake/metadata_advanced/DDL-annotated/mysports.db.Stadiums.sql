CREATE TABLE Stadiums ( -- This table contains information about sports stadiums
    StadiumID INTEGER PRIMARY KEY,
    StadiumName TEXT NOT NULL, -- Name of the stadium. Many distinct values.
    City TEXT, -- City where the stadium is located. 50-100 distinct values.
    Country TEXT, -- Country where the stadium is located. 20-50 distinct values.
    Capacity INTEGER, -- Seating capacity of the stadium. Range 1000-100000, log-normally distributed.
    OpeningYear INTEGER -- Year the stadium opened. Range from 1800 to present, most values after 1950.
);
-- JOIN GRAPH: "Stadiums": ["Games", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Stadiums">
-- - Description: This table contains information about sports stadiums
-- - Data:
-- -- StadiumID: Primary key for the Stadiums table
-- -- StadiumName: Name of the stadium. Many distinct values.
-- -- City: City where the stadium is located. 50-100 distinct values.
-- -- Country: Country where the stadium is located. 20-50 distinct values.
-- -- Capacity: Seating capacity of the stadium. Range 1000-100000, log-normally distributed.
-- -- OpeningYear: Year the stadium opened. Range from 1800 to present, most values after 1950.
-- - Relationships:
-- -- (Stadiums.StadiumID → Games.VenueID) - Table containing information about individual games or matches
-- -- (Stadiums.StadiumID → Teams.HomeStadiumID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.Stadiums.txt 
-- StadiumID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- StadiumName: TEXT FROM Allianz Arena TO Yankee Stadium like ['Yankee Stadium', 'Wembley Stadium', 'San Siro', 'MetLife Stadium', 'Melbourne Cricket Ground', 'Maracana', 'FNB Stadium', 'Estadio Azteca', 'Camp Nou', 'Allianz Arena']
-- City: TEXT FROM Barcelona TO Rio de Janeiro like ['Rio de Janeiro', 'New York City', 'Munich', 'Milan', 'Mexico City', 'Melbourne', 'London', 'Johannesburg', 'East Rutherford', 'Barcelona']
-- Country: TEXT FROM Australia TO USA like ['USA', 'Spain', 'South Africa', 'Mexico', 'Italy', 'Germany', 'England', 'Brazil', 'Australia']
-- Capacity: INTEGER FROM 54251 TO 100024 like [100024, 99354, 94736, 90000, 87523, 82500, 80018, 78838, 75000, 54251]
-- OpeningYear: INTEGER FROM 1853 TO 2010 like [2010, 2009, 2007, 2005, 1989, 1966, 1957, 1950, 1926, 1853]
-- 
