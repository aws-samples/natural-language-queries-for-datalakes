CREATE TABLE [Order Details](
   [OrderID]INTEGER NOT NULL,
   [ProductID]INTEGER NOT NULL,
   [UnitPrice]NUMERIC NOT NULL DEFAULT 0,
   [Quantity]INTEGER NOT NULL DEFAULT 1,
   [Discount]REAL NOT NULL DEFAULT 0,
    PRIMARY KEY ("OrderID","ProductID"),
    CHECK ([Discount]>=(0) AND [Discount]<=(1)),
    CHECK ([Quantity]>(0)),
    CHECK ([UnitPrice]>=(0)),
        FOREIGN KEY ([OrderID]) REFERENCES [Orders] ([OrderID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([ProductID]) REFERENCES [Products] ([ProductID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Order Details">
-- - Description: Details of products ordered, including quantities and prices.
-- - Data:
-- -- UnitPrice: Price per unit of the product
-- -- Quantity: Quantity of the product ordered
-- -- Discount: Discount percentage applied to the product
-- - Relationships:
-- -- (Order Details.OrderID → Orders.OrderID) - Table containing order information
-- -- (Order Details.ProductID → Products.ProductID) - Table containing product information
-- </METADATA>

-- File: northwind.Order Details.txt 
-- OrderID: INTEGER FROM 10248 TO 26529 like [11188, 11281, 11411, 11484, 11485, 11495, 11526, 11532, 11539, 11681]
-- ProductID: INTEGER FROM 1 TO 77 like [66, 19, 70, 26, 20, 69, 59, 57, 13, 31]
-- UnitPrice: INTEGER FROM 2 TO 263.5 like [18, 14, 10, 15, 19, 21, 38, 12.5, 43.9, 9.5]
-- Quantity: INTEGER FROM 1 TO 130 like [20, 10, 30, 48, 35, 50, 15, 18, 9, 49]
-- Discount: NUMERIC FROM 0.0 TO 0.25 like [0.0, 0.05, 0.1, 0.2, 0.15, 0.25, 0.03, 0.02, 0.06, 0.04]
-- 
