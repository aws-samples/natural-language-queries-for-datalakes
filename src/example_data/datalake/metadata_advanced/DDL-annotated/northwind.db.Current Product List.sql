CREATE VIEW [Current Product List] 
AS
SELECT ProductID,
       ProductName 
FROM Products 
WHERE Discontinued=0
/* "Current Product List"(ProductID,ProductName) */;

-- 

-- File: northwind.Current Product List.txt 
-- ProductID: INTEGER FROM 1 TO 77 like [1, 2, 3, 4, 6, 7, 8, 10, 11, 12]
-- ProductName: TEXT FROM Aniseed Syrup TO Zaanse koeken like ['Zaanse koeken', 'Wimmers gute Semmelknödel', 'Vegie-spread', 'Valkoinen suklaa', "Uncle Bob's Organic Dried Pears", 'Tunnbröd', 'Tourtière', 'Tofu', 'Teatime Chocolate Biscuits', 'Tarte au sucre']
-- 
