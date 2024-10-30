CREATE TABLE [PlaylistTrack]
(
    [PlaylistId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY  ([PlaylistId], [TrackId]),
    FOREIGN KEY ([PlaylistId]) REFERENCES [Playlist] ([PlaylistId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES [Track] ([TrackId]) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="PlaylistTrack">
-- - Description: Contains information about the tracks included in a playlist.
-- - Data:
-- -- PlaylistId: The unique identifier of the playlist
-- -- TrackId: The unique identifier of the track included in the playlist
-- - Relationships:
-- -- (PlaylistTrack.PlaylistId → Playlist.PlaylistId) - Table containing information about playlists
-- -- (PlaylistTrack.TrackId → Track.TrackId) - Table containing information about tracks
-- </METADATA>

-- File: Chinook.PlaylistTrack.txt 
-- PlaylistId: INTEGER FROM 1 TO 18 like [1, 8, 5, 3, 10, 12, 11, 17, 13, 14]
-- TrackId: INTEGER FROM 1 TO 3503 like [3403, 3404, 3408, 3409, 3410, 3411, 3415, 3416, 3417, 3418]
-- 
