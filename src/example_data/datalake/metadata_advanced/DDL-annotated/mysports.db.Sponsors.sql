CREATE TABLE Sponsors ( -- This table contains information about sports sponsors
    SponsorID INTEGER PRIMARY KEY,
    SponsorName TEXT NOT NULL, -- Name of the sponsor company. Many distinct values.
    Industry TEXT, -- Industry of the sponsor (e.g., "Technology", "Automotive"). 20-30 distinct values.
    Founded DATE -- Date when the sponsor company was founded. Range from 1800 to present.
);
-- JOIN GRAPH: "Sponsors": ["SponsorshipDeals"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Sponsors">
-- - Description: This table contains information about sports sponsors
-- - Data:
-- -- SponsorID: Primary key for the Sponsors table
-- -- SponsorName: Name of the sponsor company. Many distinct values.
-- -- Industry: Industry of the sponsor (e.g., "Technology", "Automotive"). 20-30 distinct values.
-- -- Founded: Date when the sponsor company was founded. Range from 1800 to present.
-- - Relationships:
-- -- (Sponsors.SponsorID → SponsorshipDeals.SponsorID) - Table containing information about sponsorship deals
-- </METADATA>
-- 

-- File: mysports.Sponsors.txt 
-- SponsorID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- SponsorName: TEXT FROM Adidas TO Visa like ['Visa', 'Toyota', 'Samsung', 'Rolex', 'Red Bull', 'Nike', 'Heineken', 'Emirates', 'Coca-Cola', 'Adidas']
-- Industry: TEXT FROM Airlines TO Sportswear like ['Sportswear', 'Beverages', 'Luxury Watches', 'Financial Services', 'Energy Drinks', 'Electronics', 'Automotive', 'Airlines']
-- Founded: TEXT FROM 1864-02-15 TO 1987-04-01 like ['1987-04-01', '1985-03-25', '1964-01-25', '1958-09-18', '1949-08-18', '1938-03-01', '1937-08-28', '1905-11-15', '1886-05-08', '1864-02-15']
-- 
