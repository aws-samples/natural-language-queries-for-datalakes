CREATE TABLE [InvoiceLine]
(
    [InvoiceLineId] INTEGER  NOT NULL,
    [InvoiceId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    [Quantity] INTEGER  NOT NULL,
    CONSTRAINT [PK_InvoiceLine] PRIMARY KEY  ([InvoiceLineId]),
    FOREIGN KEY ([InvoiceId]) REFERENCES [Invoice] ([InvoiceId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES [Track] ([TrackId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="InvoiceLine">
-- - Description: Contains information about the individual items or tracks included in an invoice.
-- - Data:
-- -- InvoiceId: The unique identifier of the invoice
-- -- TrackId: The unique identifier of the track or item purchased
-- -- UnitPrice: The price of a single unit of the track
-- -- Quantity: The quantity of the track purchased
-- - Relationships:
-- -- (InvoiceLine.InvoiceId → Invoice.InvoiceId) - Table containing information about invoices
-- -- (InvoiceLine.TrackId → Track.TrackId) - Table containing information about tracks or items
-- </METADATA>

-- File: Chinook.InvoiceLine.txt 
-- InvoiceLineId: INTEGER FROM 1 TO 2240 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- InvoiceId: INTEGER FROM 1 TO 412 like [5, 12, 19, 26, 33, 40, 47, 54, 61, 68]
-- TrackId: INTEGER FROM 1 TO 3500 like [2, 8, 9, 20, 32, 48, 66, 84, 161, 162]
-- UnitPrice: NUMERIC FROM 0.99 TO 1.99 like [0.99, 1.99]
-- Quantity: INTEGER FROM 1 TO 1 like [1]
-- 
