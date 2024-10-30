CREATE TABLE Awards ( -- This table contains information about sports awards
    AwardID INTEGER PRIMARY KEY,
    AwardName TEXT NOT NULL, -- Name of the award (e.g., "MVP", "Golden Boot"). Many distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    AwardType TEXT -- Type of award ("Individual", "Team"). 2 distinct values.
);
-- JOIN GRAPH: "Awards": ["Sports", "AwardWinners"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Awards">
-- - Description: This table contains information about sports awards
-- - Data:
-- -- AwardID: Primary key for the Awards table
-- -- AwardName: Name of the award (e.g., "MVP", "Golden Boot"). Many distinct values.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- -- AwardType: Type of award ("Individual", "Team"). 2 distinct values.
-- - Relationships:
-- -- (Awards.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Awards.AwardID → AwardWinners.AwardID) - Table containing information about award winners
-- </METADATA>
-- 

-- File: mysports.Awards.txt 
-- AwardID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- AwardName: TEXT FROM Ballon d'Or TO World Series like ['World Series', 'Wimbledon Championship', 'Super Bowl MVP', 'Stanley Cup', 'NBA Championship', 'MVP', 'Golden Boot', 'FIFA World Cup', 'Cy Young Award', "Ballon d'Or"]
-- SportID: INTEGER FROM 1 TO 7 like [7, 6, 2, 5, 3, 1]
-- AwardType: TEXT FROM Individual TO Team like ['Individual', 'Team']
-- 
