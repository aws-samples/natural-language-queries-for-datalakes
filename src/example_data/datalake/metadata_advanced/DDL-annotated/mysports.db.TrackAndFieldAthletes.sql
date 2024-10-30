CREATE TABLE TrackAndFieldAthletes ( -- This table contains specific information for track and field athletes
    TrackAndFieldAthleteID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Specialization TEXT -- Athlete's specialization (e.g., "Sprinter", "Long Distance", "Jumper"). 10-15 distinct values.
);
-- JOIN GRAPH: "TrackAndFieldAthletes": ["Players", "TrackAndFieldResults"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TrackAndFieldAthletes">
-- - Description: This table contains specific information for track and field athletes
-- - Data:
-- -- TrackAndFieldAthleteID: Primary key for the TrackAndFieldAthletes table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Specialization: Athlete's specialization (e.g., "Sprinter", "Long Distance", "Jumper"). 10-15 distinct values.
-- - Relationships:
-- -- (TrackAndFieldAthletes.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (TrackAndFieldAthletes.TrackAndFieldAthleteID → TrackAndFieldResults.AthleteID) - Table containing results of track and field events
-- </METADATA>
-- 

-- File: mysports.TrackAndFieldAthletes.txt 
-- TrackAndFieldAthleteID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Specialization: TEXT FROM Decathlete TO Triple Jumper like ['Triple Jumper', 'Sprinter', 'Shot Putter', 'Middle Distance Runner', 'Long Jumper', 'Long Distance Runner', 'Javelin Thrower', 'Hurdler', 'High Jumper', 'Decathlete']
-- 
