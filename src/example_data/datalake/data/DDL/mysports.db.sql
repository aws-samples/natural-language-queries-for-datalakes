CREATE TABLE Sports ( -- This table contains a list of all sports covered in the database
    SportID INTEGER PRIMARY KEY,
    SportName TEXT NOT NULL -- Name of the sport (e.g., "Football", "Basketball", "Tennis"). Typically 10-20 distinct values.
);
-- JOIN GRAPH: "Sports": ["Teams", "Players", "Venues", "Leagues", "Tournaments"]

CREATE TABLE Teams ( -- This table contains information about sports teams
    TeamID INTEGER PRIMARY KEY,
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    TeamName TEXT NOT NULL, -- Full name of the team (e.g., "New York Yankees", "Manchester United"). Typically 100-500 distinct values.
    City TEXT, -- City where the team is based (e.g., "New York", "Manchester"). 50-100 distinct values.
    Country TEXT, -- Country of the team (e.g., "USA", "England"). 20-50 distinct values.
    Founded DATE -- Date when the team was founded. Range from 1800 to present, most values after 1900.
);
-- JOIN GRAPH: "Teams": ["Sports", "Players", "Coaches", "TeamStats", "Games", "Venues"]

CREATE TABLE Players ( -- This table contains information about individual players
    PlayerID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Player's first name (e.g., "LeBron", "Cristiano"). Many distinct values.
    LastName TEXT NOT NULL, -- Player's last name (e.g., "James", "Ronaldo"). Many distinct values.
    DateOfBirth DATE, -- Player's date of birth. Range from 1950 to 2005, evenly distributed.
    Nationality TEXT, -- Player's nationality (e.g., "American", "Portuguese"). 50-100 distinct values.
    Height FLOAT, -- Player's height in cm. Range 150-230, normally distributed around 180.
    Weight FLOAT, -- Player's weight in kg. Range 50-150, normally distributed around 80.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Players": ["Sports", "Teams", "PlayerStats", "Contracts", "Injuries"]

CREATE TABLE Coaches ( -- This table contains information about team coaches
    CoachID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Coach's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Coach's last name. Many distinct values.
    DateOfBirth DATE, -- Coach's date of birth. Range from 1940 to 1990, most values between 1960-1980.
    Nationality TEXT, -- Coach's nationality. 50-100 distinct values.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Coaches": ["Sports", "Teams", "CoachingHistory"]

CREATE TABLE Venues ( -- This table contains information about sports venues
    VenueID INTEGER PRIMARY KEY,
    VenueName TEXT NOT NULL, -- Name of the venue (e.g., "Madison Square Garden", "Wembley Stadium"). Many distinct values.
    City TEXT, -- City where the venue is located. 50-100 distinct values.
    Country TEXT, -- Country where the venue is located. 20-50 distinct values.
    Capacity INTEGER, -- Seating capacity of the venue. Range 1000-100000, log-normally distributed.
    Opened DATE, -- Date when the venue was opened. Range from 1800 to present, most values after 1950.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Venues": ["Sports", "Teams", "Games", "Tournaments"]

CREATE TABLE Leagues ( -- This table contains information about sports leagues
    LeagueID INTEGER PRIMARY KEY,
    LeagueName TEXT NOT NULL, -- Name of the league (e.g., "NBA", "Premier League"). 20-50 distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    Country TEXT, -- Country where the league operates. 20-50 distinct values.
    FoundedYear INTEGER -- Year the league was founded. Range 1850 to present, most values after 1900.
);
-- JOIN GRAPH: "Leagues": ["Sports", "Teams", "Seasons", "Tournaments"]

CREATE TABLE Seasons ( -- This table contains information about sports seasons
    SeasonID INTEGER PRIMARY KEY,
    LeagueID INTEGER, -- References LeagueID in Leagues table. Range depends on number of leagues.
    StartDate DATE, -- Start date of the season. Typically in range 1950 to present.
    EndDate DATE -- End date of the season. Typically in range 1950 to present, always after StartDate.
);
-- JOIN GRAPH: "Seasons": ["Leagues", "Games", "TeamStats", "PlayerStats"]

CREATE TABLE Games ( -- This table contains information about individual games or matches
    GameID INTEGER PRIMARY KEY,
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    HomeTeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    AwayTeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    VenueID INTEGER, -- References VenueID in Venues table. Range depends on number of venues.
    GameDate DATE, -- Date of the game. Range from 1950 to present, most recent years more frequent.
    SeasonID INTEGER, -- References SeasonID in Seasons table. Range depends on number of seasons.
    Attendance INTEGER -- Number of attendees. Range 0-100000, depends on venue capacity.
);
-- JOIN GRAPH: "Games": ["Sports", "Teams", "Venues", "Seasons", "GameStats", "Tickets", "Bets"]

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

CREATE TABLE TeamStats ( -- This table contains aggregated statistics for teams in a season
    TeamStatID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    SeasonID INTEGER, -- References SeasonID in Seasons table. Range depends on number of seasons.
    Wins INTEGER, -- Number of wins. Range 0-100, typically 0-50.
    Losses INTEGER, -- Number of losses. Range 0-100, typically 0-50.
    Draws INTEGER, -- Number of draws (if applicable). Range 0-50, many sports will have 0.
    PointsScored INTEGER, -- Total points scored. Range 0-10000, depends on sport.
    PointsConceded INTEGER -- Total points conceded. Range 0-10000, depends on sport.
);
-- JOIN GRAPH: "TeamStats": ["Teams", "Seasons"]

CREATE TABLE PlayerStats (
    PlayerStatID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table
    SeasonID INTEGER, -- References SeasonID in Seasons table
    TeamID INTEGER, -- References TeamID in Teams table
    GamesPlayed INTEGER, -- Number of games played
    MinutesPlayed INTEGER, -- Total minutes played
    PointsScored INTEGER, -- Total points scored
    Period TEXT, -- Period of the season (e.g., "Regular Season", "Playoffs")
    Assists INTEGER -- Number of assists
);
-- JOIN GRAPH: "PlayerStats": ["Players", "Seasons", "Teams"]

CREATE TABLE Contracts ( -- This table contains information about player contracts
    ContractID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    StartDate DATE, -- Start date of the contract. Range from 1950 to present.
    EndDate DATE, -- End date of the contract. Range from 1950 to future, always after StartDate.
    AnnualSalary DECIMAL(15,2) -- Annual salary in dollars. Range 10000-50000000, log-normally distributed.
);
-- JOIN GRAPH: "Contracts": ["Players", "Teams"]

CREATE TABLE Tournaments ( -- This table contains information about sports tournaments
    TournamentID INTEGER PRIMARY KEY,
    TournamentName TEXT NOT NULL, -- Name of the tournament (e.g., "World Cup", "Wimbledon"). 50-100 distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    StartDate DATE, -- Start date of the tournament. Range from 1950 to present.
    EndDate DATE, -- End date of the tournament. Range from 1950 to present, always after StartDate.
    VenueID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "Tournaments": ["Sports", "Venues", "Games", "Teams"]

CREATE TABLE Tickets ( -- This table contains information about ticket sales
    TicketID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    SeatNumber TEXT, -- Seat number (e.g., "A12", "B34"). Many distinct values.
    Price DECIMAL(10,2), -- Price of the ticket in dollars. Range 10-1000, log-normally distributed.
    PurchaseDate DATE, -- Date of ticket purchase. Range from past to future, clustered around game dates.
    CustomerID INTEGER -- References CustomerID in Customers table. Range depends on number of customers.
);
-- JOIN GRAPH: "Tickets": ["Games", "Customers"]

CREATE TABLE Customers ( -- This table contains information about ticket customers
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Customer's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Customer's last name. Many distinct values.
    Email TEXT, -- Customer's email address. Many distinct values, unique.
    Phone TEXT, -- Customer's phone number. Many distinct values.
    Address TEXT -- Customer's address. Many distinct values.
);
-- JOIN GRAPH: "Customers": ["Tickets", "Bets"]

CREATE TABLE Bets ( -- This table contains information about sports bets
    BetID INTEGER PRIMARY KEY,
    CustomerID INTEGER, -- References CustomerID in Customers table. Range depends on number of customers.
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    BetType TEXT, -- Type of bet (e.g., "Win", "Over/Under", "Spread"). 10-20 distinct values.
    BetAmount DECIMAL(10,2), -- Amount of the bet in dollars. Range 1-10000, log-normally distributed.
    Odds DECIMAL(10,2), -- Betting odds. Range typically 1.01 to 1000.00.
    Outcome TEXT -- Outcome of the bet ("Win", "Loss", "Push"). 3 distinct values.
);
-- JOIN GRAPH: "Bets": ["Customers", "Games"]

CREATE TABLE FootballTeams ( -- This table contains specific information for football teams
    FootballTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    Formation TEXT, -- Preferred formation (e.g., "4-4-2", "3-5-2"). 10-20 distinct values.
    LeaguePosition INTEGER -- Current position in the league. Range 1-20, evenly distributed.
);
-- JOIN GRAPH: "FootballTeams": ["Teams", "FootballPlayers"]

CREATE TABLE FootballPlayers ( -- This table contains specific information for football players
    FootballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Striker", "Midfielder"). 10-15 distinct values.
    PreferredFoot TEXT -- Preferred foot ("Left", "Right", "Both"). 3 distinct values.
);
-- JOIN GRAPH: "FootballPlayers": ["Players", "FootballTeams", "FootballPlayerStats"]

CREATE TABLE FootballPlayerStats ( -- This table contains statistics for football players
    FootballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Goals INTEGER, -- Number of goals scored. Range 0-50, most values under 20.
    Assists INTEGER, -- Number of assists. Range 0-30, most values under 15.
    YellowCards INTEGER, -- Number of yellow cards received. Range 0-20, most values under 10.
    RedCards INTEGER -- Number of red cards received. Range 0-5, most values 0 or 1.
);
-- JOIN GRAPH: "FootballPlayerStats": ["PlayerStats", "FootballPlayers"]

CREATE TABLE FootballGameStats ( -- This table contains statistics for football games
    FootballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    Possession FLOAT, -- Ball possession percentage for home team. Range 0-100, normally distributed around 50.
    Corners INTEGER, -- Number of corners for home team. Range 0-20, most values under 10.
    Fouls INTEGER, -- Number of fouls committed by home team. Range 0-30, most values 10-20.
    Offsides INTEGER -- Number of offsides for home team. Range 0-10, most values under 5.
);
-- JOIN GRAPH: "FootballGameStats": ["GameStats"]

CREATE TABLE BasketballTeams ( -- This table contains specific information for basketball teams
    BasketballTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    HomeCourtAdvantage FLOAT, -- Home court advantage factor. Range 1.0-1.5, normally distributed around 1.2.
    ConferenceRank INTEGER -- Rank within the conference. Range 1-15, evenly distributed.
);
-- JOIN GRAPH: "BasketballTeams": ["Teams", "BasketballPlayers"]

CREATE TABLE BasketballPlayers ( -- This table contains specific information for basketball players
    BasketballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Point Guard", "Center"). 5 distinct values.
    JerseyNumber INTEGER -- Player's jersey number. Range 0-99, some numbers more common than others.
);
-- JOIN GRAPH: "BasketballPlayers": ["Players", "BasketballTeams", "BasketballPlayerStats"]

CREATE TABLE BasketballPlayerStats ( -- This table contains statistics for basketball players
    BasketballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    PointsPerGame FLOAT, -- Average points per game. Range 0-40, most values 5-25.
    Rebounds INTEGER, -- Total rebounds. Range 0-1000, depends on games played and position.
    Assists INTEGER, -- Total assists. Range 0-800, depends on games played and position.
    Steals INTEGER, -- Total steals. Range 0-200, most values under 100.
    Blocks INTEGER -- Total blocks. Range 0-200, most values under 100.
);
-- JOIN GRAPH: "BasketballPlayerStats": ["PlayerStats", "BasketballPlayers"]

CREATE TABLE BasketballGameStats ( -- This table contains statistics for basketball games
    BasketballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamRebounds INTEGER, -- Rebounds for home team. Range 20-80, normally distributed around 40.
    AwayTeamRebounds INTEGER, -- Rebounds for away team. Range 20-80, normally distributed around 40.
    HomeTeamAssists INTEGER, -- Assists for home team. Range 10-40, normally distributed around 25.
    AwayTeamAssists INTEGER -- Assists for away team. Range 10-40, normally distributed around 25.
);
-- JOIN GRAPH: "BasketballGameStats": ["GameStats"]

CREATE TABLE BaseballTeams ( -- This table contains specific information for baseball teams
    BaseballTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    HomeRunFactor FLOAT, -- Home run factor for home stadium. Range 0.8-1.2, normally distributed around 1.0.
    DivisionRank INTEGER -- Rank within the division. Range 1-5, evenly distributed.
);
-- JOIN GRAPH: "BaseballTeams": ["Teams", "BaseballPlayers"]

CREATE TABLE BaseballPlayers ( -- This table contains specific information for baseball players
    BaseballPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Pitcher", "Shortstop"). 9 distinct values.
    BattingHand TEXT, -- Batting hand ("Left", "Right", "Switch"). 3 distinct values.
    ThrowingHand TEXT -- Throwing hand ("Left", "Right"). 2 distinct values.
);
-- JOIN GRAPH: "BaseballPlayers": ["Players", "BaseballTeams", "BaseballPlayerStats"]

CREATE TABLE BaseballPlayerStats ( -- This table contains statistics for baseball players
    BaseballPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    BattingAverage FLOAT, -- Batting average. Range 0.000-0.400, most values 0.200-0.300.
    HomeRuns INTEGER, -- Number of home runs. Range 0-73, most values under 30.
    RBI INTEGER, -- Runs batted in. Range 0-200, most values under 100.
    ERA FLOAT, -- Earned run average (for pitchers). Range 0.00-10.00, most values 2.00-5.00.
    Strikeouts INTEGER -- Number of strikeouts (for pitchers). Range 0-383, depends on games played.
);
-- JOIN GRAPH: "BaseballPlayerStats": ["PlayerStats", "BaseballPlayers"]

CREATE TABLE BaseballGameStats ( -- This table contains statistics for baseball games
    BaseballGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamHits INTEGER, -- Hits for home team. Range 0-25, most values 4-12.
    AwayTeamHits INTEGER, -- Hits for away team. Range 0-25, most values 4-12.
    HomeTeamErrors INTEGER, -- Errors for home team. Range 0-5, most values 0-2.
    AwayTeamErrors INTEGER -- Errors for away team. Range 0-5, most values 0-2.
);
-- JOIN GRAPH: "BaseballGameStats": ["GameStats"]

CREATE TABLE TennisPlayers ( -- This table contains specific information for tennis players
    TennisPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Handedness TEXT, -- Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
    PlayingStyle TEXT -- Playing style (e.g., "Serve-and-Volley", "Baseline"). 5-10 distinct values.
);
-- JOIN GRAPH: "TennisPlayers": ["Players", "TennisPlayerStats"]

CREATE TABLE TennisPlayerStats ( -- This table contains statistics for tennis players
    TennisPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    ATPRanking INTEGER, -- ATP ranking. Range 1-2000, lower numbers less frequent.
    GrandSlamTitles INTEGER, -- Number of Grand Slam titles won. Range 0-20, most values 0.
    CareerTitles INTEGER, -- Total career titles. Range 0-100, most values under 20.
    WinLossRatio FLOAT -- Win-loss ratio. Range 0.000-1.000, normally distributed around 0.500.
);
-- JOIN GRAPH: "TennisPlayerStats": ["PlayerStats", "TennisPlayers"]

CREATE TABLE TennisMatches ( -- This table contains information about tennis matches
    TennisMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    Player1ID INTEGER, -- References TennisPlayerID in TennisPlayers table. Range depends on number of players.
    Player2ID INTEGER, -- References TennisPlayerID in TennisPlayers table. Range depends on number of players.
    Surface TEXT, -- Court surface (e.g., "Clay", "Grass", "Hard"). 3-5 distinct values.
    Round TEXT -- Tournament round (e.g., "Final", "Semi-Final", "Quarter-Final"). 7-10 distinct values.
);
-- JOIN GRAPH: "TennisMatches": ["Games", "TennisPlayers", "TennisMatchStats"]

CREATE TABLE TennisMatchStats ( -- This table contains statistics for tennis matches
    TennisMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    Player1Aces INTEGER, -- Number of aces for Player 1. Range 0-50, most values under 20.
    Player2Aces INTEGER, -- Number of aces for Player 2. Range 0-50, most values under 20.
    Player1DoubleFaults INTEGER, -- Number of double faults for Player 1. Range 0-20, most values under 10.
    Player2DoubleFaults INTEGER -- Number of double faults for Player 2. Range 0-20, most values under 10.
);
-- JOIN GRAPH: "TennisMatchStats": ["GameStats", "TennisMatches"]

CREATE TABLE GolfPlayers ( -- This table contains specific information for golf players
    GolfPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    ProSince DATE, -- Date when player turned professional. Range from 1950 to present.
    Handedness TEXT -- Player's dominant hand ("Left", "Right"). 2 distinct values, about 90% "Right".
);
-- JOIN GRAPH: "GolfPlayers": ["Players", "GolfPlayerStats"]

CREATE TABLE GolfPlayerStats ( -- This table contains statistics for golf players
    GolfPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    WorldRanking INTEGER, -- World Golf Ranking. Range 1-1000, lower numbers less frequent.
    SeasonEarnings DECIMAL(15,2), -- Season earnings in dollars. Range 0-20000000, log-normally distributed.
    DrivingAccuracy FLOAT, -- Driving accuracy percentage. Range 0.00-100.00, normally distributed around 60.
    GreenInRegulationPercentage FLOAT -- Green in regulation percentage. Range 0.00-100.00, normally distributed around 65.
);
-- JOIN GRAPH: "GolfPlayerStats": ["PlayerStats", "GolfPlayers"]

CREATE TABLE GolfTournaments ( -- This table contains information about golf tournaments
    GolfTournamentID INTEGER PRIMARY KEY,
    TournamentID INTEGER, -- References TournamentID in Tournaments table. Range depends on number of tournaments.
    CourseID INTEGER, -- References CourseID in GolfCourses table. Range depends on number of courses.
    PurseAmount DECIMAL(15,2), -- Total purse amount in dollars. Range 100000-20000000, log-normally distributed.
    ParScore INTEGER -- Par score for the course. Range 68-72, most values 70-72.
);
-- JOIN GRAPH: "GolfTournaments": ["Tournaments", "GolfCourses", "GolfScores"]

CREATE TABLE GolfCourses ( -- This table contains information about golf courses
    CourseID INTEGER PRIMARY KEY,
    CourseName TEXT NOT NULL, -- Name of the golf course. Many distinct values.
    Location TEXT, -- Location of the course. Many distinct values.
    Holes INTEGER, -- Number of holes. Usually 18, sometimes 9.
    Par INTEGER, -- Par for the course. Range 68-72, most values 70-72.
    Length INTEGER -- Length of the course in yards. Range 5000-8000, normally distributed around 7000.
);
-- JOIN GRAPH: "GolfCourses": ["GolfTournaments", "GolfScores"]

CREATE TABLE GolfScores ( -- This table contains scores for golf tournaments
    GolfScoreID INTEGER PRIMARY KEY,
    GolfTournamentID INTEGER, -- References GolfTournamentID in GolfTournaments table. Range depends on number of tournaments.
    GolfPlayerID INTEGER, -- References GolfPlayerID in GolfPlayers table. Range depends on number of players.
    Round INTEGER, -- Round number. Range 1-4, evenly distributed.
    Score INTEGER -- Score for the round. Range 59-100, normally distributed around 72.
);
-- JOIN GRAPH: "GolfScores": ["GolfTournaments", "GolfPlayers"]

CREATE TABLE HockeyTeams ( -- This table contains specific information for hockey teams
    HockeyTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ConferenceRank INTEGER, -- Rank within the conference. Range 1-16, evenly distributed.
    PenaltyKillPercentage FLOAT -- Penalty kill success rate. Range 0.00-100.00, normally distributed around 80.
);
-- JOIN GRAPH: "HockeyTeams": ["Teams", "HockeyPlayers"]

CREATE TABLE HockeyPlayers ( -- This table contains specific information for hockey players
    HockeyPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Center", "Defenseman"). 6 distinct values.
    ShootingSide TEXT -- Shooting side ("Left", "Right"). 2 distinct values, about 60% "Left".
);
-- JOIN GRAPH: "HockeyPlayers": ["Players", "HockeyTeams", "HockeyPlayerStats"]

CREATE TABLE HockeyPlayerStats ( -- This table contains statistics for hockey players
    HockeyPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Goals INTEGER, -- Number of goals scored. Range 0-100, most values under 50.
    Assists INTEGER, -- Number of assists. Range 0-150, depends on position and games played.
    PenaltyMinutes INTEGER, -- Penalty minutes. Range 0-300, log-normally distributed.
    PlusMinus INTEGER -- Plus/minus statistic. Range -50 to 50, normally distributed around 0.
);
-- JOIN GRAPH: "HockeyPlayerStats": ["PlayerStats", "HockeyPlayers"]

CREATE TABLE HockeyGameStats ( -- This table contains statistics for hockey games
    HockeyGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamShots INTEGER, -- Shots on goal for home team. Range 15-60, normally distributed around 30.
    AwayTeamShots INTEGER, -- Shots on goal for away team. Range 15-60, normally distributed around 30.
    HomeTeamPenaltyMinutes INTEGER, -- Penalty minutes for home team. Range 0-40, most values under 20.
    AwayTeamPenaltyMinutes INTEGER -- Penalty minutes for away team. Range 0-40, most values under 20.
);
-- JOIN GRAPH: "HockeyGameStats": ["GameStats"]

CREATE TABLE SoccerTeams ( -- This table contains specific information for soccer teams
    SoccerTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    LeaguePosition INTEGER, -- Current position in the league. Range 1-20, evenly distributed.
    GoalDifference INTEGER -- Goal difference (goals scored minus goals conceded). Range -100 to 100, normally distributed around 0.
);
-- JOIN GRAPH: "SoccerTeams": ["Teams", "SoccerPlayers"]

CREATE TABLE SoccerPlayers ( -- This table contains specific information for soccer players
    SoccerPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Forward", "Midfielder"). 4-6 distinct values.
    PreferredFoot TEXT -- Preferred foot ("Left", "Right", "Both"). 3 distinct values, about 70% "Right".
);
-- JOIN GRAPH: "SoccerPlayers": ["Players", "SoccerTeams", "SoccerPlayerStats"]

CREATE TABLE SoccerPlayerStats ( -- This table contains statistics for soccer players
    SoccerPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Goals INTEGER, -- Number of goals scored. Range 0-50, most values under 20.
    Assists INTEGER, -- Number of assists. Range 0-30, most values under 15.
    YellowCards INTEGER, -- Number of yellow cards received. Range 0-20, most values under 10.
    RedCards INTEGER -- Number of red cards received. Range 0-5, most values 0 or 1.
);
-- JOIN GRAPH: "SoccerPlayerStats": ["PlayerStats", "SoccerPlayers"]

CREATE TABLE SoccerGameStats ( -- This table contains statistics for soccer games
    SoccerGameStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamPossession FLOAT, -- Ball possession percentage for home team. Range 0-100, normally distributed around 50.
    AwayTeamPossession FLOAT, -- Ball possession percentage for away team. Range 0-100, normally distributed around 50.
    HomeTeamShots INTEGER, -- Shots on goal for home team. Range 0-30, most values 5-20.
    AwayTeamShots INTEGER -- Shots on goal for away team. Range 0-30, most values 5-20.
);
-- JOIN GRAPH: "SoccerGameStats": ["GameStats"]

CREATE TABLE CricketTeams ( -- This table contains specific information for cricket teams
    CricketTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ICCRanking INTEGER, -- ICC ranking of the team. Range 1-20, lower numbers less frequent.
    HomeGroundID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "CricketTeams": ["Teams", "CricketPlayers", "Venues"]

CREATE TABLE CricketPlayers ( -- This table contains specific information for cricket players
    CricketPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    BattingStyle TEXT, -- Batting style (e.g., "Right-handed", "Left-handed"). 2 distinct values, about 70% "Right-handed".
    BowlingStyle TEXT -- Bowling style (e.g., "Right-arm fast", "Left-arm spin"). 8-10 distinct values.
);
-- JOIN GRAPH: "CricketPlayers": ["Players", "CricketTeams", "CricketPlayerStats"]

CREATE TABLE CricketPlayerStats ( -- This table contains statistics for cricket players
    CricketPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    BattingAverage FLOAT, -- Batting average. Range 0-100, most values 20-50.
    BowlingAverage FLOAT, -- Bowling average. Range 10-100, most values 20-40.
    Centuries INTEGER, -- Number of centuries scored. Range 0-100, most values under 20.
    Wickets INTEGER -- Number of wickets taken. Range 0-1000, depends on player role.
);
-- JOIN GRAPH: "CricketPlayerStats": ["PlayerStats", "CricketPlayers"]

CREATE TABLE CricketMatches ( -- This table contains information about cricket matches
    CricketMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    Format TEXT, -- Match format (e.g., "Test", "ODI", "T20"). 3-5 distinct values.
    Overs INTEGER -- Number of overs in the match. Common values: 20, 50, or 450 (for Test matches).
);
-- JOIN GRAPH: "CricketMatches": ["Games", "CricketMatchStats"]

CREATE TABLE CricketMatchStats ( -- This table contains statistics for cricket matches
    CricketMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamRuns INTEGER, -- Runs scored by home team. Range 50-700, depends on match format.
    AwayTeamRuns INTEGER, -- Runs scored by away team. Range 50-700, depends on match format.
    HomeTeamWickets INTEGER, -- Wickets lost by home team. Range 0-10.
    AwayTeamWickets INTEGER -- Wickets lost by away team. Range 0-10.
);
-- JOIN GRAPH: "CricketMatchStats": ["GameStats", "CricketMatches"]

CREATE TABLE RugbyTeams ( -- This table contains specific information for rugby teams
    RugbyTeamID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    WorldRanking INTEGER, -- World Rugby ranking. Range 1-20, lower numbers less frequent.
    HomeGroundID INTEGER -- References VenueID in Venues table. Range depends on number of venues.
);
-- JOIN GRAPH: "RugbyTeams": ["Teams", "RugbyPlayers", "Venues"]

CREATE TABLE RugbyPlayers ( -- This table contains specific information for rugby players
    RugbyPlayerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Position TEXT, -- Player's position (e.g., "Fly-half", "Prop"). 15 distinct values.
    Caps INTEGER -- Number of international appearances. Range 0-150, most values under 50.
);
-- JOIN GRAPH: "RugbyPlayers": ["Players", "RugbyTeams", "RugbyPlayerStats"]

CREATE TABLE RugbyPlayerStats ( -- This table contains statistics for rugby players
    RugbyPlayerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Tries INTEGER, -- Number of tries scored. Range 0-50, most values under 20.
    Conversions INTEGER, -- Number of conversions. Range 0-100, depends on player role.
    PenaltyGoals INTEGER, -- Number of penalty goals. Range 0-100, depends on player role.
    TacklesMade INTEGER -- Number of tackles made. Range 0-300, depends on position and games played.
);
-- JOIN GRAPH: "RugbyPlayerStats": ["PlayerStats", "RugbyPlayers"]

CREATE TABLE RugbyMatchStats ( -- This table contains statistics for rugby matches
    RugbyMatchStatID INTEGER PRIMARY KEY,
    GameStatID INTEGER, -- References GameStatID in GameStats table. Range depends on number of game stats.
    HomeTeamTries INTEGER, -- Number of tries scored by home team. Range 0-10, most values 1-5.
    AwayTeamTries INTEGER, -- Number of tries scored by away team. Range 0-10, most values 1-5.
    HomeTeamPenalties INTEGER, -- Number of penalties scored by home team. Range 0-10, most values 1-5.
    AwayTeamPenalties INTEGER -- Number of penalties scored by away team. Range 0-10, most values 1-5.
);
-- JOIN GRAPH: "RugbyMatchStats": ["GameStats"]

CREATE TABLE BoxingMatches ( -- This table contains information about boxing matches
    BoxingMatchID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    WeightClass TEXT, -- Weight class of the match (e.g., "Heavyweight", "Welterweight"). 17 distinct values.
    Rounds INTEGER, -- Scheduled number of rounds. Common values: 4, 6, 8, 10, 12.
    Title TEXT -- Title at stake, if any (e.g., "WBA Heavyweight", "IBF Welterweight"). Many distinct values, often NULL.
);
-- JOIN GRAPH: "BoxingMatches": ["Games", "BoxingMatchResults"]

CREATE TABLE Boxers ( -- This table contains specific information for boxers
    BoxerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Stance TEXT, -- Boxing stance ("Orthodox", "Southpaw"). 2 distinct values, about 90% "Orthodox".
    ReachInches FLOAT -- Boxer's reach in inches. Range 60-90, normally distributed around 70.
);
-- JOIN GRAPH: "Boxers": ["Players", "BoxingMatchResults", "BoxerStats"]

CREATE TABLE BoxerStats ( -- This table contains statistics for boxers
    BoxerStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Wins INTEGER, -- Number of wins. Range 0-100, depends on career length.
    Losses INTEGER, -- Number of losses. Range 0-50, usually less than wins.
    Draws INTEGER, -- Number of draws. Range 0-10, most values 0-2.
    KOs INTEGER -- Number of knockout wins. Range 0-80, usually less than total wins.
);
-- JOIN GRAPH: "BoxerStats": ["PlayerStats", "Boxers"]

CREATE TABLE BoxingMatchResults ( -- This table contains results of boxing matches
    BoxingMatchResultID INTEGER PRIMARY KEY,
    BoxingMatchID INTEGER, -- References BoxingMatchID in BoxingMatches table. Range depends on number of matches.
    WinnerID INTEGER, -- References BoxerID in Boxers table. Range depends on number of boxers.
    LoserID INTEGER, -- References BoxerID in Boxers table. Range depends on number of boxers.
    Result TEXT, -- Result of the match (e.g., "KO", "TKO", "Decision"). 5-7 distinct values.
    RoundEnded INTEGER -- Round in which the match ended. Range 1-12, depends on scheduled rounds.
);
-- JOIN GRAPH: "BoxingMatchResults": ["BoxingMatches", "Boxers"]

CREATE TABLE MMAFights ( -- This table contains information about MMA fights
    MMAFightID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    WeightClass TEXT, -- Weight class of the fight (e.g., "Heavyweight", "Lightweight"). 8-10 distinct values.
    Rounds INTEGER, -- Scheduled number of rounds. Common values: 3, 5.
    Title TEXT -- Title at stake, if any (e.g., "UFC Heavyweight Championship"). Many distinct values, often NULL.
);
-- JOIN GRAPH: "MMAFights": ["Games", "MMAFightResults"]

CREATE TABLE MMAFighters ( -- This table contains specific information for MMA fighters
    MMAFighterID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Stance TEXT, -- Fighting stance (e.g., "Orthodox", "Southpaw", "Switch"). 3-4 distinct values.
    ReachInches FLOAT -- Fighter's reach in inches. Range 60-90, normally distributed around 70.
);
-- JOIN GRAPH: "MMAFighters": ["Players", "MMAFightResults", "MMAFighterStats"]

CREATE TABLE MMAFighterStats ( -- This table contains statistics for MMA fighters
    MMAFighterStatID INTEGER PRIMARY KEY,
    PlayerStatID INTEGER, -- References PlayerStatID in PlayerStats table. Range depends on number of player stats.
    Wins INTEGER, -- Number of wins. Range 0-50, depends on career length.
    Losses INTEGER, -- Number of losses. Range 0-30, usually less than wins.
    Draws INTEGER, -- Number of draws. Range 0-5, most values 0-1.
    KOTKOs INTEGER -- Number of knockout/technical knockout wins. Range 0-30, usually less than total wins.
);
-- JOIN GRAPH: "MMAFighterStats": ["PlayerStats", "MMAFighters"]

CREATE TABLE MMAFightResults ( -- This table contains results of MMA fights
    MMAFightResultID INTEGER PRIMARY KEY,
    MMAFightID INTEGER, -- References MMAFightID in MMAFights table. Range depends on number of fights.
    WinnerID INTEGER, -- References MMAFighterID in MMAFighters table. Range depends on number of fighters.
    LoserID INTEGER, -- References MMAFighterID in MMAFighters table. Range depends on number of fighters.
    Result TEXT, -- Result of the fight (e.g., "KO", "Submission", "Decision"). 5-7 distinct values.
    RoundEnded INTEGER -- Round in which the fight ended. Range 1-5, depends on scheduled rounds.
);
-- JOIN GRAPH: "MMAFightResults": ["MMAFights", "MMAFighters"]

CREATE TABLE TrackAndFieldEvents ( -- This table contains information about track and field events
    EventID INTEGER PRIMARY KEY,
    EventName TEXT NOT NULL, -- Name of the event (e.g., "100m Sprint", "Long Jump"). 20-30 distinct values.
    EventType TEXT, -- Type of event ("Track", "Field"). 2 distinct values.
    WorldRecord FLOAT, -- Current world record for the event. Range depends on the specific event.
    WorldRecordHolderID INTEGER -- References PlayerID in Players table. Range depends on number of players.
);
-- JOIN GRAPH: "TrackAndFieldEvents": ["Players", "TrackAndFieldResults"]

CREATE TABLE TrackAndFieldAthletes ( -- This table contains specific information for track and field athletes
    TrackAndFieldAthleteID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Specialization TEXT -- Athlete's specialization (e.g., "Sprinter", "Long Distance", "Jumper"). 10-15 distinct values.
);
-- JOIN GRAPH: "TrackAndFieldAthletes": ["Players", "TrackAndFieldResults"]

CREATE TABLE TrackAndFieldResults ( -- This table contains results of track and field events
    ResultID INTEGER PRIMARY KEY,
    EventID INTEGER, -- References EventID in TrackAndFieldEvents table. Range depends on number of events.
    AthleteID INTEGER, -- References TrackAndFieldAthleteID in TrackAndFieldAthletes table. Range depends on number of athletes.
    CompetitionDate DATE, -- Date of the competition. Range from 1950 to present.
    Result FLOAT, -- Result of the event (time in seconds or distance in meters). Range depends on the specific event.
    Rank INTEGER -- Athlete's rank in the event. Range typically 1-20.
);
-- JOIN GRAPH: "TrackAndFieldResults": ["TrackAndFieldEvents", "TrackAndFieldAthletes"]

CREATE TABLE SwimmingEvents ( -- This table contains information about swimming events
    EventID INTEGER PRIMARY KEY,
    EventName TEXT NOT NULL, -- Name of the event (e.g., "100m Freestyle", "200m Butterfly"). 20-30 distinct values.
    StrokeType TEXT, -- Type of stroke ("Freestyle", "Butterfly", "Backstroke", "Breaststroke", "Medley"). 5 distinct values.
    Distance INTEGER, -- Distance of the event in meters. Common values: 50, 100, 200, 400, 800, 1500.
    WorldRecord FLOAT, -- Current world record for the event in seconds. Range 20-1000, depends on event.
    WorldRecordHolderID INTEGER -- References PlayerID in Players table. Range depends on number of players.
);
-- JOIN GRAPH: "SwimmingEvents": ["Players", "SwimmingResults"]

CREATE TABLE Swimmers ( -- This table contains specific information for swimmers
    SwimmerID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    Specialization TEXT -- Swimmer's specialization (e.g., "Freestyle", "Butterfly"). 5-7 distinct values.
);
-- JOIN GRAPH: "Swimmers": ["Players", "SwimmingResults"]

CREATE TABLE SwimmingResults ( -- This table contains results of swimming events
    ResultID INTEGER PRIMARY KEY,
    EventID INTEGER, -- References EventID in SwimmingEvents table. Range depends on number of events.
    SwimmerID INTEGER, -- References SwimmerID in Swimmers table. Range depends on number of swimmers.
    CompetitionDate DATE, -- Date of the competition. Range from 1950 to present.
    Time FLOAT, -- Time of the swim in seconds. Range 20-1000, depends on event.
    Rank INTEGER -- Swimmer's rank in the event. Range typically 1-8.
);
-- JOIN GRAPH: "SwimmingResults": ["SwimmingEvents", "Swimmers"]

CREATE TABLE CoachingHistory ( -- This table contains the coaching history of coaches
    CoachingHistoryID INTEGER PRIMARY KEY,
    CoachID INTEGER, -- References CoachID in Coaches table. Range depends on number of coaches.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    StartDate DATE, -- Start date of coaching tenure. Range from 1950 to present.
    EndDate DATE, -- End date of coaching tenure. Range from 1950 to present, or NULL if current.
    Position TEXT -- Coaching position (e.g., "Head Coach", "Assistant Coach"). 5-10 distinct values.
);
-- JOIN GRAPH: "CoachingHistory": ["Coaches", "Teams"]

CREATE TABLE Referees ( -- This table contains information about sports referees
    RefereeID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL, -- Referee's first name. Many distinct values.
    LastName TEXT NOT NULL, -- Referee's last name. Many distinct values.
    DateOfBirth DATE, -- Referee's date of birth. Range from 1950 to 1990, most values between 1970-1985.
    Nationality TEXT, -- Referee's nationality. 50-100 distinct values.
    SportID INTEGER -- References SportID in Sports table. Range 1-20, all values present.
);
-- JOIN GRAPH: "Referees": ["Sports", "Games"]

CREATE TABLE GameOfficials ( -- This table links referees to specific games
    GameOfficialID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    RefereeID INTEGER, -- References RefereeID in Referees table. Range depends on number of referees.
    Role TEXT -- Official's role in the game (e.g., "Head Referee", "Assistant Referee"). 3-5 distinct values.
);
-- JOIN GRAPH: "GameOfficials": ["Games", "Referees"]

CREATE TABLE Sponsors ( -- This table contains information about sports sponsors
    SponsorID INTEGER PRIMARY KEY,
    SponsorName TEXT NOT NULL, -- Name of the sponsor company. Many distinct values.
    Industry TEXT, -- Industry of the sponsor (e.g., "Technology", "Automotive"). 20-30 distinct values.
    Founded DATE -- Date when the sponsor company was founded. Range from 1800 to present.
);
-- JOIN GRAPH: "Sponsors": ["SponsorshipDeals"]

CREATE TABLE SponsorshipDeals ( -- This table contains information about sponsorship deals
    DealID INTEGER PRIMARY KEY,
    SponsorID INTEGER, -- References SponsorID in Sponsors table. Range depends on number of sponsors.
    EntityID INTEGER, -- References ID of sponsored entity (could be TeamID, PlayerID, or TournamentID).
    EntityType TEXT, -- Type of sponsored entity ("Team", "Player", "Tournament"). 3 distinct values.
    StartDate DATE, -- Start date of the sponsorship deal. Range from 1950 to present.
    EndDate DATE, -- End date of the sponsorship deal. Range from 1950 to future, or NULL if ongoing.
    DealValue DECIMAL(15,2) -- Annual value of the deal in dollars. Range 10000-100000000, log-normally distributed.
);
-- JOIN GRAPH: "SponsorshipDeals": ["Sponsors", "Teams", "Players", "Tournaments"]

CREATE TABLE MediaCoverage ( -- This table contains information about media coverage of games
    CoverageID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    NetworkName TEXT, -- Name of the broadcasting network. 20-30 distinct values.
    ViewershipMillions FLOAT, -- Viewership in millions. Range 0.1-100, log-normally distributed.
    Revenue DECIMAL(15,2) -- Revenue generated from the broadcast in dollars. Range 10000-10000000, log-normally distributed.
);
-- JOIN GRAPH: "MediaCoverage": ["Games"]

CREATE TABLE SocialMediaAccounts ( -- This table contains information about social media accounts of players and teams
    AccountID INTEGER PRIMARY KEY,
    EntityID INTEGER, -- References ID of the account owner (could be PlayerID or TeamID).
    EntityType TEXT, -- Type of account owner ("Player", "Team"). 2 distinct values.
    Platform TEXT, -- Social media platform (e.g., "Twitter", "Instagram", "Facebook"). 5-7 distinct values.
    Username TEXT, -- Username on the platform. Many distinct values.
    Followers INTEGER -- Number of followers. Range 100-100000000, log-normally distributed.
);
-- JOIN GRAPH: "SocialMediaAccounts": ["Players", "Teams"]

CREATE TABLE Injuries ( -- This table contains information about player injuries
    InjuryID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    InjuryDate DATE, -- Date of the injury. Range from 1950 to present.
    InjuryType TEXT, -- Type of injury (e.g., "Sprained Ankle", "Concussion"). 50-100 distinct values.
    Severity TEXT, -- Severity of the injury ("Minor", "Moderate", "Severe"). 3 distinct values.
    RecoveryTimeWeeks INTEGER -- Estimated recovery time in weeks. Range 1-52, log-normally distributed.
);
-- JOIN GRAPH: "Injuries": ["Players"]

CREATE TABLE Transfers ( -- This table contains information about player transfers between teams
    TransferID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    FromTeamID INTEGER, -- References TeamID in Teams table for the originating team.
    ToTeamID INTEGER, -- References TeamID in Teams table for the destination team.
    TransferDate DATE, -- Date of the transfer. Range from 1950 to present.
    TransferFee DECIMAL(15,2) -- Transfer fee in dollars. Range 0-300000000, log-normally distributed.
);
-- JOIN GRAPH: "Transfers": ["Players", "Teams"]

CREATE TABLE Awards ( -- This table contains information about sports awards
    AwardID INTEGER PRIMARY KEY,
    AwardName TEXT NOT NULL, -- Name of the award (e.g., "MVP", "Golden Boot"). Many distinct values.
    SportID INTEGER, -- References SportID in Sports table. Range 1-20, all values present.
    AwardType TEXT -- Type of award ("Individual", "Team"). 2 distinct values.
);
-- JOIN GRAPH: "Awards": ["Sports", "AwardWinners"]

CREATE TABLE AwardWinners ( -- This table contains information about award winners
    AwardWinnerID INTEGER PRIMARY KEY,
    AwardID INTEGER, -- References AwardID in Awards table. Range depends on number of awards.
    WinnerID INTEGER, -- References ID of the winner (could be PlayerID or TeamID).
    WinnerType TEXT, -- Type of winner ("Player", "Team"). 2 distinct values.
    Year INTEGER, -- Year the award was won. Range from 1950 to present.
    AchievementDetails TEXT -- Details of the achievement (e.g., "28 goals in 38 games"). Many distinct values.
);
-- JOIN GRAPH: "AwardWinners": ["Awards", "Players", "Teams"]

CREATE TABLE Stadiums ( -- This table contains information about sports stadiums
    StadiumID INTEGER PRIMARY KEY,
    StadiumName TEXT NOT NULL, -- Name of the stadium. Many distinct values.
    City TEXT, -- City where the stadium is located. 50-100 distinct values.
    Country TEXT, -- Country where the stadium is located. 20-50 distinct values.
    Capacity INTEGER, -- Seating capacity of the stadium. Range 1000-100000, log-normally distributed.
    OpeningYear INTEGER -- Year the stadium opened. Range from 1800 to present, most values after 1950.
);
-- JOIN GRAPH: "Stadiums": ["Games", "Teams"]

CREATE TABLE TrainingFacilities ( -- This table contains information about team training facilities
    FacilityID INTEGER PRIMARY KEY,
    FacilityName TEXT NOT NULL, -- Name of the training facility. Many distinct values.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    Location TEXT, -- Location of the facility. Many distinct values.
    Size INTEGER, -- Size of the facility in square meters. Range 1000-100000, log-normally distributed.
    OpeningYear INTEGER -- Year the facility opened. Range from 1950 to present.
);
-- JOIN GRAPH: "TrainingFacilities": ["Teams"]

CREATE TABLE Merchandise (
    MerchandiseID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table
    PlayerID INTEGER, -- References PlayerID in Players table
    ItemType TEXT, -- Type of merchandise (e.g., "Jersey", "Cap", "Scarf")
    Price DECIMAL(10,2), -- Price of the item in dollars
    StockQuantity INTEGER -- Current stock quantity
);
-- JOIN GRAPH: "Merchandise": ["Teams", "Players"]

CREATE TABLE FanClubs ( -- This table contains information about fan clubs
    FanClubID INTEGER PRIMARY KEY,
    ClubName TEXT NOT NULL, -- Name of the fan club. Many distinct values.
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    FoundedYear INTEGER, -- Year the fan club was founded. Range from 1900 to present.
    MemberCount INTEGER -- Number of members in the fan club. Range 10-1000000, log-normally distributed.
);
-- JOIN GRAPH: "FanClubs": ["Teams"]

CREATE TABLE SportsBettingProviders ( -- This table contains information about sports betting providers
    ProviderID INTEGER PRIMARY KEY,
    ProviderName TEXT NOT NULL, -- Name of the betting provider. 20-30 distinct values.
    FoundedYear INTEGER, -- Year the provider was founded. Range from 1950 to present.
    Headquarters TEXT -- Location of the provider's headquarters. Many distinct values.
);
-- JOIN GRAPH: "SportsBettingProviders": ["Bets"]

CREATE TABLE BettingOdds ( -- This table contains betting odds for games
    OddsID INTEGER PRIMARY KEY,
    GameID INTEGER, -- References GameID in Games table. Range depends on number of games.
    ProviderID INTEGER, -- References ProviderID in SportsBettingProviders table. Range depends on number of providers.
    HomeTeamOdds FLOAT, -- Odds for home team winning. Range 1.01-20.00, log-normally distributed.
    AwayTeamOdds FLOAT, -- Odds for away team winning. Range 1.01-20.00, log-normally distributed.
    DrawOdds FLOAT -- Odds for a draw (if applicable). Range 1.01-20.00, log-normally distributed.
);
-- JOIN GRAPH: "BettingOdds": ["Games", "SportsBettingProviders"]

CREATE TABLE NutritionPlans ( -- This table contains information about player nutrition plans
    NutritionPlanID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    DietType TEXT, -- Type of diet (e.g., "High Protein", "Vegan", "Keto"). 10-15 distinct values.
    CalorieTarget INTEGER, -- Daily calorie target. Range 1500-5000, normally distributed around 3000.
    ProteinPercentage FLOAT, -- Percentage of calories from protein. Range 10-40, normally distributed around 25.
    StartDate DATE, -- Start date of the nutrition plan. Range from 2000 to present.
    EndDate DATE -- End date of the nutrition plan. Range from 2000 to future, or NULL if ongoing.
);
-- JOIN GRAPH: "NutritionPlans": ["Players"]

CREATE TABLE TrainingPrograms ( -- This table contains information about team training programs
    ProgramID INTEGER PRIMARY KEY,
    TeamID INTEGER, -- References TeamID in Teams table. Range depends on number of teams.
    ProgramName TEXT NOT NULL, -- Name of the training program. Many distinct values.
    StartDate DATE, -- Start date of the program. Range from 2000 to present.
    EndDate DATE, -- End date of the program. Range from 2000 to future, or NULL if ongoing.
    FocusArea TEXT -- Main focus of the program (e.g., "Endurance", "Strength", "Tactics"). 10-15 distinct values.
);
-- JOIN GRAPH: "TrainingPrograms": ["Teams"]
