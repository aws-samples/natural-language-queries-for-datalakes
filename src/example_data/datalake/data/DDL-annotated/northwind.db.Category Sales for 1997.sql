CREATE VIEW [Category Sales for 1997] AS
SELECT     [Product Sales for 1997].CategoryName, 
       Sum([Product Sales for 1997].ProductSales) AS CategorySales
FROM [Product Sales for 1997]
GROUP BY [Product Sales for 1997].CategoryName
/* "Category Sales for 1997"(CategoryName,CategorySales) */;

-- 

-- File: northwind.Category Sales for 1997.txt 
-- CategoryName: TEXT has only NULL values
-- CategorySales: has all NULL values
-- 
