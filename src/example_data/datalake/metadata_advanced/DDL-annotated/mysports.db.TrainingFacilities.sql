CREATE TABLE TrainingFacilities ( -- This table contains information about team training facilities
    FacilityID INTEGER PRIMARY KEY,
    FacilityName TEXT NOT NULL, -- Name of the training facility. Many distinct values.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    Location TEXT, -- Location of the facility. Many distinct values.
    Size INTEGER, -- Size of the facility in square meters. Range 1000-100000, log-normally distributed.
    OpeningYear INTEGER -- Year the facility opened. Range from 1950 to present.
);
-- JOIN GRAPH: "TrainingFacilities": ["Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TrainingFacilities">
-- - Description: This table contains information about team training facilities
-- - Data:
-- -- FacilityID: Primary key for the TrainingFacilities table
-- -- FacilityName: Name of the training facility. Many distinct values.
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- Location: Location of the facility. Many distinct values.
-- -- Size: Size of the facility in square meters. Range 1000-100000, log-normally distributed.
-- -- OpeningYear: Year the facility opened. Range from 1950 to present.
-- - Relationships:
-- -- (TrainingFacilities.TeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.TrainingFacilities.txt 
-- FacilityID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FacilityName: TEXT FROM Advocate Center TO UCLA Health Training Center like ['UCLA Health Training Center', 'Reliance Stadium', 'Lambeau Field Training Facility', 'High Performance Centre', 'Gillette Stadium Practice Facility', 'George M. Steinbrenner Field', 'Ford Performance Centre', 'Bell Sports Complex', 'Aon Training Complex', 'Advocate Center']
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Location: TEXT FROM Brossard, Quebec TO Wellington, New Zealand like ['Wellington, New Zealand', 'Toronto, Ontario', 'Tampa, Florida', 'Mumbai, India', 'Manchester, England', 'Green Bay, Wisconsin', 'Foxborough, Massachusetts', 'El Segundo, California', 'Chicago, Illinois', 'Brossard, Quebec']
-- Size: INTEGER FROM 45000 TO 120000 like [120000, 108000, 85000, 75000, 70000, 68000, 60000, 55000, 50000, 45000]
-- OpeningYear: INTEGER FROM 1995 TO 2017 like [2017, 2015, 2014, 2010, 2009, 2008, 2002, 2000, 1996, 1995]
-- 
