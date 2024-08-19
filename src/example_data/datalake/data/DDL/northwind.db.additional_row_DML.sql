INSERT INTO Customers
(CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ANYCO1', 'Any Company 1', 'Company1 Contact', 'Sales Representative', 'Obere Str. 57', 'Berlin', 'Western Europe', '12209', 'Germany', '030-0074321', '030-0076545');

INSERT INTO Customers
(CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ANYCO2', 'Any Company 2', 'Company2 Contact', 'Sales Representative', 'Obere Str. 57', 'Berlin', 'Western Europe', '12209', 'Germany', '030-0074321', '030-0076545');

INSERT INTO Products
(ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(78, 'Any Product 1', 1, 8, '10 boxes x 20 bags', 18, 39, 0, 10, '0');

INSERT INTO Products
(ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(79, 'Any Product 2', 1, 2, '10 boxes x 20 bags', 18, 39, 0, 10, '0');

INSERT INTO Products
(ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(80, 'Any Product 3', 1, 3, '10 boxes x 20 bags', 20, 40, 0, 10, '0');

UPDATE [Order Details]
SET Discount = 0
WHERE ProductID IN (15,3);