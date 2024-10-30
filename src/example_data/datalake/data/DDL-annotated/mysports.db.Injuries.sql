CREATE TABLE Injuries ( -- This table contains information about player injuries
    InjuryID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    InjuryDate DATE, -- Date of the injury. Range from 1950 to present.
    InjuryType TEXT, -- Type of injury (e.g., "Sprained Ankle", "Concussion"). 50-100 distinct values.
    Severity TEXT, -- Severity of the injury ("Minor", "Moderate", "Severe"). 3 distinct values.
    RecoveryTimeWeeks INTEGER -- Estimated recovery time in weeks. Range 1-52, log-normally distributed.
);
-- JOIN GRAPH: "Injuries": ["Players"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="Injuries">
-- - Description: This table contains information about player injuries
-- - Data:
-- -- InjuryID: Primary key for the Injuries table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- InjuryDate: Date of the injury. Range from 1950 to present.
-- -- InjuryType: Type of injury (e.g., "Sprained Ankle", "Concussion"). 50-100 distinct values.
-- -- Severity: Severity of the injury ("Minor", "Moderate", "Severe"). 3 distinct values.
-- -- RecoveryTimeWeeks: Estimated recovery time in weeks. Range 1-52, log-normally distributed.
-- - Relationships:
-- -- (Injuries.PlayerID → Players.PlayerID) - Table containing information about individual players
-- </METADATA>
-- 

-- File: mysports.Injuries.txt 
-- InjuryID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- InjuryDate: TEXT FROM 2017-08-26 TO 2021-03-20 like ['2021-03-20', '2021-01-05', '2020-11-08', '2020-10-15', '2020-09-25', '2020-08-10', '2020-07-07', '2019-10-19', '2019-04-14', '2017-08-26']
-- InjuryType: TEXT FROM Ankle Sprain TO Shoulder Strain like ['Shoulder Strain', 'Knee Surgery', 'Knee Sprain', 'Hand Injury', 'Hamstring Strain', 'Concussion', 'Calf Strain', 'COVID-19', 'Back Strain', 'Ankle Sprain']
-- Severity: TEXT has only NULL values
-- RecoveryTimeWeeks: INTEGER has only NULL values
-- 
