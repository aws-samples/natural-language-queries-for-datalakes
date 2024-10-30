CREATE TABLE Merchandise (
    MerchandiseID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table
    PlayerID INTEGER, -- References PlayerID in Players table
    ItemType TEXT, -- Type of merchandise (e.g., "Jersey", "Cap", "Scarf")
    Price DECIMAL(10,2), -- Price of the item in dollars
    StockQuantity INTEGER -- Current stock quantity
);
-- JOIN GRAPH: "Merchandise": ["Teams", "Players"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Merchandise">
-- - Description: This table contains information about sports merchandise
-- - Data:
-- -- MerchandiseID: Primary key for the Merchandise table
-- -- TeamID: References TeamID in Teams table
-- -- PlayerID: References PlayerID in Players table
-- -- ItemType: Type of merchandise (e.g., "Jersey", "Cap", "Scarf")
-- -- Price: Price of the item in dollars
-- -- StockQuantity: Current stock quantity
-- - Relationships:
-- -- (Merchandise.TeamID → Teams.TeamID) - Table containing information about sports teams
-- -- (Merchandise.PlayerID → Players.PlayerID) - Table containing information about individual players
-- </METADATA>
-- 

-- File: mysports.Merchandise.txt 
-- MerchandiseID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- TeamID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- PlayerID: INTEGER FROM 1 TO 9 like [5, 2, 1, 9, 8, 7, 6]
-- ItemType: TEXT FROM Autographed Photo TO T-Shirt like ['T-Shirt', 'Scarf', 'Replica Ball', 'Poster', 'Keychain', 'Jersey', 'Hoodie', 'Cap', 'Bobblehead', 'Autographed Photo']
-- Price: NUMERIC FROM 4.99 TO 149.99 like [24.99, 149.99, 99.99, 69.99, 34.99, 29.99, 19.99, 9.99, 4.99]
-- StockQuantity: INTEGER FROM 1000 TO 25000 like [5000, 25000, 20000, 15000, 10000, 8000, 7500, 3000, 1000]
-- 
