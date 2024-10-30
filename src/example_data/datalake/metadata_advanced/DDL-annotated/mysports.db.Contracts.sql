CREATE TABLE Contracts ( -- This table contains information about player contracts
    ContractID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    StartDate DATE, -- Start date of the contract. Range from 1950 to present.
    EndDate DATE, -- End date of the contract. Range from 1950 to future, always after StartDate.
    AnnualSalary DECIMAL(15,2) -- Annual salary in dollars. Range 10000-50000000, log-normally distributed.
);
-- JOIN GRAPH: "Contracts": ["Players", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Contracts">
-- - Description: This table contains information about player contracts
-- - Data:
-- -- ContractID: Primary key for the Contracts table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- TeamID: References TeamID in Teams table. Range depends on number of teams.
-- -- StartDate: Start date of the contract. Range from 1950 to present.
-- -- EndDate: End date of the contract. Range from 1950 to future, always after StartDate.
-- -- AnnualSalary: Annual salary in dollars. Range 10000-50000000, log-normally distributed.
-- - Relationships:
-- -- (Contracts.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (Contracts.TeamID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.Contracts.txt 
-- ContractID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- TeamID: INTEGER FROM 1 TO 7 like [None, 7, 6, 5, 4, 3, 2, 1]
-- StartDate: TEXT FROM 2015-12-01 TO 2020-04-01 like ['2020-01-01', '2020-04-01', '2020-03-20', '2019-03-20', '2018-07-10', '2018-07-01', '2017-07-01', '2015-12-01']
-- EndDate: TEXT FROM 2020-12-31 TO 2030-03-19 like ['2020-12-31', '2022-06-30', '2030-03-19', '2025-06-30', '2023-03-31', '2022-03-19', '2021-11-30']
-- AnnualSalary: INTEGER FROM 1400000 TO 300000000 like [300000000, 106300000, 62300000, 37436858, 35541667, 31000000, 25000000, 15000000, 8700000, 1400000]
-- 
