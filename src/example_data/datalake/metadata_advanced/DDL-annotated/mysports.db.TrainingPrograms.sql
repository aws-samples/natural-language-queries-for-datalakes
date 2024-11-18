CREATE TABLE TrainingPrograms ( -- This table contains information about team training programs
    ProgramID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ProgramName TEXT NOT NULL, -- Name of the training program. Many distinct values.
    StartDate DATE, -- Start date of the program. Range from 2000 to present.
    EndDate DATE, -- End date of the program. Range from 2000 to future, or NULL if ongoing.
    FocusArea TEXT -- Main focus of the program (e.g., "Endurance", "Strength", "Tactics"). 10-15 distinct values.
);
-- JOIN GRAPH: "TrainingPrograms": ["Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TrainingPrograms">
-- - Description: This table contains information about team training programs
-- - Data:
-- -- ProgramID: Primary key for the TrainingPrograms table
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- ProgramName: Name of the training program. Many distinct values.
-- -- StartDate: Start date of the program. Range from 2000 to present.
-- -- EndDate: End date of the program. Range from 2000 to future, or NULL if ongoing.
-- -- FocusArea: Main focus of the program (e.g., "Endurance", "Strength", "Tactics"). 10-15 distinct values.
-- - Relationships:
-- -- (TrainingPrograms.TeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.TrainingPrograms.txt 
-- ProgramID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ProgramName: TEXT FROM In-Season Maintenance TO World Cup Readiness like ['World Cup Readiness', 'Summer Fitness Boost', 'Spring Training', 'Rookie Integration', 'Pre-Tournament Prep', 'Pre-Season Conditioning', 'Playoff Push', 'Offseason Strength', 'Injury Prevention', 'In-Season Maintenance']
-- StartDate: TEXT FROM 2021-02-01 TO 2022-03-01 like ['2022-03-01', '2021-10-01', '2021-09-01', '2021-08-15', '2021-08-01', '2021-06-01', '2021-05-01', '2021-04-01', '2021-02-15', '2021-02-01']
-- EndDate: TEXT FROM 2021-03-31 TO 2022-05-31 like ['2022-04-30', '2021-09-30', '2021-08-31', '2021-07-31', '2022-05-31', '2021-03-31']
-- FocusArea: TEXT FROM Cardio TO Technique like ['Technique', 'Team Cohesion', 'Tactics', 'Strength', 'Skills', 'Mental Toughness', 'Fundamentals', 'Flexibility', 'Endurance', 'Cardio']
-- 
