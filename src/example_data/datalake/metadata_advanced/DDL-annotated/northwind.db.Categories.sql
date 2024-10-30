CREATE TABLE [Categories]
(      [CategoryID] INTEGER PRIMARY KEY AUTOINCREMENT,
       [CategoryName] TEXT,
       [Description] TEXT,
       [Picture] BLOB
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Categories">
-- - Description: Categories for grouping and classifying products.
-- - Data:
-- -- CategoryName: Name of the product category
-- -- Description: Detailed description of the product category
-- -- Picture: Binary image data representing the category
-- </METADATA>

-- File: northwind.Categories.txt 
-- CategoryID: INTEGER FROM 1 TO 8 like [1, 2, 3, 4, 5, 6, 7, 8]
-- CategoryName: TEXT FROM Beverages TO Seafood like ['Seafood', 'Produce', 'Meat/Poultry', 'Grains/Cereals', 'Dairy Products', 'Confections', 'Condiments', 'Beverages']
-- Description: TEXT FROM Breads, crackers, pasta, and cereal TO Sweet and savory sauces, relishes, spreads, and seasonings like ['Sweet and savory sauces, relishes, spreads, and seasonings', 'Soft drinks, coffees, teas, beers, and ales', 'Seaweed and fish', 'Prepared meats', 'Dried fruit and bean curd', 'Desserts, candies, and sweet breads', 'Cheeses', 'Breads, crackers, pasta, and cereal']
-- Picture: BLOB contains binary data
-- 
