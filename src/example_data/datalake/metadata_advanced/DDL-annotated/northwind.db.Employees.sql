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

-- <METADATA CHANNEL="sqlite" DATABASE="northwind.db" TABLE="Employees">
-- - Description: Information about employees of the company.
-- - Data:
-- -- LastName: Last name of the employee
-- -- FirstName: First name of the employee
-- -- Title: Job title of the employee
-- -- TitleOfCourtesy: Courtesy title (e.g., Mr., Mrs.) for the employee
-- -- BirthDate: Date of birth of the employee
-- -- HireDate: Date when the employee was hired
-- -- Address: Street address of the employee
-- -- City: City where the employee lives
-- -- Region: Regional area where the employee lives
-- -- PostalCode: Postal code of the employee's address
-- -- Country: Country where the employee lives
-- -- HomePhone: Home phone number of the employee
-- -- Extension: Phone extension number of the employee
-- -- Photo: Binary image data of the employee's photo
-- -- Notes: Additional notes or comments about the employee
-- -- PhotoPath: File path to the employee's photo
-- - Relationships:
-- -- (Employees.ReportsTo → Employees.EmployeeID) - Table containing information about the employee's manager
-- </METADATA>

-- File: northwind.Employees.txt 
-- EmployeeID: INTEGER FROM 1 TO 9 like [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- LastName: TEXT FROM Buchanan TO Suyama like ['Suyama', 'Peacock', 'Leverling', 'King', 'Fuller', 'Dodsworth', 'Davolio', 'Callahan', 'Buchanan']
-- FirstName: TEXT FROM Andrew TO Steven like ['Steven', 'Robert', 'Nancy', 'Michael', 'Margaret', 'Laura', 'Janet', 'Anne', 'Andrew']
-- Title: TEXT FROM Inside Sales Coordinator TO Vice President, Sales like ['Sales Representative', 'Vice President, Sales', 'Sales Manager', 'Inside Sales Coordinator']
-- TitleOfCourtesy: TEXT FROM Dr. TO Ms. like ['Ms.', 'Mr.', 'Mrs.', 'Dr.']
-- BirthDate: TEXT FROM 1957-09-19 TO 1986-01-27 like ['1986-01-27', '1983-08-30', '1983-07-02', '1980-05-29', '1978-01-09', '1975-03-04', '1972-02-19', '1968-12-08', '1957-09-19']
-- HireDate: TEXT FROM 2012-04-01 TO 2014-11-15 like ['2013-10-17', '2014-11-15', '2014-03-05', '2014-01-02', '2013-05-03', '2012-08-14', '2012-05-01', '2012-04-01']
-- Address: TEXT FROM 14 Garrett Hill TO Edgeham Hollow
-- Winchester Way like ['Edgeham Hollow\nWinchester Way', 'Coventry House\nMiner Rd.', '908 W. Capital Way', '722 Moss Bay Blvd.', '7 Houndstooth Rd.', '507 - 20th Ave. E.Apt. 2A', '4726 - 11th Ave. N.E.', '4110 Old Redmond Rd.', '14 Garrett Hill']
-- City: TEXT FROM Kirkland TO Tacoma like ['London', 'Seattle', 'Tacoma', 'Redmond', 'Kirkland']
-- Region: TEXT FROM British Isles TO North America like ['North America', 'British Isles']
-- PostalCode: TEXT FROM 98033 TO WG2 7LT like ['WG2 7LT', 'SW1 8JR', 'RG1 9SP', 'EC2 7JR', '98401', '98122', '98105', '98052', '98033']
-- Country: TEXT FROM UK TO USA like ['USA', 'UK']
-- HomePhone: TEXT FROM (206) 555-1189 TO (71) 555-7773 like ['(71) 555-7773', '(71) 555-5598', '(71) 555-4848', '(71) 555-4444', '(206) 555-9857', '(206) 555-9482', '(206) 555-8122', '(206) 555-3412', '(206) 555-1189']
-- Extension: TEXT FROM 2344 TO 5467 like ['5467', '5176', '465', '452', '428', '3457', '3453', '3355', '2344']
-- Photo: BLOB contains binary data
-- Notes: TEXT FROM Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association. TO Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management."  He is fluent in French. like ['Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management."  He is fluent in French.', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled "Selling in Europe," he was transferred to the London office in March 1993.', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional."  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed "The Art of the Cold Call."  Nancy is a member of Toastmasters International.', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.']
-- ReportsTo: INTEGER FROM 2 TO 5 like [2, 5, None]
-- PhotoPath: TEXT FROM http://accweb/emmployees/buchanan.bmp TO http://accweb/emmployees/peacock.bmp like ['http://accweb/emmployees/davolio.bmp', 'http://accweb/emmployees/peacock.bmp', 'http://accweb/emmployees/leverling.bmp', 'http://accweb/emmployees/fuller.bmp', 'http://accweb/emmployees/buchanan.bmp']
-- 
