CREATE TABLE GolfTournaments ( -- This table contains information about golf tournaments
    GolfTournamentID INTEGER PRIMARY KEY,
    TournamentID INTEGER, -- References TournamentID in Tournaments table. Range depends on number of tournaments.
    CourseID INTEGER, -- References CourseID in GolfCourses table. Range depends on number of courses.
    PurseAmount DECIMAL(15,2), -- Total purse amount in dollars. Range 100000-20000000, log-normally distributed.
    ParScore INTEGER -- Par score for the course. Range 68-72, most values 70-72.
);
-- JOIN GRAPH: "GolfTournaments": ["Tournaments", "GolfCourses", "GolfScores"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GolfTournaments">
-- - Description: This table contains information about golf tournaments
-- - Data:
-- -- GolfTournamentID: Primary key for the GolfTournaments table
-- -- TournamentID: References TournamentID in Tournaments table. Range depends on number of tournaments.
-- -- CourseID: References CourseID in GolfCourses table. Range depends on number of courses.
-- -- PurseAmount: Total purse amount in dollars. Range 100000-20000000, log-normally distributed.
-- -- ParScore: Par score for the course. Range 68-72, most values 70-72.
-- - Relationships:
-- -- (GolfTournaments.TournamentID → Tournaments.TournamentID) - Table containing information about sports tournaments
-- -- (GolfTournaments.CourseID → GolfCourses.CourseID) - Table containing information about golf courses
-- -- (GolfTournaments.GolfTournamentID → GolfScores.GolfTournamentID) - Table containing scores for golf tournaments
-- </METADATA>
-- 

-- File: mysports.GolfTournaments.txt 
-- GolfTournamentID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TournamentID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- CourseID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- PurseAmount: INTEGER FROM 6000000 TO 11500000 like [11500000, 10000000, 9500000, 9000000, 8500000, 8000000, 7500000, 7000000, 6500000, 6000000]
-- ParScore: INTEGER FROM 70 TO 72 like [72, 71, 70]
-- 
