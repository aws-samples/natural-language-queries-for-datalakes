CREATE TABLE Players ( -- This table contains information about individual players
    PlayerID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Player's first name (e.g., "LeBron", "Cristiano"). Many distinct values.
    LastName TEXT NOT NULL, -- Player's last name (e.g., "James", "Ronaldo"). Many distinct values.
    DateOfBirth DATE, -- Player's date of birth. Range from 1950 to 2005, evenly distributed.
    Nationality TEXT, -- Player's nationality (e.g., "American", "Portuguese"). 50-100 distinct values.
    Height FLOAT, -- Player's height in cm. Range 150-230, normally distributed around 180.
    Weight FLOAT, -- Player's weight in kg. Range 50-150, normally distributed around 80.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Players": ["Sports", "Teams", "PlayerStats", "Contracts", "Injuries"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Players">
-- - Description: This table contains information about individual players
-- - Data:
-- -- PlayerID: Primary key for the Players table
-- -- FirstName: Player's first name (e.g., "LeBron", "Cristiano"). Many distinct values.
-- -- LastName: Player's last name (e.g., "James", "Ronaldo"). Many distinct values.
-- -- DateOfBirth: Player's date of birth. Range from 1950 to 2005, evenly distributed.
-- -- Nationality: Player's nationality (e.g., "American", "Portuguese"). 50-100 distinct values.
-- -- Height: Player's height in cm. Range 150-230, normally distributed around 180.
-- -- Weight: Player's weight in kg. Range 50-150, normally distributed around 80.
-- -- SportID: References SportID in Sports table. Range 1-20, all values present.
-- - Relationships:
-- -- (Players.SportID → Sports.SportID) - Table containing a list of all sports covered in the database
-- -- (Players.PlayerID → Teams.PlayerID) - Table containing information about sports teams
-- -- (Players.PlayerID → PlayerStats.PlayerID) - Table containing statistics for players
-- -- (Players.PlayerID → Contracts.PlayerID) - Table containing information about player contracts
-- -- (Players.PlayerID → Injuries.PlayerID) - Table containing information about player injuries
-- </METADATA>
-- 

-- File: mysports.Players.txt 
-- PlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FirstName: TEXT FROM Cristiano TO Virat like ['Virat', 'Tom', 'Tiger', 'Sidney', 'Roger', 'Mike', 'LeBron', 'Floyd', 'Dan', 'Cristiano']
-- LastName: TEXT FROM Brady TO Woods like ['Woods', 'Trout', 'Ronaldo', 'Mayweather', 'Kohli', 'James', 'Federer', 'Crosby', 'Carter', 'Brady']
-- DateOfBirth: TEXT FROM 1975-12-30 TO 1991-08-07 like ['1991-08-07', '1988-11-05', '1987-08-07', '1985-02-05', '1984-12-30', '1982-03-05', '1981-08-08', '1977-08-03', '1977-02-24', '1975-12-30']
-- Nationality: TEXT FROM American TO Swiss like ['American', 'Swiss', 'Portuguese', 'New Zealander', 'Indian', 'Canadian']
-- Height: NUMERIC FROM 173.0 TO 203.0 like [185.0, 203.0, 193.0, 188.0, 187.0, 180.0, 178.0, 175.0, 173.0]
-- Weight: NUMERIC FROM 68.0 TO 113.0 like [113.0, 106.0, 102.0, 94.0, 91.0, 85.0, 84.0, 83.0, 72.0, 68.0]
-- SportID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
