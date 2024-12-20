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

-- 

-- File: northwind.Invoices.txt 
-- ShipName: TEXT FROM Alfred-s Futterkiste TO Wolski Zajazd like ['Ana Trujillo Emparedados y helados', 'Consolidated Holdings', 'Wolski Zajazd', 'Gourmet Lanchonetes', 'Seven Seas Imports', 'Alfreds Futterkiste', 'Ernst Handel', 'Cactus Comidas para llevar', 'Simons bistro', 'Folk och fä HB']
-- ShipAddress: TEXT FROM 1 rue Alsace-Lorraine TO Åkergatan 24 like ['Obere Str. 57', 'Avda. de la Constitución 2222', 'Berkeley Gardens 12 \xa0Brewery', 'ul. Filtrowa 68', 'Av. Brasil, 442', '90 Wadhurst Rd.', 'Kirchgasse 6', 'Cerrito 333', 'Vinbæltet 34', 'Åkergatan 24']
-- ShipCity: TEXT FROM Aachen TO Århus like ['London', 'México D.F.', 'Sao Paulo', 'Buenos Aires', 'Rio de Janeiro', 'Lisboa', 'Berlin', 'Nantes', 'Madrid', 'Portland']
-- ShipRegion: TEXT FROM British Isles TO Western Europe like ['Western Europe', 'South America', 'North America', 'Southern Europe', 'British Isles', 'Central America', 'Northern Europe', 'Scandinavia', 'Eastern Europe']
-- ShipPostalCode: TEXT FROM 01-012 TO WX3 6FW like ['1010', '12209', '44000', '5033', '5022', '5021', 'WX1 6LT', '01-012', '04876-786', 'OX15 4NB']
-- ShipCountry: TEXT FROM Argentina TO Venezuela like ['USA', 'Germany', 'France', 'Brazil', 'UK', 'Mexico', 'Venezuela', 'Spain', 'Argentina', 'Canada']
-- CustomerID: TEXT FROM ALFKI TO WOLZA like ['BSBEV', 'HUNGC', 'RICAR', 'GOURL', 'ANATR', 'PRINI', 'FOLIG', 'LETSS', 'RANCH', 'LILAS']
-- CustomerName: TEXT FROM Alfreds Futterkiste TO Wolski  Zajazd like ['IT', "B's Beverages", 'Hungry Coyote Import Store', 'Ricardo Adocicados', 'Gourmet Lanchonetes', 'Ana Trujillo Emparedados y helados', 'Princesa Isabel Vinhos', 'Folies gourmandes', "Let's Stop N Shop", 'Rancho grande']
-- Address: TEXT FROM 1 rue Alsace-Lorraine TO Åkergatan 24 like [None, 'Fauntleroy Circus', 'City Center Plaza 516 Main St.', 'Av. Copacabana, 267', 'Av. Brasil, 442', 'Avda. de la Constitución 2222', 'Estrada da saúde n. 58', '184, chaussée de Tournai', '87 Polk St. Suite 5', 'Av. del Libertador 900']
-- City: TEXT FROM Aachen TO Århus like ['London', 'México D.F.', 'Sao Paulo', 'Rio de Janeiro', 'Madrid', 'Buenos Aires', 'Paris', None, 'Lisboa', 'Nantes']
-- Region: TEXT FROM British Isles TO Western Europe like ['Western Europe', 'South America', 'North America', 'Southern Europe', 'British Isles', 'Central America', 'Northern Europe', 'Scandinavia', None, 'Eastern Europe']
-- PostalCode: TEXT FROM 01-012 TO WX3 6FW like [None, '1010', '05033', '44000', 'EC2 5NT', '97827', '02389-890', '04876-786', '05021', '1756']
-- Country: TEXT FROM Argentina TO Venezuela like ['USA', 'France', 'Germany', 'Brazil', 'UK', 'Mexico', 'Spain', 'Venezuela', 'Canada', 'Argentina']
-- Salesperson: INTEGER FROM 0 TO 0 like [0]
-- OrderID: INTEGER FROM 10248 TO 26529 like [26492, 26457, 26322, 26281, 26255, 26149, 25740, 25706, 25631, 25533]
-- OrderDate: TEXT FROM 2012-07-10 15:40:46 TO 2023-10-28 00:09:48 like ['2023-09-26 00:22:28', '2023-09-24 04:44:45', '2023-08-21 18:01:37', '2023-08-08 01:44:16', '2023-07-04 08:58:59', '2023-06-28 09:25:51', '2023-06-14 06:01:01', '2023-05-30 08:21:02', '2023-05-22 19:53:40', '2023-05-17 21:15:01']
-- RequiredDate: TEXT FROM 2012-07-12 11:00:21 TO 2023-12-14 23:09:18 like ['2017-11-15 02:17:13', '2023-10-23 23:49:46', '2023-10-10 11:27:25', '2023-09-13 22:00:43', '2023-08-29 04:32:42', '2023-08-12 19:57:51', '2023-07-17 11:30:09', '2023-06-30 10:20:25', '2023-06-27 08:13:08', '2023-06-06 03:45:12']
-- ShippedDate: TEXT FROM 2012-07-13 21:20:47 TO 2023-11-19 02:55:24 like ['2023-09-29 22:50:23', '2023-09-29 13:23:49', '2023-09-02 08:36:56', '2023-08-17 15:28:24', '2023-07-13 07:05:50', '2023-06-30 08:29:19', '2023-06-20 15:51:20', '2023-06-16 08:34:11', '2023-06-07 15:39:02', '2023-05-27 13:23:09']
-- ShipperName: TEXT FROM Federal Shipping TO United Package like ['Federal Shipping', 'United Package', 'Speedy Express']
-- ProductID: INTEGER FROM 1 TO 77 like [66, 19, 70, 26, 20, 69, 59, 57, 13, 31]
-- ProductName: TEXT FROM Alice Mutton TO Zaanse koeken like ['Louisiana Hot Spiced Okra', 'Teatime Chocolate Biscuits', 'Outback Lager', "Sir Rodney's Marmalade", 'Gumbär Gummibärchen', 'Gudbrandsdalsost', 'Raclette Courdavault', 'Ravioli Angelo', 'Konbu', 'Gorgonzola Telino']
-- UnitPrice: INTEGER FROM 2 TO 263.5 like [18, 14, 10, 15, 19, 21, 38, 12.5, 43.9, 9.5]
-- Quantity: INTEGER FROM 1 TO 130 like [20, 10, 30, 48, 35, 50, 15, 18, 9, 49]
-- Discount: NUMERIC FROM 0.0 TO 0.25 like [0.0, 0.05, 0.1, 0.2, 0.15, 0.25, 0.03, 0.02, 0.06, 0.04]
-- ExtendedPrice: NUMERIC FROM 2.5 TO 15810.0 like [180.0, 360.0, 252.0, 420.0, 90.0, 450.0, 210.0, 126.0, 630.0, 504.0]
-- Freight: NUMERIC FROM 10.25 TO 587 like [447.25, 412.5, 447.5, 425.5, 439.5, 440.75, 449.5, 477.25, 408.25, 454.75]
-- 
