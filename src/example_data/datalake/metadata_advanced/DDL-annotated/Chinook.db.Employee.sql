CREATE TABLE [Employee]
(
    [EmployeeId] INTEGER  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [Title] NVARCHAR(30),
    [ReportsTo] INTEGER,
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60),
    CONSTRAINT [PK_Employee] PRIMARY KEY  ([EmployeeId]),
    FOREIGN KEY ([ReportsTo]) REFERENCES [Employee] ([EmployeeId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Employee">
-- - Description: Contains information about employees of the company.
-- - Data:
-- -- LastName: The last name of the employee
-- -- FirstName: The first name of the employee
-- -- Title: The job title of the employee
-- -- ReportsTo: The unique identifier of the employee's manager
-- -- BirthDate: The date of birth of the employee
-- -- HireDate: The date the employee was hired
-- -- Address: The street address of the employee
-- -- City: The city where the employee is located
-- -- State: The state or province where the employee is located
-- -- Country: The country where the employee is located
-- -- PostalCode: The postal code or zip code of the employee's address
-- -- Phone: The phone number of the employee
-- -- Fax: The fax number of the employee
-- -- Email: The email address of the employee
-- - Relationships:
-- -- (Employee.ReportsTo → Employee.EmployeeId) - Self-referencing relationship for employee hierarchy
-- </METADATA>

-- File: Chinook.Employee.txt 
-- EmployeeId: INTEGER FROM 1 TO 8 like [1, 2, 3, 4, 5, 6, 7, 8]
-- LastName: TEXT FROM Adams TO Peacock like ['Peacock', 'Park', 'Mitchell', 'King', 'Johnson', 'Edwards', 'Callahan', 'Adams']
-- FirstName: TEXT FROM Andrew TO Steve like ['Steve', 'Robert', 'Nancy', 'Michael', 'Margaret', 'Laura', 'Jane', 'Andrew']
-- Title: TEXT FROM General Manager TO Sales Support Agent like ['Sales Support Agent', 'IT Staff', 'Sales Manager', 'IT Manager', 'General Manager']
-- ReportsTo: INTEGER FROM 1 TO 6 like [2, 1, 6, None]
-- BirthDate: TEXT FROM 1947-09-19 00:00:00 TO 1973-08-29 00:00:00 like ['1973-08-29 00:00:00', '1973-07-01 00:00:00', '1970-05-29 00:00:00', '1968-01-09 00:00:00', '1965-03-03 00:00:00', '1962-02-18 00:00:00', '1958-12-08 00:00:00', '1947-09-19 00:00:00']
-- HireDate: TEXT FROM 2002-04-01 00:00:00 TO 2004-03-04 00:00:00 like ['2003-10-17 00:00:00', '2004-03-04 00:00:00', '2004-01-02 00:00:00', '2003-05-03 00:00:00', '2002-08-14 00:00:00', '2002-05-01 00:00:00', '2002-04-01 00:00:00']
-- Address: TEXT FROM 1111 6 Ave SW TO 923 7 ST NW like ['923 7 ST NW', '825 8 Ave SW', '7727B 41 Ave', '683 10 Street SW', '590 Columbia Boulevard West', '5827 Bowness Road NW', '11120 Jasper Ave NW', '1111 6 Ave SW']
-- City: TEXT FROM Calgary TO Lethbridge like ['Calgary', 'Lethbridge', 'Edmonton']
-- State: TEXT FROM AB TO AB like ['AB']
-- Country: TEXT FROM Canada TO Canada like ['Canada']
-- PostalCode: TEXT FROM T1H 1Y8 TO T5K 2N1 like ['T5K 2N1', 'T3B 1Y7', 'T3B 0C5', 'T2P 5M5', 'T2P 5G3', 'T2P 2T3', 'T1K 5N8', 'T1H 1Y8']
-- Phone: TEXT FROM +1 (403) 246-9887 TO 1 (780) 836-9987 like ['+1 (403) 262-3443', '1 (780) 836-9987', '+1 (780) 428-9482', '+1 (403) 467-3351', '+1 (403) 456-9986', '+1 (403) 263-4423', '+1 (403) 246-9887']
-- Fax: TEXT FROM +1 (403) 246-9899 TO 1 (780) 836-9543 like ['1 (780) 836-9543', '+1 (780) 428-3457', '+1 (403) 467-8772', '+1 (403) 456-8485', '+1 (403) 263-4289', '+1 (403) 262-6712', '+1 (403) 262-3322', '+1 (403) 246-9899']
-- Email: TEXT FROM andrew@chinookcorp.com TO steve@chinookcorp.com like ['steve@chinookcorp.com', 'robert@chinookcorp.com', 'nancy@chinookcorp.com', 'michael@chinookcorp.com', 'margaret@chinookcorp.com', 'laura@chinookcorp.com', 'jane@chinookcorp.com', 'andrew@chinookcorp.com']
-- 
