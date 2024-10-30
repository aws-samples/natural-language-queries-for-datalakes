CREATE TABLE [Products](
   [ProductID]INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   [ProductName]TEXT NOT NULL,
   [SupplierID]INTEGER,
   [CategoryID]INTEGER,
   [QuantityPerUnit]TEXT,
   [UnitPrice]NUMERIC DEFAULT 0,
   [UnitsInStock]INTEGER DEFAULT 0,
   [UnitsOnOrder]INTEGER DEFAULT 0,
   [ReorderLevel]INTEGER DEFAULT 0,
   [Discontinued]TEXT NOT NULL DEFAULT '0',
    CHECK ([UnitPrice]>=(0)),
    CHECK ([ReorderLevel]>=(0)),
    CHECK ([UnitsInStock]>=(0)),
    CHECK ([UnitsOnOrder]>=(0)),
        FOREIGN KEY ([CategoryID]) REFERENCES [Categories] ([CategoryID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([SupplierID]) REFERENCES [Suppliers] ([SupplierID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Products">
-- - Description: Information about products sold by the company.
-- - Data:
-- -- ProductName: Name of the product
-- -- SupplierID: Unique identifier of the supplier for the product
-- -- CategoryID: Unique identifier of the category for the product
-- -- QuantityPerUnit: Quantity per unit of measurement for the product
-- -- UnitPrice: Price per unit of the product
-- -- UnitsInStock: Current quantity of the product in stock
-- -- UnitsOnOrder: Quantity of the product currently on order
-- -- ReorderLevel: Minimum quantity of the product to trigger a reorder
-- -- Discontinued: Flag indicating whether the product is discontinued (1) or not (0)
-- - Relationships:
-- -- (Products.CategoryID → Categories.CategoryID) - Table containing category information
-- -- (Products.SupplierID → Suppliers.SupplierID) - Table containing supplier information
-- </METADATA>

-- File: northwind.Products.txt 
-- ProductID: INTEGER FROM 1 TO 77 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- ProductName: TEXT FROM Alice Mutton TO Zaanse koeken like ['Zaanse koeken', 'Wimmers gute Semmelknödel', 'Vegie-spread', 'Valkoinen suklaa', "Uncle Bob's Organic Dried Pears", 'Tunnbröd', 'Tourtière', 'Tofu', 'Thüringer Rostbratwurst', 'Teatime Chocolate Biscuits']
-- SupplierID: INTEGER FROM 1 TO 29 like [12, 7, 8, 2, 24, 23, 20, 17, 16, 15]
-- CategoryID: INTEGER FROM 1 TO 8 like [3, 8, 2, 1, 4, 5, 6, 7]
-- QuantityPerUnit: TEXT FROM 1 kg pkg. TO 750 cc per bottle like ['24 - 12 oz bottles', '5 kg pkg.', '24 - 250 g pkgs.', '24 - 200 g pkgs.', '10 - 500 g pkgs.', '750 cc per bottle', '500 ml', '500 g', '50 bags x 30 sausgs.', '50 - 300 g pkgs.']
-- UnitPrice: NUMERIC FROM 2.5 TO 263.5 like [18, 14, 10, 43.9, 38, 21, 19, 15, 12.5, 9.5]
-- UnitsInStock: INTEGER FROM 0 TO 125 like [0, 26, 17, 15, 20, 112, 76, 39, 36, 29]
-- UnitsOnOrder: INTEGER FROM 0 TO 100 like [0, 70, 10, 40, 100, 80, 60, 50, 30, 20]
-- ReorderLevel: INTEGER FROM 0 TO 30 like [0, 25, 15, 30, 20, 5, 10]
-- Discontinued: TEXT FROM 0 TO 1 like ['0', '1']
-- 
