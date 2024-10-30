CREATE TABLE SocialMediaAccounts ( -- This table contains information about social media accounts of players and teams
    AccountID INTEGER PRIMARY KEY,
    EntityID INTEGER, -- References ID of the account owner (could be PlayerID or TeamID).
    EntityType TEXT, -- Type of account owner ("Player", "Team"). 2 distinct values.
    Platform TEXT, -- Social media platform (e.g., "Twitter", "Instagram", "Facebook"). 5-7 distinct values.
    Username TEXT, -- Username on the platform. Many distinct values.
    Followers INTEGER -- Number of followers. Range 100-100000000, log-normally distributed.
);
-- JOIN GRAPH: "SocialMediaAccounts": ["Players", "Teams"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="SocialMediaAccounts">
-- - Description: This table contains information about social media accounts of players and teams
-- - Data:
-- -- AccountID: Primary key for the SocialMediaAccounts table
-- -- EntityID: References ID of the account owner (could be PlayerID or TeamID).
-- -- EntityType: Type of account owner ("Player", "Team"). 2 distinct values.
-- -- Platform: Social media platform (e.g., "Twitter", "Instagram", "Facebook"). 5-7 distinct values.
-- -- Username: Username on the platform. Many distinct values.
-- -- Followers: Number of followers. Range 100-100000000, log-normally distributed.
-- - Relationships:
-- -- (SocialMediaAccounts.EntityID → Players.PlayerID) - Table containing information about individual players (when EntityType is "Player")
-- -- (SocialMediaAccounts.EntityID → Teams.TeamID) - Table containing information about sports teams (when EntityType is "Team")
-- </METADATA>
-- 

-- File: mysports.SocialMediaAccounts.txt 
-- AccountID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- EntityID: INTEGER FROM 1 TO 6 like [4, 3, 2, 1, 6, 5]
-- EntityType: TEXT FROM Player TO Team like ['Player', 'Team']
-- Platform: TEXT FROM Facebook TO Twitter like ['Twitter', 'Instagram', 'Facebook']
-- Username: TEXT FROM @MikeTrout TO TigerWoods like ['TigerWoods', 'NewYorkYankees', 'NewEnglandPatriots', '@sidneycrosby', '@rogerfederer', '@mapleleafs', '@lakers', '@kingjames', '@TomBrady', '@MikeTrout']
-- Followers: INTEGER FROM 1500000 TO 50000000 like [50000000, 15000000, 12500000, 8500000, 7000000, 3000000, 2200000, 2000000, 1800000, 1500000]
-- 
