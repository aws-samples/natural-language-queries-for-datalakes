CREATE TABLE Seasons ( -- This table contains information about sports seasons
    SeasonID INTEGER PRIMARY KEY,
    LeagueID INTEGER, -- References LeagueID in Leagues table. Range depends on number of leagues.
    StartDate DATE, -- Start date of the season. Typically in range 1950 to present.
    EndDate DATE -- End date of the season. Typically in range 1950 to present, always after StartDate.
);
-- JOIN GRAPH: "Seasons": ["Leagues", "Games", "TeamStats", "PlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Seasons">
-- - Description: This table contains information about sports seasons
-- - Data:
-- -- SeasonID: Primary key for the Seasons table
-- -- LeagueID: References LeagueID in Leagues table. Range depends on number of leagues.
-- -- StartDate: Start date of the season. Typically in range 1950 to present.
-- -- EndDate: End date of the season. Typically in range 1950 to present, always after StartDate.
-- - Relationships:
-- -- (Seasons.LeagueID → Leagues.LeagueID) - Table containing information about sports leagues
-- -- (Seasons.SeasonID → Games.SeasonID) - Table containing information about individual games or matches
-- -- (Seasons.SeasonID → TeamStats.SeasonID) - Table containing aggregated statistics for teams in a season
-- -- (Seasons.SeasonID → PlayerStats.SeasonID) - Table containing statistics for players
-- </METADATA>
-- 

-- File: mysports.Seasons.txt 
-- SeasonID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- LeagueID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- StartDate: TEXT FROM 2019-09-20 TO 2020-10-22 like ['2020-09-10', '2020-01-01', '2020-10-22', '2020-10-07', '2020-09-19', '2020-09-12', '2020-07-23', '2019-09-20']
-- EndDate: TEXT FROM 2019-11-02 TO 2021-09-05 like ['2021-09-05', '2021-07-22', '2021-07-07', '2021-05-23', '2021-02-07', '2020-12-31', '2020-11-22', '2020-11-10', '2020-10-27', '2019-11-02']
-- 
