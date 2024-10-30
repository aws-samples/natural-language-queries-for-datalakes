CREATE TABLE TrackAndFieldResults ( -- This table contains results of track and field events
    ResultID INTEGER PRIMARY KEY,
    EventID INTEGER, -- References EventID in TrackAndFieldEvents table. Range depends on number of events.
    AthleteID INTEGER, -- References TrackAndFieldAthleteID in TrackAndFieldAthletes table. Range depends on number of athletes.
    CompetitionDate DATE, -- Date of the competition. Range from 1950 to present.
    Result FLOAT, -- Result of the event (time in seconds or distance in meters). Range depends on the specific event.
    Rank INTEGER -- Athlete's rank in the event. Range typically 1-20.
);
-- JOIN GRAPH: "TrackAndFieldResults": ["TrackAndFieldEvents", "TrackAndFieldAthletes"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TrackAndFieldResults">
-- - Description: This table contains results of track and field events
-- - Data:
-- -- ResultID: Primary key for the TrackAndFieldResults table
-- -- EventID: References EventID in TrackAndFieldEvents table. Range depends on number of events.
-- -- AthleteID: References TrackAndFieldAthleteID in TrackAndFieldAthletes table. Range depends on number of athletes.
-- -- CompetitionDate: Date of the competition. Range from 1950 to present.
-- -- Result: Result of the event (time in seconds or distance in meters). Range depends on the specific event.
-- -- Rank: Athlete's rank in the event. Range typically 1-20.
-- - Relationships:
-- -- (TrackAndFieldResults.EventID → TrackAndFieldEvents.EventID) - Table containing information about track and field events
-- -- (TrackAndFieldResults.AthleteID → TrackAndFieldAthletes.TrackAndFieldAthleteID) - Table containing specific information for track and field athletes
-- </METADATA>
-- 

-- File: mysports.TrackAndFieldResults.txt 
-- ResultID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- EventID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- AthleteID: INTEGER FROM 1 TO 9 like [1, 9, 8, 7, 6, 5, 4, 3, 2]
-- CompetitionDate: TEXT FROM 2021-08-01 TO 2021-08-10 like ['2021-08-10', '2021-08-09', '2021-08-08', '2021-08-07', '2021-08-06', '2021-08-05', '2021-08-04', '2021-08-03', '2021-08-02', '2021-08-01']
-- Result: NUMERIC FROM 2.35 TO 765.0 like [765.0, 210.0, 95.2, 47.5, 22.9, 19.62, 17.98, 9.8, 8.65, 2.35]
-- Rank: INTEGER FROM 1 TO 3 like [1, 2, 3]
-- 
