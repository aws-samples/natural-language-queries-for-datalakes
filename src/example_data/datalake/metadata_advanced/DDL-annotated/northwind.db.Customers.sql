CREATE TABLE [Customers]
(      [CustomerID] TEXT,
       [CompanyName] TEXT,
       [ContactName] TEXT,
       [ContactTitle] TEXT,
       [Address] TEXT,
       [City] TEXT,
       [Region] TEXT,
       [PostalCode] TEXT,
       [Country] TEXT,
       [Phone] TEXT,
       [Fax] TEXT,
       PRIMARY KEY (`CustomerID`)
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Customers">
-- - Description: Information about customers who purchase products.
-- - Data:
-- -- CompanyName: Name of the customer's company
-- -- ContactName: Name of the contact person at the customer's company
-- -- ContactTitle: Job title of the contact person
-- -- Address: Street address of the customer
-- -- City: City where the customer is located
-- -- Region: Regional area where the customer is located
-- -- PostalCode: Postal code of the customer's address
-- -- Country: Country where the customer is located
-- -- Phone: Phone number of the customer
-- -- Fax: Fax number of the customer
-- </METADATA>

-- File: northwind.Customers.txt 
-- CustomerID: TEXT FROM ALFKI TO WOLZA like ['ALFKI', 'ANATR', 'ANTON', 'AROUT', 'BERGS', 'BLAUS', 'BLONP', 'BOLID', 'BONAP', 'BOTTM']
-- CompanyName: TEXT FROM Alfreds Futterkiste TO Wolski  Zajazd like ['IT', 'Wolski  Zajazd', 'Wilman Kala', 'White Clover Markets', 'Wellington Importadora', 'Wartian Herkku', 'Vins et alcools Chevalier', 'Victuailles en stock', 'Vaffeljernet', "Trail's Head Gourmet Provisioners"]
-- ContactName: TEXT FROM Alejandra Camino TO Zbyszek Piestrzeniewicz like ['Zbyszek Piestrzeniewicz', 'Yvonne Moncada', 'Yoshi Tannamuri', 'Yoshi Latimer', 'Yang Wang', 'Victoria Ashworth', 'Valon Hoti', 'Val2', 'Thomas Hardy', 'Sven Ottlieb']
-- ContactTitle: TEXT FROM Accounting Manager TO Sales Representative like ['Sales Representative', 'Owner', 'Marketing Manager', 'Sales Manager', 'Accounting Manager', 'Sales Associate', 'Marketing Assistant', 'Sales Agent', 'Order Administrator', 'IT']
-- Address: TEXT FROM 1 rue Alsace-Lorraine TO Åkergatan 24 like [None, 'Åkergatan 24', 'ul. Filtrowa 68', 'Walserweg 21', 'Vinbæltet 34', 'Via Monte Bianco 34', 'Via Ludovico il Moro 22', 'Torikatu 38', 'Taucherstraße 10', 'Strada Provinciale 124']
-- City: TEXT FROM Aachen TO Århus like ['London', 'México D.F.', 'Sao Paulo', 'Rio de Janeiro', 'Madrid', 'Buenos Aires', 'Portland', 'Paris', 'Nantes', 'Lisboa']
-- Region: TEXT FROM British Isles TO Western Europe like ['Western Europe', 'South America', 'North America', 'Southern Europe', 'British Isles', 'Central America', 'Northern Europe', 'Scandinavia', None, 'Eastern Europe']
-- PostalCode: TEXT FROM 01-012 TO WX3 6FW like ['1010', None, '44000', '05033', 'WX3 6FW', 'WX1 6LT', 'WA1 1DP', 'V3F 2K1', 'T2F 8M4', 'SW7 1RZ']
-- Country: TEXT FROM Argentina TO Venezuela like ['USA', 'Germany', 'France', 'Brazil', 'UK', 'Spain', 'Mexico', 'Venezuela', 'Italy', 'Canada']
-- Phone: TEXT FROM (02) 201 24 67 TO 981-443655 like [None, '981-443655', '91.24.45.40', '90-224 8858', '88.60.15.31', '86 21 32 43', '78.32.54.86', '7675-3425', '6562-9722', '61.77.61.10']
-- Fax: TEXT FROM (02) 201 24 68 TO 981-443655 like [None, '981-443655', '91.24.45.41', '90-224 8858', '88.60.15.32', '86 22 33 44', '78.32.54.87', '7675-3426', '6562-9723', '61.77.61.11']
-- 
