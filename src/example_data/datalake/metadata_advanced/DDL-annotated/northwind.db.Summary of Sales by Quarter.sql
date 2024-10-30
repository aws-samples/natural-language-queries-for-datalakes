CREATE VIEW [Summary of Sales by Quarter] AS
SELECT Orders.ShippedDate, 
       Orders.OrderID, 
       [Order Subtotals].Subtotal
FROM Orders 
     INNER JOIN [Order Subtotals] ON Orders.OrderID = [Order Subtotals].OrderID
WHERE Orders.ShippedDate IS NOT NULL
/* "Summary of Sales by Quarter"(ShippedDate,OrderID,Subtotal) */;

-- 

-- File: northwind.Summary of Sales by Quarter.txt 
-- ShippedDate: TEXT FROM 2012-07-13 21:20:47 TO 2023-11-19 02:55:24 like ['2018-04-10', '2018-03-18', '2018-05-01', '2018-04-24', '2018-04-08', '2018-01-30', '2018-01-23', '2018-05-04', '2018-04-20', '2018-04-02']
-- OrderID: INTEGER FROM 10248 TO 26529 like [26529, 26528, 26527, 26526, 26525, 26524, 26523, 26522, 26521, 26520]
-- Subtotal: NUMERIC FROM 12.5 TO 73431.42 like [360.0, 720.0, 330.0, 210.0, 150.0, 1584.0, 911.9999999999999, 684.0, 588.0, 585.0]
-- 
