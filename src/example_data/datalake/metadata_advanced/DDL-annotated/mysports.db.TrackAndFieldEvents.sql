CREATE TABLE TrackAndFieldEvents ( -- This table contains information about track and field events
    EventID INTEGER PRIMARY KEY,
    EventName TEXT NOT NULL, -- Name of the event (e.g., "100m Sprint", "Long Jump"). 20-30 distinct values.
    EventType TEXT, -- Type of event ("Track", "Field"). 2 distinct values.
    WorldRecord FLOAT, -- Current world record for the event. Range depends on the specific event.
    WorldRecordHolderID INTEGER -- References PlayerID in Players table. Range depends on number of players.
);
-- JOIN GRAPH: "TrackAndFieldEvents": ["Players", "TrackAndFieldResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TrackAndFieldEvents">
-- - Description: This table contains information about track and field events
-- - Data:
-- -- EventID: Primary key for the TrackAndFieldEvents table
-- -- EventName: Name of the event (e.g., "100m Sprint", "Long Jump"). 20-30 distinct values.
-- -- EventType: Type of event ("Track", "Field"). 2 distinct values.
-- -- WorldRecord: Current world record for the event. Range depends on the specific event.
-- -- WorldRecordHolderID: References PlayerID in Players table. Range depends on number of players.
-- - Relationships:
-- -- (TrackAndFieldEvents.WorldRecordHolderID → Players.PlayerID) - Table containing information about individual players
-- -- (TrackAndFieldEvents.EventID → TrackAndFieldResults.EventID) - Table containing results of track and field events
-- </METADATA>
-- 

-- File: mysports.TrackAndFieldEvents.txt 
-- EventID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- EventName: TEXT FROM 100m Sprint TO Triple Jump like ['Triple Jump', 'Shot Put', 'Long Jump', 'Javelin Throw', 'High Jump', '5000m', '400m Hurdles', '200m Sprint', '1500m', '100m Sprint']
-- EventType: TEXT FROM Field TO Track like ['Track', 'Field']
-- WorldRecord: NUMERIC FROM 2.45 TO 755.36 like [755.36, 206.0, 98.48, 46.78, 23.37, 19.19, 18.29, 9.58, 8.95, 2.45]
-- WorldRecordHolderID: INTEGER FROM 1 TO 9 like [1, 9, 8, 7, 6, 5, 4, 3, 2]
-- 
