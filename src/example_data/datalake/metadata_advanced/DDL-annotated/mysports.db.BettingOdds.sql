CREATE TABLE BettingOdds ( -- This table contains betting odds for games
    OddsID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    ProviderID INTEGER, -- References ProviderID in SportsBettingProviders table. Range depends on number of providers.
    HomeTeamOdds FLOAT, -- Odds for home team winning. Range 1.01-20.00, log-normally distributed.
    AwayTeamOdds FLOAT, -- Odds for away team winning. Range 1.01-20.00, log-normally distributed.
    DrawOdds FLOAT -- Odds for a draw (if applicable). Range 1.01-20.00, log-normally distributed.
);
-- JOIN GRAPH: "BettingOdds": ["Games", "SportsBettingProviders"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BettingOdds">
-- - Description: This table contains betting odds for games
-- - Data:
-- -- OddsID: Primary key for the BettingOdds table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- ProviderID: References ProviderID in SportsBettingProviders table. Range depends on number of providers.
-- -- HomeTeamOdds: Odds for home team winning. Range 1.01-20.00, log-normally distributed.
-- -- AwayTeamOdds: Odds for away team winning. Range 1.01-20.00, log-normally distributed.
-- -- DrawOdds: Odds for a draw (if applicable). Range 1.01-20.00, log-normally distributed.
-- - Relationships:
-- -- (BettingOdds.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (BettingOdds.ProviderID → SportsBettingProviders.ProviderID) - Table containing information about sports betting providers
-- </METADATA>
-- 

-- File: mysports.BettingOdds.txt 
-- OddsID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- ProviderID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamOdds: NUMERIC FROM 1.55 TO 2.2 like [2.2, 2.05, 2.0, 1.95, 1.9, 1.85, 1.8, 1.75, 1.65, 1.55]
-- AwayTeamOdds: NUMERIC FROM 1.75 TO 2.6 like [2.6, 2.35, 2.25, 2.15, 2.1, 2.0, 1.95, 1.9, 1.85, 1.75]
-- DrawOdds: NUMERIC FROM 3.5 TO 3.8 like [None, 3.8, 3.6, 3.5]
-- 
