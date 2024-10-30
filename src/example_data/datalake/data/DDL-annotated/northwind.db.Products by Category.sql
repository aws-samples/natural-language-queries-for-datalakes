CREATE VIEW [Products by Category] AS
SELECT Categories.CategoryName, 
       Products.ProductName, 
       Products.QuantityPerUnit, 
       Products.UnitsInStock, 
       Products.Discontinued
FROM Categories 
     INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Products.Discontinued <> 1
/* "Products by Category"(CategoryName,ProductName,QuantityPerUnit,UnitsInStock,Discontinued) */;

-- 

-- File: northwind.Products by Category.txt 
-- CategoryName: TEXT FROM Beverages TO Seafood like ['Confections', 'Seafood', 'Condiments', 'Beverages', 'Dairy Products', 'Grains/Cereals', 'Produce', 'Meat/Poultry']
-- ProductName: TEXT FROM Aniseed Syrup TO Zaanse koeken like ['Zaanse koeken', 'Wimmers gute Semmelknödel', 'Vegie-spread', 'Valkoinen suklaa', "Uncle Bob's Organic Dried Pears", 'Tunnbröd', 'Tourtière', 'Tofu', 'Teatime Chocolate Biscuits', 'Tarte au sucre']
-- QuantityPerUnit: TEXT FROM 1 kg pkg. TO 750 cc per bottle like ['24 - 12 oz bottles', '5 kg pkg.', '24 - 250 g pkgs.', '24 - 200 g pkgs.', '10 - 500 g pkgs.', '750 cc per bottle', '500 ml', '500 g', '50 - 300 g pkgs.', '48 pies']
-- UnitsInStock: INTEGER FROM 0 TO 125 like [17, 15, 112, 76, 39, 36, 26, 24, 22, 21]
-- Discontinued: TEXT FROM 0 TO 0 like ['0']
-- 
