CREATE TABLE CoachingHistory ( -- This table contains the coaching history of coaches
    CoachingHistoryID INTEGER PRIMARY KEY,
    CoachID INTEGER, -- References CoachID in Coaches table. Range depends on number of coaches.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    StartDate DATE, -- Start date of coaching tenure. Range from 1950 to present.
    EndDate DATE, -- End date of coaching tenure. Range from 1950 to present, or NULL if current.
    Position TEXT -- Coaching position (e.g., "Head Coach", "Assistant Coach"). 5-10 distinct values.
);
-- JOIN GRAPH: "CoachingHistory": ["Coaches", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="CoachingHistory">
-- - Description: This table contains the coaching history of coaches
-- - Data:
-- -- CoachingHistoryID: Primary key for the CoachingHistory table
-- -- CoachID: References CoachID in Coaches table. Range depends on number of coaches.
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- StartDate: Start date of coaching tenure. Range from 1950 to present.
-- -- EndDate: End date of coaching tenure. Range from 1950 to present, or NULL if current.
-- -- Position: Coaching position (e.g., "Head Coach", "Assistant Coach"). 5-10 distinct values.
-- - Relationships:
-- -- (CoachingHistory.CoachID → Coaches.CoachID) - Table containing information about team coaches
-- -- (CoachingHistory.TeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.CoachingHistory.txt 
-- CoachingHistoryID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- CoachID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- StartDate: TEXT FROM 2015-01-01 TO 2020-01-01 like ['2020-01-01', '2019-12-01', '2019-06-01', '2018-09-01', '2018-03-15', '2017-11-01', '2017-01-01', '2016-08-01', '2016-07-01', '2015-01-01']
-- EndDate: TEXT FROM 2019-07-31 TO 2021-08-31 like [None, '2021-08-31', '2021-05-31', '2020-06-30', '2019-07-31']
-- Position: TEXT FROM Assistant Coach TO Head Coach like ['Head Coach', 'Assistant Coach']
-- 
