CREATE TABLE SponsorshipDeals ( -- This table contains information about sponsorship deals
    DealID INTEGER PRIMARY KEY,
    SponsorID INTEGER, -- References SponsorID in Sponsors table. Range depends on number of sponsors.
    EntityID INTEGER, -- References ID of sponsored entity (could be TeamID, PlayerID, or TournamentID).
    EntityType TEXT, -- Type of sponsored entity ("Team", "Player", "Tournament"). 3 distinct values.
    StartDate DATE, -- Start date of the sponsorship deal. Range from 1950 to present.
    EndDate DATE, -- End date of the sponsorship deal. Range from 1950 to future, or NULL if ongoing.
    DealValue DECIMAL(15,2) -- Annual value of the deal in dollars. Range 10000-100000000, log-normally distributed.
);
-- JOIN GRAPH: "SponsorshipDeals": ["Sponsors", "Teams", "Players", "Tournaments"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SponsorshipDeals">
-- - Description: This table contains information about sponsorship deals
-- - Data:
-- -- DealID: Primary key for the SponsorshipDeals table
-- -- SponsorID: References SponsorID in Sponsors table. Range depends on number of sponsors.
-- -- EntityID: References ID of sponsored entity (could be TeamID, PlayerID, or TournamentID).
-- -- EntityType: Type of sponsored entity ("Team", "Player", "Tournament"). 3 distinct values.
-- -- StartDate: Start date of the sponsorship deal. Range from 1950 to present.
-- -- EndDate: End date of the sponsorship deal. Range from 1950 to future, or NULL if ongoing.
-- -- DealValue: Annual value of the deal in dollars. Range 10000-100000000, log-normally distributed.
-- - Relationships:
-- -- (SponsorshipDeals.SponsorID → Sponsors.SponsorID) - Table containing information about sports sponsors
-- -- (SponsorshipDeals.EntityID → Teams.TeamID) - Table containing information about sports teams (when EntityType is "Team")
-- -- (SponsorshipDeals.EntityID → Players.PlayerID) - Table containing information about individual players (when EntityType is "Player")
-- -- (SponsorshipDeals.EntityID → Tournaments.TournamentID) - Table containing information about sports tournaments (when EntityType is "Tournament")
-- </METADATA>
-- 

-- File: mysports.SponsorshipDeals.txt 
-- DealID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- SponsorID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- EntityID: INTEGER FROM 1 TO 7 like [4, 3, 2, 1, 7, 5]
-- EntityType: TEXT FROM Player TO Tournament like ['Tournament', 'Team', 'Player']
-- StartDate: TEXT FROM 2018-07-01 TO 2021-01-01 like ['2021-01-01', '2020-01-01', '2020-09-01', '2020-05-01', '2019-06-01', '2019-03-01', '2019-01-01', '2018-07-01']
-- EndDate: TEXT FROM 2022-06-30 TO 2025-12-31 like ['2024-12-31', '2025-12-31', '2024-08-31', '2024-04-30', '2023-12-31', '2023-05-31', '2023-02-28', '2022-12-31', '2022-06-30']
-- DealValue: INTEGER FROM 20000000 TO 100000000 like [100000000, 80000000, 75000000, 60000000, 50000000, 40000000, 35000000, 30000000, 25000000, 20000000]
-- 
