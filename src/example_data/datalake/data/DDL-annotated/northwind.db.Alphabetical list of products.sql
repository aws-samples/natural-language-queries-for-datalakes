CREATE VIEW [Alphabetical list of products] 
AS
SELECT Products.*, 
       Categories.CategoryName
FROM Categories 
   INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
/* "Alphabetical list of products"(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,CategoryName) */;

-- 

-- File: northwind.Alphabetical list of products.txt 
-- ProductID: INTEGER FROM 1 TO 77 like [1, 2, 3, 4, 6, 7, 8, 10, 11, 12]
-- ProductName: TEXT FROM Aniseed Syrup TO Zaanse koeken like ['Zaanse koeken', 'Wimmers gute Semmelknödel', 'Vegie-spread', 'Valkoinen suklaa', "Uncle Bob's Organic Dried Pears", 'Tunnbröd', 'Tourtière', 'Tofu', 'Teatime Chocolate Biscuits', 'Tarte au sucre']
-- SupplierID: INTEGER FROM 1 TO 29 like [8, 7, 23, 17, 16, 15, 14, 12, 11, 6]
-- CategoryID: INTEGER FROM 1 TO 8 like [3, 8, 2, 1, 4, 5, 7, 6]
-- QuantityPerUnit: TEXT FROM 1 kg pkg. TO 750 cc per bottle like ['24 - 12 oz bottles', '5 kg pkg.', '24 - 250 g pkgs.', '24 - 200 g pkgs.', '10 - 500 g pkgs.', '750 cc per bottle', '500 ml', '500 g', '50 - 300 g pkgs.', '48 pies']
-- UnitPrice: NUMERIC FROM 2.5 TO 263.5 like [18, 14, 10, 43.9, 38, 21, 19, 15, 12.5, 9.5]
-- UnitsInStock: INTEGER FROM 0 TO 125 like [17, 15, 112, 76, 39, 36, 26, 24, 22, 21]
-- UnitsOnOrder: INTEGER FROM 0 TO 100 like [0, 70, 10, 40, 100, 80, 60, 50, 30, 20]
-- ReorderLevel: INTEGER FROM 0 TO 30 like [0, 25, 15, 30, 20, 5, 10]
-- Discontinued: TEXT FROM 0 TO 0 like ['0']
-- CategoryName: TEXT FROM Beverages TO Seafood like ['Confections', 'Seafood', 'Condiments', 'Beverages', 'Dairy Products', 'Grains/Cereals', 'Produce', 'Meat/Poultry']
-- 
