CREATE TABLE Coaches ( -- This table contains information about team coaches
    CoachID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Coach's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Coach's last name. Many distinct values.
    DateOfBirth DATE, -- Coach's date of birth. Range from 1940 to 1990, most values between 1960-1980.
    Nationality TEXT, -- Coach's nationality. 50-100 distinct values.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Coaches": ["Sports", "Teams", "CoachingHistory"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Coaches">
-- - Description: This table contains information about team coaches
-- - Data:
-- -- CoachID: Primary key for the Coaches table
-- -- FirstName: Coach's first name. Many distinct values.
-- -- LastName: Coach's last name. Many distinct values.
-- -- DateOfBirth: Coach's date of birth. Range from 1940 to 1990, most values between 1960-1980.
-- -- Nationality: Coach's nationality. 50-100 distinct values.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- - Relationships:
-- -- (Coaches.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Coaches.CoachID → Teams.CoachID) - Table containing information about sports teams
-- -- (Coaches.CoachID → CoachingHistory.CoachID) - Table containing the coaching history of coaches
-- </METADATA>
-- 

-- File: mysports.Coaches.txt 
-- CoachID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FirstName: TEXT FROM Bill TO Steve like ['Steve', 'Ravi', 'Pep', 'Mike', 'Joe', 'Ivan', 'Gregg', 'Freddie', 'Butch', 'Bill']
-- LastName: TEXT FROM Babcock TO Shastri like ['Shastri', 'Roach', 'Popovich', 'Maddon', 'Lendl', 'Harmon', 'Hansen', 'Guardiola', 'Belichick', 'Babcock']
-- DateOfBirth: TEXT FROM 1943-08-28 TO 1971-01-18 like ['1971-01-18', '1963-04-29', '1962-05-27', '1960-03-07', '1960-03-05', '1959-05-07', '1954-02-08', '1952-04-16', '1949-01-28', '1943-08-28']
-- Nationality: TEXT FROM American TO Spanish like ['American', 'Spanish', 'New Zealander', 'Indian', 'Czech', 'Canadian']
-- SportID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
