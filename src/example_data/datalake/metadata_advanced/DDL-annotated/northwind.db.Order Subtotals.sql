CREATE VIEW [Order Subtotals] AS
SELECT [Order Details].OrderID, 
Sum(([Order Details].UnitPrice*Quantity*(1-Discount)/100)*100) AS Subtotal
FROM [Order Details]
GROUP BY [Order Details].OrderID
/* "Order Subtotals"(OrderID,Subtotal) */;

-- 

-- File: northwind.Order Subtotals.txt 
-- OrderID: INTEGER FROM 10248 TO 26529 like [26529, 26528, 26527, 26526, 26525, 26524, 26523, 26522, 26521, 26520]
-- Subtotal: NUMERIC FROM 12.5 TO 73431.42 like [360.0, 720.0, 330.0, 210.0, 150.0, 1584.0, 911.9999999999999, 684.0, 588.0, 585.0]
-- 
