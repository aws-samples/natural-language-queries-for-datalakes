CREATE TABLE GameOfficials ( -- This table links referees to specific games
    GameOfficialID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    RefereeID INTEGER, -- References RefereeID in Referees table. Range depends on number of referees.
    Role TEXT -- Official's role in the game (e.g., "Head Referee", "Assistant Referee"). 3-5 distinct values.
);
-- JOIN GRAPH: "GameOfficials": ["Games", "Referees"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GameOfficials">
-- - Description: This table links referees to specific games
-- - Data:
-- -- GameOfficialID: Primary key for the GameOfficials table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- RefereeID: References RefereeID in Referees table. Range depends on number of referees.
-- -- Role: Official's role in the game (e.g., "Head Referee", "Assistant Referee"). 3-5 distinct values.
-- - Relationships:
-- -- (GameOfficials.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (GameOfficials.RefereeID → Referees.RefereeID) - Table containing information about sports referees
-- </METADATA>
-- 

-- File: mysports.GameOfficials.txt 
-- GameOfficialID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- RefereeID: INTEGER FROM 1 TO 10 like [9, 10, 8, 7, 6, 4, 3, 2, 1]
-- Role: TEXT FROM Assistant Referee TO Head Umpire like ['Head Referee', 'Head Umpire', 'Chair Umpire', 'Assistant Umpire', 'Assistant Referee']
-- 
