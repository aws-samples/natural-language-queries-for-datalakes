CREATE TABLE [MediaType]
(
    [MediaTypeId] INTEGER  NOT NULL,
    [Name] NVARCHAR(120),
    CONSTRAINT [PK_MediaType] PRIMARY KEY  ([MediaTypeId])
);

-- <METADATA CHANNEL="sqlite" DATABASE="Chinook.db" TABLE="MediaType">
-- - Description: Contains information about different types of media formats.
-- - Data:
-- -- Name: The name of the media type (e.g., MPEG audio file, AAC audio file)
-- </METADATA>

-- File: Chinook.MediaType.txt 
-- MediaTypeId: INTEGER FROM 1 TO 5 like [1, 2, 3, 4, 5]
-- Name: TEXT FROM AAC audio file TO Purchased AAC audio file like ['Purchased AAC audio file', 'Protected MPEG-4 video file', 'Protected AAC audio file', 'MPEG audio file', 'AAC audio file']
-- 
