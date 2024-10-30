CREATE TABLE Bets ( -- This table contains information about sports bets
    BetID INTEGER PRIMARY KEY,
    CustomerID INTEGER, -- References CustomerID in Customers table. Range depends on number of customers.
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    BetType TEXT, -- Type of bet (e.g., "Win", "Over/Under", "Spread"). 10-20 distinct values.
    BetAmount DECIMAL(10,2), -- Amount of the bet in dollars. Range 1-10000, log-normally distributed.
    Odds DECIMAL(10,2), -- Betting odds. Range typically 1.01 to 1000.00.
    Outcome TEXT -- Outcome of the bet ("Win", "Loss", "Push"). 3 distinct values.
);
-- JOIN GRAPH: "Bets": ["Customers", "Games"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Bets">
-- - Description: This table contains information about sports bets
-- - Data:
-- -- BetID: Primary key for the Bets table
-- -- CustomerID: References CustomerID in Customers table. Range depends on number of customers.
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- BetType: Type of bet (e.g., "Win", "Over/Under", "Spread"). 10-20 distinct values.
-- -- BetAmount: Amount of the bet in dollars. Range 1-10000, log-normally distributed.
-- -- Odds: Betting odds. Range typically 1.01 to 1000.00.
-- -- Outcome: Outcome of the bet ("Win", "Loss", "Push"). 3 distinct values.
-- - Relationships:
-- -- (Bets.CustomerID → Customers.CustomerID) - Table containing information about ticket customers
-- -- (Bets.GameID → Games.GameID) - Table containing information about individual games or matches
-- </METADATA>
-- 

-- File: mysports.Bets.txt 
-- BetID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- CustomerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- BetType: TEXT FROM Over/Under TO Win like ['Win', 'Spread', 'Over/Under']
-- BetAmount: INTEGER FROM 50 TO 200 like [200, 150, 120, 110, 100, 90, 80, 75, 60, 50]
-- Odds: NUMERIC FROM 1.7 TO 2.2 like [2.2, 2.15, 2.1, 2.05, 1.95, 1.9, 1.85, 1.8, 1.75, 1.7]
-- Outcome: TEXT FROM Loss TO Win like ['Win', 'Loss', 'Push']
-- 
