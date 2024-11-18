CREATE TABLE [CustomerCustomerDemo](
   [CustomerID]TEXT NOT NULL,
   [CustomerTypeID]TEXT NOT NULL,
   PRIMARY KEY ("CustomerID","CustomerTypeID"),
   FOREIGN KEY ([CustomerID]) REFERENCES [Customers] ([CustomerID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([CustomerTypeID]) REFERENCES [CustomerDemographics] ([CustomerTypeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="CustomerCustomerDemo">
-- - Description: Mapping table between customers and customer demographics.
-- - Data:
-- -- (No business data columns)
-- - Relationships:
-- -- (CustomerCustomerDemo.CustomerID → Customers.CustomerID) - Table containing customer information
-- -- (CustomerCustomerDemo.CustomerTypeID → CustomerDemographics.CustomerTypeID) - Table containing customer demographic information
-- </METADATA>

-- File: northwind.CustomerCustomerDemo.txt 
-- CustomerID: TEXT has only NULL values
-- CustomerTypeID: TEXT has only NULL values
-- 
