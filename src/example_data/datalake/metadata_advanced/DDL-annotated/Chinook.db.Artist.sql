CREATE TABLE [Artist]
(
    [ArtistId] INTEGER  NOT NULL,
    [Name] NVARCHAR(120),
    CONSTRAINT [PK_Artist] PRIMARY KEY  ([ArtistId])
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Artist">
-- - Description: Contains information about music artists.
-- - Data:
-- -- Name: The name of the artist
-- </METADATA>

-- File: Chinook.Artist.txt 
-- ArtistId: INTEGER FROM 1 TO 275 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Name: TEXT FROM A Cor Do Som TO Zeca Pagodinho like ['Zeca Pagodinho', "Youssou N'Dour", 'Yo-Yo Ma', 'Yehudi Menuhin', 'Xis', 'Wilhelm Kempff', 'Whitesnake', 'Vinícius E Qurteto Em Cy', 'Vinícius E Odette Lara', 'Vinícius De Moraes & Baden Powell']
-- 
