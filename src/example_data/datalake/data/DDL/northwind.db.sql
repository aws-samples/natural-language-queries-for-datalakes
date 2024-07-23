CREATE TABLE [Categories]
(      [CategoryID] INTEGER PRIMARY KEY AUTOINCREMENT,
       [CategoryName] TEXT,
       [Description] TEXT,
       [Picture] BLOB
);

CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE [CustomerCustomerDemo](
   [CustomerID]TEXT NOT NULL,
   [CustomerTypeID]TEXT NOT NULL,
   PRIMARY KEY ("CustomerID","CustomerTypeID"),
   FOREIGN KEY ([CustomerID]) REFERENCES [Customers] ([CustomerID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([CustomerTypeID]) REFERENCES [CustomerDemographics] ([CustomerTypeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [CustomerDemographics](
   [CustomerTypeID]TEXT NOT NULL,
   [CustomerDesc]TEXT,
    PRIMARY KEY ("CustomerTypeID")
);

CREATE TABLE [Customers]
(      [CustomerID] TEXT,
       [CompanyName] TEXT,
       [ContactName] TEXT,
       [ContactTitle] TEXT,
       [Address] TEXT,
       [City] TEXT,
       [Region] TEXT,
       [PostalCode] TEXT,
       [Country] TEXT,
       [Phone] TEXT,
       [Fax] TEXT,
       PRIMARY KEY (`CustomerID`)
);

CREATE TABLE [Employees]
(      [EmployeeID] INTEGER PRIMARY KEY AUTOINCREMENT,
       [LastName] TEXT,
       [FirstName] TEXT,
       [Title] TEXT,
       [TitleOfCourtesy] TEXT,
       [BirthDate] DATE,
       [HireDate] DATE,
       [Address] TEXT,
       [City] TEXT,
       [Region] TEXT,
       [PostalCode] TEXT,
       [Country] TEXT,
       [HomePhone] TEXT,
       [Extension] TEXT,
       [Photo] BLOB,
       [Notes] TEXT,
       [ReportsTo] INTEGER,
       [PhotoPath] TEXT,
           FOREIGN KEY ([ReportsTo]) REFERENCES [Employees] ([EmployeeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [EmployeeTerritories](
   [EmployeeID]INTEGER NOT NULL,
   [TerritoryID]TEXT NOT NULL,
    PRIMARY KEY ("EmployeeID","TerritoryID"),
        FOREIGN KEY ([EmployeeID]) REFERENCES [Employees] ([EmployeeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([TerritoryID]) REFERENCES [Territories] ([TerritoryID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

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

CREATE TABLE [Orders](
   [OrderID]INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   [CustomerID]TEXT,
   [EmployeeID]INTEGER,
   [OrderDate]DATETIME,
   [RequiredDate]DATETIME,
   [ShippedDate]DATETIME,
   [ShipVia]INTEGER,
   [Freight]NUMERIC DEFAULT 0,
   [ShipName]TEXT,
   [ShipAddress]TEXT,
   [ShipCity]TEXT,
   [ShipRegion]TEXT,
   [ShipPostalCode]TEXT,
   [ShipCountry]TEXT,
   FOREIGN KEY ([EmployeeID]) REFERENCES [Employees] ([EmployeeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([CustomerID]) REFERENCES [Customers] ([CustomerID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([ShipVia]) REFERENCES [Shippers] ([ShipperID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

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

CREATE TABLE [Regions](
   [RegionID]INTEGER NOT NULL PRIMARY KEY,
   [RegionDescription]TEXT NOT NULL
);

CREATE TABLE [Shippers](
   [ShipperID]INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   [CompanyName]TEXT NOT NULL,
   [Phone]TEXT
);

CREATE TABLE [Suppliers](
   [SupplierID]INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   [CompanyName]TEXT NOT NULL,
   [ContactName]TEXT,
   [ContactTitle]TEXT,
   [Address]TEXT,
   [City]TEXT,
   [Region]TEXT,
   [PostalCode]TEXT,
   [Country]TEXT,
   [Phone]TEXT,
   [Fax]TEXT,
   [HomePage]TEXT
);

CREATE TABLE [Territories](
   [TerritoryID]TEXT NOT NULL,
   [TerritoryDescription]TEXT NOT NULL,
   [RegionID]INTEGER NOT NULL,
    PRIMARY KEY ("TerritoryID"),
        FOREIGN KEY ([RegionID]) REFERENCES [Regions] ([RegionID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE VIEW [Alphabetical list of products] 
AS
SELECT Products.*, 
       Categories.CategoryName
FROM Categories 
   INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
/* "Alphabetical list of products"(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,CategoryName) */;

CREATE VIEW [Current Product List] 
AS
SELECT ProductID,
       ProductName 
FROM Products 
WHERE Discontinued=0
/* "Current Product List"(ProductID,ProductName) */;

CREATE VIEW [Customer and Suppliers by City] 
AS
SELECT City, 
       CompanyName, 
       ContactName, 
       'Customers' AS Relationship 
FROM Customers
UNION 
SELECT City, 
       CompanyName, 
       ContactName, 
       'Suppliers'
FROM Suppliers 
ORDER BY City, CompanyName
/* "Customer and Suppliers by City"(City,CompanyName,ContactName,Relationship) */;

CREATE VIEW [Invoices] 
AS
SELECT Orders.ShipName,
       Orders.ShipAddress,
       Orders.ShipCity,
       Orders.ShipRegion, 
       Orders.ShipPostalCode,
       Orders.ShipCountry,
       Orders.CustomerID,
       Customers.CompanyName AS CustomerName, 
       Customers.Address,
       Customers.City,
       Customers.Region,
       Customers.PostalCode,
       Customers.Country,
       (Employees.FirstName + ' ' + Employees.LastName) AS Salesperson, 
       Orders.OrderID,
       Orders.OrderDate,
       Orders.RequiredDate,
       Orders.ShippedDate, 
       Shippers.CompanyName As ShipperName,
       [Order Details].ProductID,
       Products.ProductName, 
       [Order Details].UnitPrice,
       [Order Details].Quantity,
       [Order Details].Discount, 
       ((([Order Details].UnitPrice*Quantity*(1-Discount))/100)*100) AS ExtendedPrice,
       Orders.Freight 
FROM Customers 
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID  
    JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID    
     JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID     
      JOIN Products ON Products.ProductID = [Order Details].ProductID      
       JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
/* Invoices(ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry,CustomerID,CustomerName,Address,City,Region,PostalCode,Country,Salesperson,OrderID,OrderDate,RequiredDate,ShippedDate,ShipperName,ProductID,ProductName,UnitPrice,Quantity,Discount,ExtendedPrice,Freight) */;

CREATE VIEW [Orders Qry] AS
SELECT Orders.OrderID,
       Orders.CustomerID,
       Orders.EmployeeID, 
       Orders.OrderDate, 
       Orders.RequiredDate,
       Orders.ShippedDate, 
       Orders.ShipVia, 
       Orders.Freight,
       Orders.ShipName, 
       Orders.ShipAddress, 
       Orders.ShipCity,
       Orders.ShipRegion,
       Orders.ShipPostalCode,
       Orders.ShipCountry,
       Customers.CompanyName,
       Customers.Address,
       Customers.City,
       Customers.Region,
       Customers.PostalCode, 
       Customers.Country
FROM Customers 
     JOIN Orders ON Customers.CustomerID = Orders.CustomerID
/* "Orders Qry"(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry,CompanyName,Address,City,Region,PostalCode,Country) */;

CREATE VIEW [Order Subtotals] AS
SELECT [Order Details].OrderID, 
Sum(([Order Details].UnitPrice*Quantity*(1-Discount)/100)*100) AS Subtotal
FROM [Order Details]
GROUP BY [Order Details].OrderID
/* "Order Subtotals"(OrderID,Subtotal) */;

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

CREATE VIEW [Products Above Average Price] AS
SELECT Products.ProductName, 
       Products.UnitPrice
FROM Products
WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
/* "Products Above Average Price"(ProductName,UnitPrice) */;

CREATE VIEW [Products by Category] AS
SELECT Categories.CategoryName, 
       Products.ProductName, 
       Products.QuantityPerUnit, 
       Products.UnitsInStock, 
       Products.Discontinued
FROM Categories 
     INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Products.Discontinued <> 1
/* "Products by Category"(CategoryName,ProductName,QuantityPerUnit,UnitsInStock,Discontinued) */;

CREATE VIEW [Quarterly Orders] AS
SELECT DISTINCT Customers.CustomerID, 
                Customers.CompanyName, 
                Customers.City, 
                Customers.Country
FROM Customers 
     JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN DATETIME('1997-01-01') And DATETIME('1997-12-31')
/* "Quarterly Orders"(CustomerID,CompanyName,City,Country) */;

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

CREATE VIEW [Summary of Sales by Quarter] AS
SELECT Orders.ShippedDate, 
       Orders.OrderID, 
       [Order Subtotals].Subtotal
FROM Orders 
     INNER JOIN [Order Subtotals] ON Orders.OrderID = [Order Subtotals].OrderID
WHERE Orders.ShippedDate IS NOT NULL
/* "Summary of Sales by Quarter"(ShippedDate,OrderID,Subtotal) */;

CREATE VIEW [Summary of Sales by Year] AS
SELECT      Orders.ShippedDate, 
            Orders.OrderID, 
 [Order Subtotals].Subtotal
FROM Orders 
     INNER JOIN [Order Subtotals] ON Orders.OrderID = [Order Subtotals].OrderID
WHERE Orders.ShippedDate IS NOT NULL
/* "Summary of Sales by Year"(ShippedDate,OrderID,Subtotal) */;

CREATE VIEW [Category Sales for 1997] AS
SELECT     [Product Sales for 1997].CategoryName, 
       Sum([Product Sales for 1997].ProductSales) AS CategorySales
FROM [Product Sales for 1997]
GROUP BY [Product Sales for 1997].CategoryName
/* "Category Sales for 1997"(CategoryName,CategorySales) */;

CREATE VIEW [Order Details Extended] AS
SELECT [Order Details].OrderID, 
       [Order Details].ProductID, 
       Products.ProductName, 
           [Order Details].UnitPrice, 
       [Order Details].Quantity, 
       [Order Details].Discount, 
      ([Order Details].UnitPrice*Quantity*(1-Discount)/100)*100 AS ExtendedPrice
FROM Products 
     JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
/* "Order Details Extended"(OrderID,ProductID,ProductName,UnitPrice,Quantity,Discount,ExtendedPrice) */;

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

CREATE VIEW [ProductDetails_V] as
select 
p.*, 
c.CategoryName, c.Description as [CategoryDescription],
s.CompanyName as [SupplierName], s.Region as [SupplierRegion]
from [Products] p
join [Categories] c on p.CategoryId = c.CategoryId
join [Suppliers] s on s.SupplierId = p.SupplierId
/* ProductDetails_V(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,CategoryName,CategoryDescription,SupplierName,SupplierRegion) */;
