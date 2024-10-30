CREATE TABLE [Album]
(
    [AlbumId] INTEGER  NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    CONSTRAINT [PK_Album] PRIMARY KEY  ([AlbumId]),
    FOREIGN KEY ([ArtistId]) REFERENCES [Artist] ([ArtistId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Album">
-- - Description: Contains information about music albums.
-- - Data:
-- -- Title: The name or title of the album
-- -- ArtistId: The unique identifier of the artist who created the album
-- - Relationships:
-- -- (Album.ArtistId → Artist.ArtistId) - Table containing information about the artists
-- </METADATA>

-- File: Chinook.Album.txt 
-- AlbumId: INTEGER FROM 1 TO 347 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Title: TEXT FROM ...And Justice For All TO [1997] Black Light Syndrome like ['[1997] Black Light Syndrome', 'Zooropa', 'Worlds', 'Weill: The Seven Deadly Sins', 'Warner 25 Anos', 'War', 'Walking Into Clarksdale', 'Wagner: Favourite Overtures', 'Vs.', 'Vozes do MPB']
-- ArtistId: INTEGER FROM 1 TO 275 like [90, 22, 58, 50, 150, 114, 118, 21, 82, 84]
-- 
