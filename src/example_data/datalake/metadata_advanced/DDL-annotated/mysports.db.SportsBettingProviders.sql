CREATE TABLE SportsBettingProviders ( -- This table contains information about sports betting providers
    ProviderID INTEGER PRIMARY KEY,
    ProviderName TEXT NOT NULL, -- Name of the betting provider. 20-30 distinct values.
    FoundedYear INTEGER, -- Year the provider was founded. Range from 1950 to present.
    Headquarters TEXT -- Location of the provider's headquarters. Many distinct values.
);
-- JOIN GRAPH: "SportsBettingProviders": ["Bets"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SportsBettingProviders">
-- - Description: This table contains information about sports betting providers
-- - Data:
-- -- ProviderID: Primary key for the SportsBettingProviders table
-- -- ProviderName: Name of the betting provider. 20-30 distinct values.
-- -- FoundedYear: Year the provider was founded. Range from 1950 to present.
-- -- Headquarters: Location of the provider's headquarters. Many distinct values.
-- - Relationships:
-- -- (SportsBettingProviders.ProviderID → Bets.ProviderID) - Table containing information about sports bets
-- </METADATA>
-- 

-- File: mysports.SportsBettingProviders.txt 
-- ProviderID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- ProviderName: TEXT FROM 888sport TO William Hill like ['William Hill', 'Unibet', 'Paddy Power', 'Ladbrokes', 'FanDuel', 'DraftKings', 'Bwin', 'Betfair', 'Bet365', '888sport']
-- FoundedYear: INTEGER FROM 1886 TO 2012 like [2000, 1997, 2012, 2009, 2008, 1988, 1934, 1886]
-- Headquarters: TEXT FROM Boston, Massachusetts, USA TO Vienna, Austria like ['London, United Kingdom', 'Vienna, Austria', 'Stoke-on-Trent, United Kingdom', 'New York City, New York, USA', 'Malta', 'Gibraltar', 'Dublin, Ireland', 'Boston, Massachusetts, USA']
-- 
