CREATE TABLE FanClubs ( -- This table contains information about fan clubs
    FanClubID INTEGER PRIMARY KEY,
    ClubName TEXT NOT NULL, -- Name of the fan club. Many distinct values.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    FoundedYear INTEGER, -- Year the fan club was founded. Range from 1900 to present.
    MemberCount INTEGER -- Number of members in the fan club. Range 10-1000000, log-normally distributed.
);
-- JOIN GRAPH: "FanClubs": ["Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="FanClubs">
-- - Description: This table contains information about fan clubs
-- - Data:
-- -- FanClubID: Primary key for the FanClubs table
-- -- ClubName: Name of the fan club. Many distinct values.
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- FoundedYear: Year the fan club was founded. Range from 1900 to present.
-- -- MemberCount: Number of members in the fan club. Range 10-1000000, log-normally distributed.
-- - Relationships:
-- -- (FanClubs.TeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.FanClubs.txt 
-- FanClubID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- ClubName: TEXT FROM All Blacks Supporters Club TO Yankee Universe like ['Yankee Universe', 'Red Devils Supporters Club', 'Patriots Nation', 'Mumbai Maniacs', 'Leafs Nation', 'Lakers Legion', 'Habs Fan Club', 'Cheeseheads', 'Bulls Backers', 'All Blacks Supporters Club']
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- FoundedYear: INTEGER FROM 1878 TO 2008 like [1903, 2008, 1994, 1967, 1966, 1927, 1919, 1909, 1878]
-- MemberCount: INTEGER FROM 50000 TO 250000 like [250000, 200000, 150000, 110000, 100000, 95000, 90000, 80000, 75000, 50000]
-- 
