CREATE VIEW [Sales by Category] AS
SELECT Categories.CategoryID, 
       Categories.CategoryName, 
         Products.ProductName, 
        Sum([Order Details Extended].ExtendedPrice) AS ProductSales
FROM  Categories 
    JOIN Products 
      ON Categories.CategoryID = Products.CategoryID
       JOIN [Order Details Extended] 
         ON Products.ProductID = [Order Details Extended].ProductID                
           JOIN Orders 
             ON Orders.OrderID = [Order Details Extended].OrderID 
WHERE Orders.OrderDate BETWEEN DATETIME('1997-01-01') And DATETIME('1997-12-31')
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
/* "Sales by Category"(CategoryID,CategoryName,ProductName,ProductSales) */;

-- 

-- File: northwind.Sales by Category.txt 
-- CategoryID: INTEGER has only NULL values
-- CategoryName: TEXT has only NULL values
-- ProductName: TEXT has only NULL values
-- ProductSales: has all NULL values
-- 
