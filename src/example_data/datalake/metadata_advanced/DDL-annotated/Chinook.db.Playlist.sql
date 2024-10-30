CREATE TABLE [Playlist]
(
    [PlaylistId] INTEGER  NOT NULL,
    [Name] NVARCHAR(120),
    CONSTRAINT [PK_Playlist] PRIMARY KEY  ([PlaylistId])
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="Playlist">
-- - Description: Contains information about playlists of music tracks.
-- - Data:
-- -- Name: The name of the playlist
-- </METADATA>

-- File: Chinook.Playlist.txt 
-- PlaylistId: INTEGER FROM 1 TO 18 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Name: TEXT FROM 90’s Music TO TV Shows like ['TV Shows', 'Music', 'Movies', 'Audiobooks', 'On-The-Go 1', 'Music Videos', 'Heavy Metal Classic', 'Grunge', 'Classical 101 - The Basics', 'Classical 101 - Next Steps']
-- 
