CREATE TABLE Leagues ( -- This table contains information about sports leagues
    LeagueID INTEGER PRIMARY KEY,
    LeagueName TEXT NOT NULL, -- Name of the league (e.g., "NBA", "Premier League"). 20-50 distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    Country TEXT, -- Country where the league operates. 20-50 distinct values.
    FoundedYear INTEGER -- Year the league was founded. Range 1850 to present, most values after 1900.
);
-- JOIN GRAPH: "Leagues": ["Sports", "Teams", "Seasons", "Tournaments"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Leagues">
-- - Description: This table contains information about sports leagues
-- - Data:
-- -- LeagueID: Primary key for the Leagues table
-- -- LeagueName: Name of the league (e.g., "NBA", "Premier League"). 20-50 distinct values.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- -- Country: Country where the league operates. 20-50 distinct values.
-- -- FoundedYear: Year the league was founded. Range 1850 to present, most values after 1900.
-- - Relationships:
-- -- (Leagues.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Leagues.LeagueID → Teams.LeagueID) - Table containing information about sports teams
-- -- (Leagues.LeagueID → Seasons.LeagueID) - Table containing information about sports seasons
-- -- (Leagues.LeagueID → Tournaments.LeagueID) - Table containing information about sports tournaments
-- </METADATA>
-- 

-- File: mysports.Leagues.txt 
-- LeagueID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- LeagueName: TEXT FROM ATP Tour TO World Boxing Association like ['World Boxing Association', 'Rugby World Cup', 'PGA Tour', 'National Hockey League', 'National Football League', 'National Basketball Association', 'Major League Baseball', 'Indian Premier League', 'English Premier League', 'ATP Tour']
-- SportID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Country: TEXT FROM England TO USA/Canada like ['USA', 'Global', 'USA/Canada', 'India', 'England']
-- FoundedYear: INTEGER FROM 1903 TO 2008 like [2008, 1992, 1987, 1972, 1946, 1929, 1921, 1920, 1917, 1903]
-- 
