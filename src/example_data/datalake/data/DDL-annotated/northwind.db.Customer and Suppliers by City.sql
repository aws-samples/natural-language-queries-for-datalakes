CREATE VIEW [Customer and Suppliers by City] 
AS
SELECT City, 
       CompanyName, 
       ContactName, 
       'Customers' AS Relationship 
FROM Customers
UNION 
SELECT City, 
       CompanyName, 
       ContactName, 
       'Suppliers'
FROM Suppliers 
ORDER BY City, CompanyName
/* "Customer and Suppliers by City"(City,CompanyName,ContactName,Relationship) */;

-- 

-- File: northwind.Customer and Suppliers by City.txt 
-- City: TEXT FROM Aachen TO Århus like ['London', 'México D.F.', 'Sao Paulo', 'Rio de Janeiro', 'Paris', 'Madrid', 'Buenos Aires', 'Portland', 'Nantes', 'Montréal']
-- CompanyName: TEXT FROM Alfreds Futterkiste TO Zaanse Snoepfabriek like ['IT', 'Zaanse Snoepfabriek', 'Wolski  Zajazd', 'Wilman Kala', 'White Clover Markets', 'Wellington Importadora', 'Wartian Herkku', 'Vins et alcools Chevalier', 'Victuailles en stock', 'Vaffeljernet']
-- ContactName: TEXT FROM Alejandra Camino TO Zbyszek Piestrzeniewicz like ['Zbyszek Piestrzeniewicz', 'Yvonne Moncada', 'Yoshi Tannamuri', 'Yoshi Nagase', 'Yoshi Latimer', 'Yang Wang', 'Wendy Mackenzie', 'Victoria Ashworth', 'Valon Hoti', 'Val2']
-- Relationship: TEXT FROM Customers TO Suppliers like ['Customers', 'Suppliers']
-- 
