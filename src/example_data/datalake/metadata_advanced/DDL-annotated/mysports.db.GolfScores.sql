CREATE TABLE GolfScores ( -- This table contains scores for golf tournaments
    GolfScoreID INTEGER PRIMARY KEY,
    GolfTournamentID INTEGER, -- References GolfTournamentID in GolfTournaments table. Range depends on number of tournaments.
    GolfPlayerID INTEGER, -- References GolfPlayerID in GolfPlayers table. Range depends on number of players.
    Round INTEGER, -- Round number. Range 1-4, evenly distributed.
    Score INTEGER -- Score for the round. Range 59-100, normally distributed around 72.
);
-- JOIN GRAPH: "GolfScores": ["GolfTournaments", "GolfPlayers"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GolfScores">
-- - Description: This table contains scores for golf tournaments
-- - Data:
-- -- GolfScoreID: Primary key for the GolfScores table
-- -- GolfTournamentID: References GolfTournamentID in GolfTournaments table. Range depends on number of tournaments.
-- -- GolfPlayerID: References GolfPlayerID in GolfPlayers table. Range depends on number of players.
-- -- Round: Round number. Range 1-4, evenly distributed.
-- -- Score: Score for the round. Range 59-100, normally distributed around 72.
-- - Relationships:
-- -- (GolfScores.GolfTournamentID → GolfTournaments.GolfTournamentID) - Table containing information about golf tournaments
-- -- (GolfScores.GolfPlayerID → GolfPlayers.GolfPlayerID) - Table containing specific information for golf players
-- </METADATA>
-- 

-- File: mysports.GolfScores.txt 
-- GolfScoreID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GolfTournamentID: INTEGER FROM 1 TO 3 like [2, 1, 3]
-- GolfPlayerID: INTEGER FROM 1 TO 3 like [2, 1, 3]
-- Round: INTEGER FROM 1 TO 4 like [2, 1, 4, 3]
-- Score: INTEGER FROM 67 TO 72 like [70, 69, 68, 67, 72, 71]
-- 
