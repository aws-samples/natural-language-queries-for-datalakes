CREATE TABLE SwimmingEvents ( -- This table contains information about swimming events
    EventID INTEGER PRIMARY KEY,
    EventName TEXT NOT NULL, -- Name of the event (e.g., "100m Freestyle", "200m Butterfly"). 20-30 distinct values.
    StrokeType TEXT, -- Type of stroke ("Freestyle", "Butterfly", "Backstroke", "Breaststroke", "Medley"). 5 distinct values.
    Distance INTEGER, -- Distance of the event in meters. Common values: 50, 100, 200, 400, 800, 1500.
    WorldRecord FLOAT, -- Current world record for the event in seconds. Range 20-1000, depends on event.
    WorldRecordHolderID INTEGER -- References PlayerID in Players table. Range depends on number of players.
);
-- JOIN GRAPH: "SwimmingEvents": ["Players", "SwimmingResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SwimmingEvents">
-- - Description: This table contains information about swimming events
-- - Data:
-- -- EventID: Primary key for the SwimmingEvents table
-- -- EventName: Name of the event (e.g., "100m Freestyle", "200m Butterfly"). 20-30 distinct values.
-- -- StrokeType: Type of stroke ("Freestyle", "Butterfly", "Backstroke", "Breaststroke", "Medley"). 5 distinct values.
-- -- Distance: Distance of the event in meters. Common values: 50, 100, 200, 400, 800, 1500.
-- -- WorldRecord: Current world record for the event in seconds. Range 20-1000, depends on event.
-- -- WorldRecordHolderID: References PlayerID in Players table. Range depends on number of players.
-- - Relationships:
-- -- (SwimmingEvents.WorldRecordHolderID → Players.PlayerID) - Table containing information about individual players
-- -- (SwimmingEvents.EventID → SwimmingResults.EventID) - Table containing results of swimming events
-- </METADATA>
-- 

-- File: mysports.SwimmingEvents.txt 
-- EventID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- EventName: TEXT FROM 100m Backstroke TO 50m Freestyle like ['50m Freestyle', '400m Individual Medley', '200m Butterfly', '200m Breaststroke', '200m Backstroke', '1500m Freestyle', '100m Freestyle', '100m Butterfly', '100m Breaststroke', '100m Backstroke']
-- StrokeType: TEXT FROM Backstroke TO Medley like ['Freestyle', 'Butterfly', 'Breaststroke', 'Backstroke', 'Medley']
-- Distance: INTEGER FROM 50 TO 1500 like [100, 200, 1500, 400, 50]
-- WorldRecord: NUMERIC FROM 20.91 TO 871.02 like [871.02, 243.84, 126.12, 119.41, 111.92, 56.88, 51.85, 49.5, 46.91, 20.91]
-- WorldRecordHolderID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- 
