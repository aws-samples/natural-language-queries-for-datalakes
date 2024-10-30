CREATE TABLE [Territories](
   [TerritoryID]TEXT NOT NULL,
   [TerritoryDescription]TEXT NOT NULL,
   [RegionID]INTEGER NOT NULL,
    PRIMARY KEY ("TerritoryID"),
        FOREIGN KEY ([RegionID]) REFERENCES [Regions] ([RegionID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Territories">
-- - Description: Geographic territories for sales and distribution.
-- - Data:
-- -- TerritoryDescription: Description of the geographic territory
-- - Relationships:
-- -- (Territories.RegionID → Regions.RegionID) - Table containing region information
-- </METADATA>

-- File: northwind.Territories.txt 
-- TerritoryID: TEXT FROM 01581 TO 98104 like ['01581', '01730', '01833', '02116', '02139', '02184', '02903', '03049', '03801', '06897']
-- TerritoryDescription: TEXT FROM Atlanta TO Wilton like ['New York', 'Wilton', 'Westboro', 'Troy', 'Tampa', 'Southfield', 'Seattle', 'Scottsdale', 'Savannah', 'Santa Monica']
-- RegionID: INTEGER FROM 1 TO 4 like [1, 2, 3, 4]
-- 
