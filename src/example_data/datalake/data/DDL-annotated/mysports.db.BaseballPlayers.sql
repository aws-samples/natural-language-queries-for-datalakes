CREATE TABLE BaseballPlayers ( -- This table contains specific information for baseball players
    BaseballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Pitcher", "Shortstop"). 9 distinct values.
    BattingHand TEXT, -- Batting hand ("Left", "Right", "Switch"). 3 distinct values.
    ThrowingHand TEXT -- Throwing hand ("Left", "Right"). 2 distinct values.
);
-- JOIN GRAPH: "BaseballPlayers": ["Players", "BaseballTeams", "BaseballPlayerStats"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="BaseballPlayers">
-- - Description: This table contains specific information for baseball players
-- - Data:
-- -- BaseballPlayerID: Primary key for the BaseballPlayers table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- Position: Player's position (e.g., "Pitcher", "Shortstop"). 9 distinct values.
-- -- BattingHand: Batting hand ("Left", "Right", "Switch"). 3 distinct values.
-- -- ThrowingHand: Throwing hand ("Left", "Right"). 2 distinct values.
-- - Relationships:
-- -- (BaseballPlayers.PlayerID → Players.PlayerID) - Table containing information about individual players
-- -- (BaseballPlayers.BaseballPlayerID → BaseballTeams.BaseballPlayerID) - Table containing specific information for baseball teams
-- -- (BaseballPlayers.BaseballPlayerID → BaseballPlayerStats.BaseballPlayerID) - Table containing statistics for baseball players
-- </METADATA>
-- 

-- File: mysports.BaseballPlayers.txt 
-- BaseballPlayerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- Position: TEXT FROM Catcher TO Third Base like ['Pitcher', 'Third Base', 'Shortstop', 'Second Base', 'Right Field', 'Left Field', 'First Base', 'Center Field', 'Catcher']
-- BattingHand: TEXT FROM Left TO Switch like ['Right', 'Left', 'Switch']
-- ThrowingHand: TEXT FROM Left TO Right like ['Right', 'Left']
-- 
