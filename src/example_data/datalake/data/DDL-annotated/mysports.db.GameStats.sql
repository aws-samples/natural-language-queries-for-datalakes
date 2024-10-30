CREATE TABLE GameStats (
    GameStatID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table
    HomeTeamScore INTEGER, -- Score of the home team
    AwayTeamScore INTEGER, -- Score of the away team
    Duration INTEGER, -- Duration of the game in minutes
    WinnerID INTEGER, -- References TeamID of the winning team
    Period TEXT -- Period or stage of the game (e.g., "Full Time", "First Half", "Overtime")
);
-- JOIN GRAPH: "GameStats": ["Games", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="GameStats">
-- - Description: This table contains statistics for games
-- - Data:
-- -- GameStatID: Primary key for the GameStats table
-- -- GameID: References GameID in Games table
-- -- HomeTeamScore: Score of the home team
-- -- AwayTeamScore: Score of the away team
-- -- Duration: Duration of the game in minutes
-- -- WinnerID: References TeamID of the winning team
-- -- Period: Period or stage of the game (e.g., "Full Time", "First Half", "Overtime")
-- - Relationships:
-- -- (GameStats.GameID → Games.GameID) - Table containing information about individual games or matches
-- -- (GameStats.WinnerID → Teams.TeamID) - Table containing information about sports teams
-- </METADATA>
-- 

-- File: mysports.GameStats.txt 
-- GameStatID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- GameID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- HomeTeamScore: INTEGER FROM 2 TO 180 like [180, 110, 98, 30, 28, 24, 5, 4, 3, 2]
-- AwayTeamScore: INTEGER FROM 1 TO 175 like [1, 175, 105, 102, 22, 21, 17, 3, 2]
-- Duration: INTEGER FROM 80 TO 240 like [180, 150, 240, 210, 90, 80]
-- WinnerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Period: TEXT FROM Full Time TO Full Time like ['Full Time']
-- 
