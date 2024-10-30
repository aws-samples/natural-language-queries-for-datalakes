CREATE TABLE Customers ( -- This table contains information about ticket customers
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Customer's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Customer's last name. Many distinct values.
    Email TEXT, -- Customer's email address. Many distinct values, unique.
    Phone TEXT, -- Customer's phone number. Many distinct values.
    Address TEXT -- Customer's address. Many distinct values.
);
-- JOIN GRAPH: "Customers": ["Tickets", "Bets"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Customers">
-- - Description: This table contains information about ticket customers
-- - Data:
-- -- CustomerID: Primary key for the Customers table
-- -- FirstName: Customer's first name. Many distinct values.
-- -- LastName: Customer's last name. Many distinct values.
-- -- Email: Customer's email address. Many distinct values, unique.
-- -- Phone: Customer's phone number. Many distinct values.
-- -- Address: Customer's address. Many distinct values.
-- - Relationships:
-- -- (Customers.CustomerID → Tickets.CustomerID) - Table containing information about ticket sales
-- -- (Customers.CustomerID → Bets.CustomerID) - Table containing information about sports bets
-- </METADATA>
-- 

-- File: mysports.Customers.txt 
-- CustomerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- FirstName: TEXT FROM Alice TO John like ['John', 'Jane', 'Hannah', 'George', 'Fiona', 'Edward', 'Diana', 'Charlie', 'Bob', 'Alice']
-- LastName: TEXT FROM Brown TO Wilson like ['Wilson', 'Williams', 'Taylor', 'Smith', 'Moore', 'Miller', 'Johnson', 'Doe', 'Davis', 'Brown']
-- Email: TEXT FROM alice.williams@email.com TO john.doe@email.com like ['john.doe@email.com', 'jane.smith@email.com', 'hannah.taylor@email.com', 'george.moore@email.com', 'fiona.wilson@email.com', 'edward.miller@email.com', 'diana.davis@email.com', 'charlie.brown@email.com', 'bob.johnson@email.com', 'alice.williams@email.com']
-- Phone: TEXT FROM 012-345-6789 TO 901-234-5678 like ['901-234-5678', '890-123-4567', '789-012-3456', '678-901-2345', '567-890-1234', '456-789-0123', '345-678-9012', '234-567-8901', '123-456-7890', '012-345-6789']
-- Address: TEXT FROM 123 Main St, Anytown, USA TO 987 Cedar Ln, Anytown, USA like ['987 Cedar Ln, Anytown, USA', '864 Spruce Ave, Somewhere, USA', '789 Pine Rd, Nowhere, USA', '753 Ash Rd, Anytown, USA', '654 Maple Dr, Somewhere, USA', '456 Oak Ave, Somewhere, USA', '321 Elm St, Everywhere, USA', '246 Birch Blvd, Nowhere, USA', '135 Walnut St, Everywhere, USA', '123 Main St, Anytown, USA']
-- 
