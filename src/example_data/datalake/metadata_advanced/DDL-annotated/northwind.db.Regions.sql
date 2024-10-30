CREATE TABLE [Regions](
   [RegionID]INTEGER NOT NULL PRIMARY KEY,
   [RegionDescription]TEXT NOT NULL
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Regions">
-- - Description: Geographic regions used for grouping territories.
-- - Data:
-- -- RegionDescription: Description of the geographic region
-- </METADATA>

-- File: northwind.Regions.txt 
-- RegionID: INTEGER FROM 1 TO 4 like [1, 2, 3, 4]
-- RegionDescription: TEXT FROM Eastern TO Western like ['Western', 'Southern', 'Northern', 'Eastern']
-- 
