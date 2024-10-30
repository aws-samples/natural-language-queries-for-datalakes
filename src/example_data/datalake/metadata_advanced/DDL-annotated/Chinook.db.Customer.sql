CREATE TABLE [Customer]
(
    [CustomerId] INTEGER  NOT NULL,
    [FirstName] NVARCHAR(40)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Company] NVARCHAR(80),
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60)  NOT NULL,
    [SupportRepId] INTEGER,
    CONSTRAINT [PK_Customer] PRIMARY KEY  ([CustomerId]),
    FOREIGN KEY ([SupportRepId]) REFERENCES [Employee] ([EmployeeId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Customer">
-- - Description: Contains information about customers who purchase music.
-- - Data:
-- -- FirstName: The first name of the customer
-- -- LastName: The last name of the customer
-- -- Company: The company name, if the customer is a business
-- -- Address: The street address of the customer
-- -- City: The city where the customer is located
-- -- State: The state or province where the customer is located
-- -- Country: The country where the customer is located
-- -- PostalCode: The postal code or zip code of the customer's address
-- -- Phone: The phone number of the customer
-- -- Fax: The fax number of the customer
-- -- Email: The email address of the customer
-- -- SupportRepId: The unique identifier of the employee who provides support to the customer
-- - Relationships:
-- -- (Customer.SupportRepId → Employee.EmployeeId) - Table containing information about employees
-- </METADATA>

-- File: Chinook.Customer.txt 
-- CustomerId: INTEGER FROM 1 TO 59 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FirstName: TEXT FROM Aaron TO Wyatt like ['Mark', 'Frank', 'Wyatt', 'Victor', 'Tim', 'Terhi', 'Steve', 'Stanisław', 'Roberto', 'Robert']
-- LastName: TEXT FROM Almeida TO Zimmermann like ['Zimmermann', 'Wójcik', 'Wichterlová', 'Van der Berg', 'Tremblay', 'Taylor', 'Sullivan', 'Stevens', 'Srivastava', 'Smith']
-- Company: TEXT FROM Apple Inc. TO Woodstock Discos like [None, 'Woodstock Discos', 'Telus', 'Rogers Canada', 'Riotur', 'Microsoft Corporation', 'JetBrains s.r.o.', 'Google Inc.', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Banco do Brasil S.A.']
-- Address: TEXT FROM 1 Infinite Loop TO Via Degli Scipioni, 43 like ['Via Degli Scipioni, 43', 'Ullevålsveien 14', 'Theodor-Heuss-Straße 34', 'Tauentzienstraße 8', 'Sønder Boulevard 51', 'Rua dos Campeões Europeus de Viena, 4350', 'Rua da Assunção 53', 'Rua Dr. Falcão Filho, 155', 'Rotenturmstraße 4, 1010 Innere Stadt', 'Rilská 3174/6']
-- City: TEXT FROM Amsterdam TO Yellowknife like ['São Paulo', 'Prague', 'Paris', 'Mountain View', 'London', 'Berlin', 'Yellowknife', 'Winnipeg', 'Warsaw', 'Vienne']
-- State: TEXT FROM AB TO WI like [None, 'SP', 'CA', 'ON', 'WI', 'WA', 'VV', 'UT', 'TX', 'RM']
-- Country: TEXT FROM Argentina TO United Kingdom like ['USA', 'Canada', 'France', 'Brazil', 'Germany', 'United Kingdom', 'Portugal', 'India', 'Czech Republic', 'Sweden']
-- PostalCode: TEXT FROM 00-358 TO X1A 1N6 like [None, 'X1A 1N6', 'V6C 1G8', 'T6G 2C7', 'SW1V 3EN', 'R3L 2B9', 'N1 5LH', 'M6J 1V1', 'K2P 1L7', 'H2G 1A7']
-- Phone: TEXT FROM +1 (204) 452-6452 TO +91 080 22289999 like ['+91 080 22289999', '+91 0124 39883988', '+61 (02) 9332 3633', '+56 (0)2 635 4444', '+55 (61) 3363-5547', '+55 (21) 2271-7000', '+55 (12) 3923-5555', '+55 (11) 3055-3278', '+55 (11) 3033-5446', '+54 (0)11 4311 4333']
-- Fax: TEXT FROM +1 (212) 221-4679 TO +55 (61) 3363-7855 like [None, '+55 (61) 3363-7855', '+55 (21) 2271-7070', '+55 (12) 3923-5566', '+55 (11) 3055-8131', '+55 (11) 3033-4564', '+420 2 4172 5555', '+1 (780) 434-5565', '+1 (650) 253-0000', '+1 (604) 688-8756']
-- Email: TEXT FROM aaronmitchell@yahoo.ca TO wyatt.girard@yahoo.fr like ['wyatt.girard@yahoo.fr', 'vstevens@yahoo.com', 'tgoyer@apple.com', 'terhi.hamalainen@apple.fi', 'steve.murray@yahoo.uk', 'stanisław.wójcik@wp.pl', 'roberto.almeida@riotur.gov.br', 'robbrown@shaw.ca', 'ricunningham@hotmail.com', 'puja_srivastava@yahoo.in']
-- SupportRepId: INTEGER FROM 3 TO 5 like [3, 4, 5]
-- 
