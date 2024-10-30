CREATE VIEW [Product Sales for 1997] AS
SELECT Categories.CategoryName, 
       Products.ProductName, 
       Sum(([Order Details].UnitPrice*Quantity*(1-Discount)/100)*100) AS ProductSales
FROM Categories
 JOIN    Products On Categories.CategoryID = Products.CategoryID
    JOIN  [Order Details] on Products.ProductID = [Order Details].ProductID     
     JOIN  [Orders] on Orders.OrderID = [Order Details].OrderID 
WHERE Orders.ShippedDate Between DATETIME('1997-01-01') And DATETIME('1997-12-31')
GROUP BY Categories.CategoryName, Products.ProductName
/* "Product Sales for 1997"(CategoryName,ProductName,ProductSales) */;

-- 

-- File: northwind.Product Sales for 1997.txt 
-- CategoryName: TEXT has only NULL values
-- ProductName: TEXT has only NULL values
-- ProductSales: has all NULL values
-- 
