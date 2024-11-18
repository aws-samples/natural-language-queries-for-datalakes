CREATE TABLE Referees ( -- This table contains information about sports referees
    RefereeID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Referee's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Referee's last name. Many distinct values.
    DateOfBirth DATE, -- Referee's date of birth. Range from 1950 to 1990, most values between 1970-1985.
    Nationality TEXT, -- Referee's nationality. 50-100 distinct values.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Referees": ["Sports", "Games"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Referees">
-- - Description: This table contains information about sports referees
-- - Data:
-- -- RefereeID: Primary key for the Referees table
-- -- FirstName: Referee's first name. Many distinct values.
-- -- LastName: Referee's last name. Many distinct values.
-- -- DateOfBirth: Referee's date of birth. Range from 1950 to 1990, most values between 1970-1985.
-- -- Nationality: Referee's nationality. 50-100 distinct values.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- - Relationships:
-- -- (Referees.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Referees.RefereeID → GameOfficials.RefereeID) - Table linking referees to specific games
-- </METADATA>
-- 

-- File: mysports.Referees.txt 
-- RefereeID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FirstName: TEXT FROM Alain TO Wes like ['Joe', 'Wes', 'Pierluigi', 'Nigel', 'Michael', 'Kenny', 'Herb', 'Carlos', 'Alain']
-- LastName: TEXT FROM Bayless TO West like ['West', 'Rolland', 'Ramos', 'Owens', 'Oliver', 'McCauley', 'Dean', 'Crawford', 'Collina', 'Bayless']
-- DateOfBirth: TEXT FROM 1950-05-04 TO 1985-02-20 like ['1985-02-20', '1972-01-11', '1971-09-15', '1971-06-18', '1970-09-30', '1966-08-22', '1960-02-13', '1952-10-31', '1951-08-30', '1950-05-04']
-- Nationality: TEXT FROM American TO Welsh like ['American', 'Welsh', 'Portuguese', 'Italian', 'Irish', 'English', 'Canadian']
-- SportID: INTEGER FROM 2 TO 10 like [10, 9, 7, 6, 5, 3, 2]
-- 
