CREATE TABLE [Track]
(
    [TrackId] INTEGER  NOT NULL,
    [Name] NVARCHAR(200)  NOT NULL,
    [AlbumId] INTEGER,
    [MediaTypeId] INTEGER  NOT NULL,
    [GenreId] INTEGER,
    [Composer] NVARCHAR(220),
    [Milliseconds] INTEGER  NOT NULL,
    [Bytes] INTEGER,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    CONSTRAINT [PK_Track] PRIMARY KEY  ([TrackId]),
    FOREIGN KEY ([AlbumId]) REFERENCES [Album] ([AlbumId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([GenreId]) REFERENCES [Genre] ([GenreId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([MediaTypeId]) REFERENCES [MediaType] ([MediaTypeId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON [Album] ([ArtistId]);
CREATE INDEX [IFK_CustomerSupportRepId] ON [Customer] ([SupportRepId]);
CREATE INDEX [IFK_EmployeeReportsTo] ON [Employee] ([ReportsTo]);
CREATE INDEX [IFK_InvoiceCustomerId] ON [Invoice] ([CustomerId]);
CREATE INDEX [IFK_InvoiceLineInvoiceId] ON [InvoiceLine] ([InvoiceId]);
CREATE INDEX [IFK_InvoiceLineTrackId] ON [InvoiceLine] ([TrackId]);
CREATE INDEX [IFK_PlaylistTrackPlaylistId] ON [PlaylistTrack] ([PlaylistId]);
CREATE INDEX [IFK_PlaylistTrackTrackId] ON [PlaylistTrack] ([TrackId]);
CREATE INDEX [IFK_TrackAlbumId] ON [Track] ([AlbumId]);
CREATE INDEX [IFK_TrackGenreId] ON [Track] ([GenreId]);
CREATE INDEX [IFK_TrackMediaTypeId] ON [Track] ([MediaTypeId]);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Track">
-- - Description: Contains information about individual music tracks or items.
-- - Data:
-- -- Name: The name or title of the track
-- -- AlbumId: The unique identifier of the album the track belongs to
-- -- MediaTypeId: The unique identifier of the media type of the track
-- -- GenreId: The unique identifier of the genre of the track
-- -- Composer: The name of the composer of the track
-- -- Milliseconds: The duration of the track in milliseconds
-- -- Bytes: The file size of the track in bytes
-- -- UnitPrice: The price of a single unit of the track
-- - Relationships:
-- -- (Track.AlbumId → Album.AlbumId) - Table containing information about albums
-- -- (Track.GenreId → Genre.GenreId) - Table containing information about genres
-- -- (Track.MediaTypeId → MediaType.MediaTypeId) - Table containing information about media types
-- </METADATA>

-- File: Chinook.Track.txt 
-- TrackId: INTEGER FROM 1 TO 3503 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Name: TEXT FROM "40" TO Último Pau-De-Arara like ['Wrathchild', 'The Trooper', 'The Number Of The Beast', 'Iron Maiden', 'Hallowed Be Thy Name', '2 Minutes To Midnight', 'The Evil That Men Do', 'Sanctuary', 'Running Free', 'Fear Of The Dark']
-- AlbumId: INTEGER FROM 1 TO 347 like [141, 23, 73, 229, 230, 251, 83, 231, 253, 24]
-- MediaTypeId: INTEGER FROM 1 TO 5 like [1, 2, 3, 5, 4]
-- GenreId: INTEGER FROM 1 TO 25 like [1, 7, 3, 4, 2, 19, 6, 24, 21, 14]
-- Composer: TEXT FROM A. F. Iommi, W. Ward, T. Butler, J. Osbourne TO roger glover like [None, 'Steve Harris', 'U2', 'Jagger/Richards', 'Billy Corgan', 'Kurt Cobain', 'Bill Berry-Peter Buck-Mike Mills-Michael Stipe', 'The Tea Party', 'Miles Davis', 'Gilberto Gil']
-- Milliseconds: INTEGER FROM 1071 TO 5286953 like [240091, 368770, 321828, 289750, 285753, 284447, 282488, 282174, 272796, 269557]
-- Bytes: INTEGER FROM 38747 TO 1059546140 like [17760384, 10323804, 1059546140, 1054423946, 587051735, 577829804, 574325829, 570152232, 558872190, 555244214]
-- UnitPrice: NUMERIC FROM 0.99 TO 1.99 like [0.99, 1.99]
-- 
