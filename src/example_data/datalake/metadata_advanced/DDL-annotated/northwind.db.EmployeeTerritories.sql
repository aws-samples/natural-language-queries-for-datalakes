CREATE TABLE [EmployeeTerritories](
   [EmployeeID]INTEGER NOT NULL,
   [TerritoryID]TEXT NOT NULL,
    PRIMARY KEY ("EmployeeID","TerritoryID"),
        FOREIGN KEY ([EmployeeID]) REFERENCES [Employees] ([EmployeeID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY ([TerritoryID]) REFERENCES [Territories] ([TerritoryID]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="EmployeeTerritories">
-- - Description: Mapping table between employees and territories they are responsible for.
-- - Data:
-- -- (No business data columns)
-- - Relationships:
-- -- (EmployeeTerritories.EmployeeID → Employees.EmployeeID) - Table containing employee information
-- -- (EmployeeTerritories.TerritoryID → Territories.TerritoryID) - Table containing territory information
-- </METADATA>

-- File: northwind.EmployeeTerritories.txt 
-- EmployeeID: INTEGER FROM 1 TO 9 like [7, 2, 5, 9, 6, 3, 8, 4, 1]
-- TerritoryID: TEXT FROM 01581 TO 98104 like ['98104', '98052', '98004', '95060', '95054', '95008', '94105', '94025', '90405', '85251']
-- 
