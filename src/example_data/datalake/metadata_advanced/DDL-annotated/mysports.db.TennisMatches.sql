CREATE TABLE TennisMatches ( -- This table contains information about tennis matches
    TennisMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    Player1ID INTEGER, -- References TennisPlayerID in TennisPlayers table. Range depends on number of players.
    Player2ID INTEGER, -- References TennisPlayerID in TennisPlayers table. Range depends on number of players.
    Surface TEXT, -- Court surface (e.g., "Clay", "Grass", "Hard"). 3-5 distinct values.
    Round TEXT -- Tournament round (e.g., "Final", "Semi-Final", "Quarter-Final"). 7-10 distinct values.
);
-- JOIN GRAPH: "TennisMatches": ["Games", "TennisPlayers", "TennisMatchStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="TennisMatches">
-- - Description: This table contains information about tennis matches
-- - Data:
-- -- TennisMatchID: Primary key for the TennisMatches table
-- -- GameID: References GameID in Games table. Range depends on number of games.
-- -- Player1ID: References TennisPlayerID in TennisPlayers table. Range depends on number of players.
-- -- Player2ID: References TennisPlayerID in TennisPlayers table. Range depends on number of players.
-- -- Surface: Court surface (e.g., "Clay", "Grass", "Hard"). 3-5 distinct values.
-- -- Round: Tournament round (e.g., "Final", "Semi-Final", "Quarter-Final"). 7-10 distinct values.
-- - Relationships:
-- -- (TennisMatches.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (TennisMatches.Player1ID → TennisPlayers.TennisPlayerID) - Table containing specific information for tennis players
-- -- (TennisMatches.Player2ID → TennisPlayers.TennisPlayerID) - Table containing specific information for tennis players
-- -- (TennisMatches.TennisMatchID → TennisMatchStats.TennisMatchID) - Table containing statistics for tennis matches
-- </METADATA>
-- 

-- File: mysports.TennisMatches.txt 
-- TennisMatchID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Player1ID: INTEGER FROM 1 TO 9 like [9, 5, 1, 7, 6, 3, 2]
-- Player2ID: INTEGER FROM 1 TO 10 like [8, 4, 10, 7, 6, 3, 2, 1]
-- Surface: TEXT FROM Clay TO Hard like ['Hard', 'Grass', 'Clay']
-- Round: TEXT FROM Final TO Semi-Final like ['Semi-Final', 'Round of 32', 'Round of 16', 'Quarter-Final', 'Final']
-- 
