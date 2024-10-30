CREATE TABLE SwimmingResults ( -- This table contains results of swimming events
    ResultID INTEGER PRIMARY KEY,
    EventID INTEGER, -- References EventID in SwimmingEvents table. Range depends on number of events.
    SwimmerID INTEGER, -- References SwimmerID in Swimmers table. Range depends on number of swimmers.
    CompetitionDate DATE, -- Date of the competition. Range from 1950 to present.
    Time FLOAT, -- Time of the swim in seconds. Range 20-1000, depends on event.
    Rank INTEGER -- Swimmer's rank in the event. Range typically 1-8.
);
-- JOIN GRAPH: "SwimmingResults": ["SwimmingEvents", "Swimmers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SwimmingResults">
-- - Description: This table contains results of swimming events
-- - Data:
-- -- ResultID: Primary key for the SwimmingResults table
-- -- EventID: References EventID in SwimmingEvents table. Range depends on number of events.
-- -- SwimmerID: References SwimmerID in Swimmers table. Range depends on number of swimmers.
-- -- CompetitionDate: Date of the competition. Range from 1950 to present.
-- -- Time: Time of the swim in seconds. Range 20-1000, depends on event.
-- -- Rank: Swimmer's rank in the event. Range typically 1-8.
-- - Relationships:
-- -- (SwimmingResults.EventID → SwimmingEvents.EventID) - Table containing information about swimming events
-- -- (SwimmingResults.SwimmerID → Swimmers.SwimmerID) - Table containing specific information for swimmers
-- </METADATA>
-- 

-- File: mysports.SwimmingResults.txt 
-- ResultID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- EventID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- SwimmerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- CompetitionDate: TEXT FROM 2021-07-25 TO 2021-08-03 like ['2021-08-03', '2021-08-02', '2021-08-01', '2021-07-31', '2021-07-30', '2021-07-29', '2021-07-28', '2021-07-27', '2021-07-26', '2021-07-25']
-- Time: NUMERIC FROM 21.2 TO 875.0 like [875.0, 245.0, 127.5, 121.2, 113.0, 57.5, 52.3, 50.1, 47.5, 21.2]
-- Rank: INTEGER FROM 1 TO 3 like [2, 1, 3]
-- 
