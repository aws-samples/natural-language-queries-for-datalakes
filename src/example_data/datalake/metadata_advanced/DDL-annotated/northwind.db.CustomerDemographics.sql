CREATE TABLE [CustomerDemographics](
   [CustomerTypeID]TEXT NOT NULL,
   [CustomerDesc]TEXT,
    PRIMARY KEY ("CustomerTypeID")
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="CustomerDemographics">
-- - Description: Types of customer demographics.
-- - Data:
-- -- CustomerTypeID: Unique identifier for the customer demographic type
-- -- CustomerDesc: Description of the customer demographic type
-- </METADATA>

-- File: northwind.CustomerDemographics.txt 
-- CustomerTypeID: TEXT has only NULL values
-- CustomerDesc: TEXT has only NULL values
-- 
