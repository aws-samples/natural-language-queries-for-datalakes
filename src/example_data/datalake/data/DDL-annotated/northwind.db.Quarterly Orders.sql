CREATE VIEW [Quarterly Orders] AS
SELECT DISTINCT Customers.CustomerID, 
                Customers.CompanyName, 
                Customers.City, 
                Customers.Country
FROM Customers 
     JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN DATETIME('1997-01-01') And DATETIME('1997-12-31')
/* "Quarterly Orders"(CustomerID,CompanyName,City,Country) */;

-- 

-- File: northwind.Quarterly Orders.txt 
-- CustomerID: TEXT has only NULL values
-- CompanyName: TEXT has only NULL values
-- City: TEXT has only NULL values
-- Country: TEXT has only NULL values
-- 
