CREATE TABLE Tickets ( -- This table contains information about ticket sales
    TicketID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    SeatNumber TEXT, -- Seat number (e.g., "A12", "B34"). Many distinct values.
    Price DECIMAL(10,2), -- Price of the ticket in dollars. Range 10-1000, log-normally distributed.
    PurchaseDate DATE, -- Date of ticket purchase. Range from past to future, clustered around game dates.
    CustomerID INTEGER -- References CustomerID in Customers table. Range depends on number of customers.
);
-- JOIN GRAPH: "Tickets": ["Games", "Customers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Tickets">
-- - Description: This table contains information about ticket sales
-- - Data:
-- -- TicketID: Primary key for the Tickets table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- SeatNumber: Seat number (e.g., "A12", "B34"). Many distinct values.
-- -- Price: Price of the ticket in dollars. Range 10-1000, log-normally distributed.
-- -- PurchaseDate: Date of ticket purchase. Range from past to future, clustered around game dates.
-- -- CustomerID: References CustomerID in Customers table. Range depends on number of customers.
-- - Relationships:
-- -- (Tickets.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (Tickets.CustomerID → Customers.CustomerID) - Table containing information about ticket customers
-- </METADATA>
-- 

-- File: mysports.Tickets.txt 
-- TicketID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- SeatNumber: TEXT FROM A12 TO J90 like ['J90', 'I78', 'H56', 'G34', 'F12', 'E90', 'D78', 'C56', 'B34', 'A12']
-- Price: INTEGER FROM 50 TO 200 like [200, 180, 160, 150, 120, 100, 90, 80, 75, 50]
-- PurchaseDate: TEXT FROM 2019-09-19 TO 2021-02-20 like ['2021-02-20', '2021-01-14', '2020-12-13', '2020-11-25', '2020-11-20', '2020-10-15', '2020-09-24', '2020-09-10', '2020-07-03', '2019-09-19']
-- CustomerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
