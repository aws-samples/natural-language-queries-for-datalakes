CREATE TABLE [Genre]
(
    [GenreId] INTEGER  NOT NULL,
    [Name] NVARCHAR(120),
    CONSTRAINT [PK_Genre] PRIMARY KEY  ([GenreId])
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Genre">
-- - Description: Contains information about music genres.
-- - Data:
-- -- Name: The name of the music genre
-- </METADATA>

-- File: Chinook.Genre.txt 
-- GenreId: INTEGER FROM 1 TO 25 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Name: TEXT FROM Alternative TO World like ['World', 'TV Shows', 'Soundtrack', 'Science Fiction', 'Sci Fi & Fantasy', 'Rock And Roll', 'Rock', 'Reggae', 'R&B/Soul', 'Pop']
-- 
