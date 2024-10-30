CREATE VIEW [Sales Totals by Amount] AS
SELECT [Order Subtotals].Subtotal AS SaleAmount, 
                  Orders.OrderID, 
               Customers.CompanyName, 
                  Orders.ShippedDate
FROM Customers 
 JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    JOIN [Order Subtotals] ON Orders.OrderID = [Order Subtotals].OrderID 
WHERE ([Order Subtotals].Subtotal >2500) 
AND (Orders.ShippedDate BETWEEN DATETIME('1997-01-01') And DATETIME('1997-12-31'))
/* "Sales Totals by Amount"(SaleAmount,OrderID,CompanyName,ShippedDate) */;

-- 

-- File: northwind.Sales Totals by Amount.txt 
-- SaleAmount: has all NULL values
-- OrderID: INTEGER has only NULL values
-- CompanyName: TEXT has only NULL values
-- ShippedDate: DATETIME has only NULL values
-- 
