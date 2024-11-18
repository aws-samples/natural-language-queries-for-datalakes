CREATE TABLE Transfers ( -- This table contains information about player transfers between teams
    TransferID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    FromTeamID INTEGER, -- References TeamID in Teams table for the originating team.
    ToTeamID INTEGER, -- References TeamID in Teams table for the destination team.
    TransferDate DATE, -- Date of the transfer. Range from 1950 to present.
    TransferFee DECIMAL(15,2) -- Transfer fee in dollars. Range 0-300000000, log-normally distributed.
);
-- JOIN GRAPH: "Transfers": ["Players", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Transfers">
-- - Description: This table contains information about player transfers between teams
-- - Data:
-- -- TransferID: Primary key for the Transfers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- FromTeamID: References TeamID in Teams table for the originating team.
-- -- ToTeamID: References TeamID in Teams table for the destination team.
-- -- TransferDate: Date of the transfer. Range from 1950 to present.
-- -- TransferFee: Transfer fee in dollars. Range 0-300000000, log-normally distributed.
-- - Relationships:
-- -- (Transfers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (Transfers.FromTeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (Transfers.ToTeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.Transfers.txt 
-- TransferID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- FromTeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ToTeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- TransferDate: TEXT FROM 2020-03-20 TO 2021-08-31 like ['2021-08-31', '2021-07-01', '2021-06-30', '2021-02-01', '2021-01-10', '2020-12-31', '2020-09-01', '2020-08-15', '2020-07-15', '2020-03-20']
-- TransferFee: INTEGER FROM 40000000 TO 100000000 like [100000000, 85000000, 75000000, 70000000, 65000000, 60000000, 55000000, 50000000, 45000000, 40000000]
-- 
