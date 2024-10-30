CREATE TABLE AwardWinners ( -- This table contains information about award winners
    AwardWinnerID INTEGER PRIMARY KEY,
    AwardID INTEGER, -- References AwardID in Awards table. Range depends on number of awards.
    WinnerID INTEGER, -- References ID of the winner (could be PlayerID or TeamID).
    WinnerType TEXT, -- Type of winner ("Player", "Team"). 2 distinct values.
    Year INTEGER, -- Year the award was won. Range from 1950 to present.
    AchievementDetails TEXT -- Details of the achievement (e.g., "28 goals in 38 games"). Many distinct values.
);
-- JOIN GRAPH: "AwardWinners": ["Awards", "Players", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="AwardWinners">
-- - Description: This table contains information about award winners
-- - Data:
-- -- AwardWinnerID: Primary key for the AwardWinners table
-- -- AwardID: References AwardID in Awards table. Range depends on number of awards.
-- -- WinnerID: References ID of the winner (could be PlayerID or TeamID).
-- -- WinnerType: Type of winner ("Player", "Team"). 2 distinct values.
-- -- Year: Year the award was won. Range from 1950 to present.
-- -- AchievementDetails: Details of the achievement (e.g., "28 goals in 38 games"). Many distinct values.
-- - Relationships:
-- -- (AwardWinners.AwardID → Awards.AwardID) - Table containing information about sports awards
-- -- (AwardWinners.WinnerID → Players.PlayerID) - Table containing information about individual players (when WinnerType is "Player")
-- -- (AwardWinners.WinnerID → Teams.TeamID) - Table containing information about sports teams (when WinnerType is "Team")
-- </METADATA>
-- 

-- File: mysports.AwardWinners.txt 
-- AwardWinnerID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- AwardID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- WinnerID: INTEGER FROM 1 TO 7 like [7, 3, 2, 6, 5, 4, 1]
-- WinnerType: TEXT FROM Player TO Team like ['Player', 'Team']
-- Year: INTEGER FROM 2018 TO 2021 like [2020, 2021, 2019, 2018]
-- AchievementDetails: TEXT FROM 2.43 ERA, 213 strikeouts in 181 innings TO Defeated Tampa Bay Rays in 6 games like ['Defeated Tampa Bay Rays in 6 games', 'Defeated Novak Djokovic in 5 sets', 'Defeated Montreal Canadiens in 5 games', 'Defeated Miami Heat in 6 games', 'Defeated Croatia 4-2 in the final', '51 goals and 21 assists in all competitions', '37 goals in 34 matches', '29.7 points, 11.8 rebounds, 8.9 assists per game', '201 yards, 3 touchdowns in Super Bowl LV', '2.43 ERA, 213 strikeouts in 181 innings']
-- 
