CREATE VIEW [Products Above Average Price] AS
SELECT Products.ProductName, 
       Products.UnitPrice
FROM Products
WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
/* "Products Above Average Price"(ProductName,UnitPrice) */;

-- 

-- File: northwind.Products Above Average Price.txt 
-- ProductName: TEXT FROM Alice Mutton TO Wimmers gute Semmelknödel like ['Wimmers gute Semmelknödel', 'Vegie-spread', "Uncle Bob's Organic Dried Pears", 'Thüringer Rostbratwurst', 'Tarte au sucre', "Sir Rodney's Marmalade", 'Schoggi Schokolade', 'Rössle Sauerkraut', 'Raclette Courdavault', 'Queso Manchego La Pastora']
-- UnitPrice: INTEGER FROM 30 TO 263.5 like [43.9, 38, 263.5, 123.79, 97, 81, 62.5, 55, 53, 49.3]
-- 
