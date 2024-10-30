CREATE TABLE [Shippers](
   [ShipperID]INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   [CompanyName]TEXT NOT NULL,
   [Phone]TEXT
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Shippers">
-- - Description: Information about shipping companies used for order deliveries.
-- - Data:
-- -- CompanyName: Name of the shipping company
-- -- Phone: Phone number of the shipping company
-- </METADATA>

-- File: northwind.Shippers.txt 
-- ShipperID: INTEGER FROM 1 TO 3 like [1, 2, 3]
-- CompanyName: TEXT FROM Federal Shipping TO United Package like ['United Package', 'Speedy Express', 'Federal Shipping']
-- Phone: TEXT FROM (503) 555-3199 TO (503) 555-9931 like ['(503) 555-9931', '(503) 555-9831', '(503) 555-3199']
-- 
