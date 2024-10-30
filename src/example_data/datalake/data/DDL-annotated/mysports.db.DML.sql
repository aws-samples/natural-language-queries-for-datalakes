-- Sports table
INSERT INTO Sports (SportID, SportName) VALUES (1, 'Football');
INSERT INTO Sports (SportID, SportName) VALUES (2, 'Basketball');
INSERT INTO Sports (SportID, SportName) VALUES (3, 'Tennis');
INSERT INTO Sports (SportID, SportName) VALUES (4, 'Golf');
INSERT INTO Sports (SportID, SportName) VALUES (5, 'Hockey');
INSERT INTO Sports (SportID, SportName) VALUES (6, 'Baseball');
INSERT INTO Sports (SportID, SportName) VALUES (7, 'Soccer');
INSERT INTO Sports (SportID, SportName) VALUES (8, 'Cricket');
INSERT INTO Sports (SportID, SportName) VALUES (9, 'Rugby');
INSERT INTO Sports (SportID, SportName) VALUES (10, 'Boxing');

-- Teams table
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (1, 1, 'New England Patriots', 'Boston', 'USA', '1959-11-16');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (2, 2, 'Los Angeles Lakers', 'Los Angeles', 'USA', '1947-01-01');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (3, 5, 'Toronto Maple Leafs', 'Toronto', 'Canada', '1917-11-22');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (4, 6, 'New York Yankees', 'New York', 'USA', '1901-01-09');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (5, 7, 'Manchester United', 'Manchester', 'England', '1878-01-01');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (6, 8, 'Mumbai Indians', 'Mumbai', 'India', '2008-01-01');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (7, 9, 'New Zealand All Blacks', 'Wellington', 'New Zealand', '1903-01-01');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (8, 1, 'Green Bay Packers', 'Green Bay', 'USA', '1919-08-11');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (9, 2, 'Chicago Bulls', 'Chicago', 'USA', '1966-01-16');
INSERT INTO Teams (TeamID, SportID, TeamName, City, Country, Founded) VALUES (10, 5, 'Montreal Canadiens', 'Montreal', 'Canada', '1909-12-04');

-- Players table
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (1, 'Tom', 'Brady', '1977-08-03', 'American', 193, 102, 1);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (2, 'LeBron', 'James', '1984-12-30', 'American', 203, 113, 2);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (3, 'Roger', 'Federer', '1981-08-08', 'Swiss', 185, 85, 3);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (4, 'Tiger', 'Woods', '1975-12-30', 'American', 185, 84, 4);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (5, 'Sidney', 'Crosby', '1987-08-07', 'Canadian', 180, 91, 5);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (6, 'Mike', 'Trout', '1991-08-07', 'American', 188, 106, 6);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (7, 'Cristiano', 'Ronaldo', '1985-02-05', 'Portuguese', 187, 83, 7);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (8, 'Virat', 'Kohli', '1988-11-05', 'Indian', 175, 72, 8);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (9, 'Dan', 'Carter', '1982-03-05', 'New Zealander', 178, 94, 9);
INSERT INTO Players (PlayerID, FirstName, LastName, DateOfBirth, Nationality, Height, Weight, SportID) VALUES (10, 'Floyd', 'Mayweather', '1977-02-24', 'American', 173, 68, 10);

-- Coaches table
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (1, 'Bill', 'Belichick', '1952-04-16', 'American', 1);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (2, 'Gregg', 'Popovich', '1949-01-28', 'American', 2);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (3, 'Ivan', 'Lendl', '1960-03-07', 'Czech', 3);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (4, 'Butch', 'Harmon', '1943-08-28', 'American', 4);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (5, 'Mike', 'Babcock', '1963-04-29', 'Canadian', 5);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (6, 'Joe', 'Maddon', '1954-02-08', 'American', 6);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (7, 'Pep', 'Guardiola', '1971-01-18', 'Spanish', 7);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (8, 'Ravi', 'Shastri', '1962-05-27', 'Indian', 8);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (9, 'Steve', 'Hansen', '1959-05-07', 'New Zealander', 9);
INSERT INTO Coaches (CoachID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (10, 'Freddie', 'Roach', '1960-03-05', 'American', 10);

-- Venues table
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (1, 'Gillette Stadium', 'Foxborough', 'USA', 65878, '2002-05-11', 1);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (2, 'Staples Center', 'Los Angeles', 'USA', 19079, '1999-10-17', 2);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (3, 'Wimbledon Centre Court', 'London', 'England', 14979, '1922-06-26', 3);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (4, 'Augusta National Golf Club', 'Augusta', 'USA', 40000, '1933-01-13', 4);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (5, 'Scotiabank Arena', 'Toronto', 'Canada', 19800, '1999-02-19', 5);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (6, 'Yankee Stadium', 'New York', 'USA', 54251, '2009-04-02', 6);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (7, 'Old Trafford', 'Manchester', 'England', 74140, '1910-02-19', 7);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (8, 'Wankhede Stadium', 'Mumbai', 'India', 33108, '1974-03-01', 8);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (9, 'Eden Park', 'Auckland', 'New Zealand', 50000, '1900-01-01', 9);
INSERT INTO Venues (VenueID, VenueName, City, Country, Capacity, Opened, SportID) VALUES (10, 'MGM Grand Garden Arena', 'Las Vegas', 'USA', 17157, '1993-12-18', 10);

-- Leagues table
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (1, 'National Football League', 1, 'USA', 1920);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (2, 'National Basketball Association', 2, 'USA', 1946);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (3, 'ATP Tour', 3, 'Global', 1972);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (4, 'PGA Tour', 4, 'USA', 1929);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (5, 'National Hockey League', 5, 'USA/Canada', 1917);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (6, 'Major League Baseball', 6, 'USA', 1903);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (7, 'English Premier League', 7, 'England', 1992);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (8, 'Indian Premier League', 8, 'India', 2008);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (9, 'Rugby World Cup', 9, 'Global', 1987);
INSERT INTO Leagues (LeagueID, LeagueName, SportID, Country, FoundedYear) VALUES (10, 'World Boxing Association', 10, 'Global', 1921);

-- Seasons table
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (1, 1, '2020-09-10', '2021-02-07');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (2, 2, '2020-10-22', '2021-07-22');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (3, 3, '2020-01-01', '2020-11-22');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (4, 4, '2020-09-10', '2021-09-05');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (5, 5, '2020-10-07', '2021-07-07');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (6, 6, '2020-07-23', '2020-10-27');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (7, 7, '2020-09-12', '2021-05-23');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (8, 8, '2020-09-19', '2020-11-10');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (9, 9, '2019-09-20', '2019-11-02');
INSERT INTO Seasons (SeasonID, LeagueID, StartDate, EndDate) VALUES (10, 10, '2020-01-01', '2020-12-31');

-- Games table
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (1, 1, 1, 8, 1, '2020-11-15', 1, 65878);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (2, 2, 2, 9, 2, '2020-12-25', 2, 19079);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (3, 5, 3, 10, 5, '2021-01-13', 5, 19800);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (4, 6, 4, 1, 6, '2020-08-03', 6, 54251);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (5, 7, 5, 2, 7, '2020-10-24', 7, 74140);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (6, 8, 6, 3, 8, '2020-10-10', 8, 33108);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (7, 9, 7, 4, 9, '2019-10-19', 9, 50000);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (8, 1, 8, 5, 1, '2020-12-20', 1, 65000);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (9, 2, 9, 6, 2, '2021-02-14', 2, 18500);
INSERT INTO Games (GameID, SportID, HomeTeamID, AwayTeamID, VenueID, GameDate, SeasonID, Attendance) VALUES (10, 5, 10, 7, 5, '2021-03-20', 5, 19500);

-- GameStats table
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (1, 1, 24, 21, 180, 1, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (2, 2, 110, 105, 150, 2, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (3, 3, 3, 2, 180, 3, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (4, 4, 5, 3, 210, 4, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (5, 5, 2, 1, 90, 5, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (6, 6, 180, 175, 240, 6, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (7, 7, 30, 22, 80, 7, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (8, 8, 28, 17, 180, 8, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (9, 9, 98, 102, 150, 9, 'Full Time');
INSERT INTO GameStats (GameStatID, GameID, HomeTeamScore, AwayTeamScore, Duration, WinnerID, Period) VALUES (10, 10, 4, 1, 180, 10, 'Full Time');

-- TeamStats table
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (1, 1, 1, 12, 4, 0, 450, 350);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (2, 2, 2, 52, 20, 0, 8500, 8000);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (3, 3, 5, 35, 20, 5, 210, 180);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (4, 4, 6, 95, 67, 0, 850, 700);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (5, 5, 7, 22, 9, 7, 70, 40);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (6, 6, 8, 9, 5, 0, 2500, 2300);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (7, 7, 9, 7, 0, 0, 320, 120);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (8, 8, 1, 10, 6, 0, 400, 380);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (9, 9, 2, 48, 24, 0, 8200, 8100);
INSERT INTO TeamStats (TeamStatID, TeamID, SeasonID, Wins, Losses, Draws, PointsScored, PointsConceded) VALUES (10, 10, 5, 32, 23, 5, 200, 190);

-- PlayerStats table
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (1, 1, 1, 1, 1, 16, 960, 40, 'Regular Season', 15);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (2, 2, 2, 2, 2, 72, 2500, 2000, 'Regular Season', 500);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (3, 3, 3, NULL, 3, 65, 5850, 3900, 'Regular Season', 100);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (4, 4, 4, NULL, 4, 18, 5400, 1300, 'Regular Season', 5);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (5, 5, 5, 3, 5, 60, 1200, 95, 'Regular Season', 80);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (6, 6, 6, 4, 6, 162, 1458, 120, 'Regular Season', 40);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (7, 7, 7, 5, 7, 38, 3420, 35, 'Regular Season', 20);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (8, 8, 8, 6, 8, 14, 840, 550, 'Regular Season', 30);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (9, 9, 9, 7, 9, 7, 560, 80, 'Regular Season', 10);
INSERT INTO PlayerStats (PlayerStatID, PlayerID, SeasonID, TeamID, GameID, GamesPlayed, MinutesPlayed, PointsScored, Period, Assists) VALUES (10, 10, 10, NULL, 10, 1, 36, NULL, 'Regular Season', 0);

-- Contracts table
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (1, 1, 1, '2020-03-20', '2022-03-19', 25000000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (2, 2, 2, '2018-07-01', '2022-06-30', 37436858.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (3, 3, NULL, '2020-01-01', '2020-12-31', 106300000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (4, 4, NULL, '2020-01-01', '2020-12-31', 62300000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (5, 5, 3, '2017-07-01', '2025-06-30', 8700000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (6, 6, 4, '2019-03-20', '2030-03-19', 35541667.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (7, 7, 5, '2018-07-10', '2022-06-30', 31000000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (8, 8, 6, '2020-04-01', '2023-03-31', 15000000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (9, 9, 7, '2015-12-01', '2021-11-30', 1400000.00);
INSERT INTO Contracts (ContractID, PlayerID, TeamID, StartDate, EndDate, AnnualSalary) VALUES (10, 10, NULL, '2020-01-01', '2020-12-31', 300000000.00);

-- Injuries table
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (1, 1, '2020-10-15', 'Knee Sprain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (2, 2, '2021-03-20', 'Ankle Sprain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (3, 3, '2020-07-07', 'Back Strain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (4, 4, '2019-04-14', 'Knee Surgery');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (5, 5, '2021-01-05', 'Concussion');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (6, 6, '2020-08-10', 'Hamstring Strain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (7, 7, '2020-11-08', 'COVID-19');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (8, 8, '2020-09-25', 'Shoulder Strain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (9, 9, '2019-10-19', 'Calf Strain');
INSERT INTO Injuries (InjuryID, PlayerID, InjuryDate, InjuryType) VALUES (10, 10, '2017-08-26', 'Hand Injury');

-- Tournaments table
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (1, 'Super Bowl LV', 1, '2021-02-07', '2021-02-07', 1);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (2, 'NBA Finals', 2, '2021-07-08', '2021-07-22', 2);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (3, 'Wimbledon', 3, '2021-06-28', '2021-07-11', 3);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (4, 'The Masters', 4, '2021-04-08', '2021-04-11', 4);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (5, 'Stanley Cup Finals', 5, '2021-06-28', '2021-07-07', 5);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (6, 'World Series', 6, '2020-10-20', '2020-10-27', 6);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (7, 'UEFA Champions League Final', 7, '2021-05-29', '2021-05-29', 7);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (8, 'IPL Final', 8, '2020-11-10', '2020-11-10', 8);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (9, 'Rugby World Cup Final', 9, '2019-11-02', '2019-11-02', 9);
INSERT INTO Tournaments (TournamentID, TournamentName, SportID, StartDate, EndDate, VenueID) VALUES (10, 'Mayweather vs. Paul', 10, '2021-06-06', '2021-06-06', 10);

-- Tickets table
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (1, 1, 'A12', 150.00, '2020-10-15', 1);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (2, 2, 'B34', 200.00, '2020-11-25', 2);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (3, 3, 'C56', 75.00, '2020-12-13', 3);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (4, 4, 'D78', 80.00, '2020-07-03', 4);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (5, 5, 'E90', 100.00, '2020-09-24', 5);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (6, 6, 'F12', 50.00, '2020-09-10', 6);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (7, 7, 'G34', 120.00, '2019-09-19', 7);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (8, 8, 'H56', 160.00, '2020-11-20', 8);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (9, 9, 'I78', 180.00, '2021-01-14', 9);
INSERT INTO Tickets (TicketID, GameID, SeatNumber, Price, PurchaseDate, CustomerID) VALUES (10, 10, 'J90', 90.00, '2021-02-20', 10);

-- Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, Anytown, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com', '234-567-8901', '456 Oak Ave, Somewhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (3, 'Bob', 'Johnson', 'bob.johnson@email.com', '345-678-9012', '789 Pine Rd, Nowhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (4, 'Alice', 'Williams', 'alice.williams@email.com', '456-789-0123', '321 Elm St, Everywhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (5, 'Charlie', 'Brown', 'charlie.brown@email.com', '567-890-1234', '654 Maple Dr, Somewhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (6, 'Diana', 'Davis', 'diana.davis@email.com', '678-901-2345', '987 Cedar Ln, Anytown, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (7, 'Edward', 'Miller', 'edward.miller@email.com', '789-012-3456', '246 Birch Blvd, Nowhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (8, 'Fiona', 'Wilson', 'fiona.wilson@email.com', '890-123-4567', '135 Walnut St, Everywhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (9, 'George', 'Moore', 'george.moore@email.com', '901-234-5678', '864 Spruce Ave, Somewhere, USA');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (10, 'Hannah', 'Taylor', 'hannah.taylor@email.com', '012-345-6789', '753 Ash Rd, Anytown, USA');

-- Bets table
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (1, 1, 1, 'Win', 100.00, 1.95, 'Win');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (2, 2, 2, 'Over/Under', 50.00, 1.85, 'Loss');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (3, 3, 3, 'Spread', 75.00, 2.10, 'Win');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (4, 4, 4, 'Win', 200.00, 1.75, 'Loss');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (5, 5, 5, 'Over/Under', 150.00, 1.90, 'Win');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (6, 6, 6, 'Spread', 80.00, 2.05, 'Push');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (7, 7, 7, 'Win', 120.00, 2.20, 'Win');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (8, 8, 8, 'Over/Under', 90.00, 1.80, 'Loss');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (9, 9, 9, 'Spread', 60.00, 2.15, 'Win');
INSERT INTO Bets (BetID, CustomerID, GameID, BetType, BetAmount, Odds, Outcome) VALUES (10, 10, 10, 'Win', 110.00, 1.70, 'Loss');

-- FootballTeams table
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (1, 1, '4-3-3', 1);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (2, 8, '3-4-3', 2);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (3, 5, '4-2-3-1', 3);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (4, 7, '4-4-2', 4);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (5, 9, '3-5-2', 5);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (6, 2, '4-1-4-1', 6);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (7, 3, '5-3-2', 7);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (8, 4, '4-3-1-2', 8);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (9, 6, '4-2-2-2', 9);
INSERT INTO FootballTeams (FootballTeamID, TeamID, Formation, LeaguePosition) VALUES (10, 10, '3-4-2-1', 10);

-- FootballPlayers table
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (1, 1, 'Quarterback', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (2, 7, 'Forward', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (3, 2, 'Wide Receiver', 'Left');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (4, 3, 'Midfielder', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (5, 4, 'Defender', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (6, 5, 'Goalkeeper', 'Left');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (7, 6, 'Striker', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (8, 8, 'Defensive Midfielder', 'Right');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (9, 9, 'Full Back', 'Left');
INSERT INTO FootballPlayers (FootballPlayerID, PlayerID, Position, PreferredFoot) VALUES (10, 10, 'Center Back', 'Right');

-- FootballPlayerStats table
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (1, 1, 40, 15, 2, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (2, 7, 35, 10, 3, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (3, 2, 0, 20, 1, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (4, 3, 10, 25, 5, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (5, 4, 2, 5, 8, 1);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (6, 5, 0, 0, 1, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (7, 6, 28, 7, 4, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (8, 8, 5, 12, 10, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (9, 9, 1, 8, 6, 0);
INSERT INTO FootballPlayerStats (FootballPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (10, 10, 3, 2, 7, 1);

-- FootballGameStats table
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (1, 1, 55.2, 7, 12, 3);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (2, 5, 48.7, 5, 15, 2);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (3, 8, 52.1, 6, 10, 4);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (4, 2, 51.5, 8, 14, 1);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (5, 3, 54.8, 9, 11, 2);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (6, 4, 49.3, 4, 13, 3);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (7, 6, 53.6, 7, 16, 2);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (8, 7, 50.9, 6, 9, 1);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (9, 9, 47.2, 5, 12, 4);
INSERT INTO FootballGameStats (FootballGameStatID, GameStatID, Possession, Corners, Fouls, Offsides) VALUES (10, 10, 52.8, 8, 11, 2);

-- BasketballTeams table
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (1, 2, 1.2, 1);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (2, 9, 1.15, 2);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (3, 1, 1.18, 3);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (4, 3, 1.22, 4);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (5, 4, 1.17, 5);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (6, 5, 1.19, 6);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (7, 6, 1.21, 7);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (8, 7, 1.16, 8);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (9, 8, 1.23, 9);
INSERT INTO BasketballTeams (BasketballTeamID, TeamID, HomeCourtAdvantage, ConferenceRank) VALUES (10, 10, 1.14, 10);

-- BasketballPlayers table
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (1, 2, 'Small Forward', 23);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (2, 1, 'Point Guard', 30);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (3, 3, 'Center', 33);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (4, 4, 'Shooting Guard', 24);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (5, 5, 'Power Forward', 21);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (6, 6, 'Small Forward', 34);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (7, 7, 'Point Guard', 3);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (8, 8, 'Center', 11);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (9, 9, 'Shooting Guard', 8);
INSERT INTO BasketballPlayers (BasketballPlayerID, PlayerID, Position, JerseyNumber) VALUES (10, 10, 'Power Forward', 41);

-- BasketballPlayerStats table
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (1, 2, 27.5, 750, 700, 120, 80);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (2, 1, 22.3, 200, 800, 150, 20);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (3, 3, 18.7, 900, 150, 50, 180);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (4, 4, 24.1, 300, 400, 100, 30);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (5, 5, 16.8, 800, 200, 80, 120);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (6, 6, 20.5, 600, 300, 90, 70);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (7, 7, 19.2, 250, 750, 130, 15);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (8, 8, 15.6, 850, 100, 40, 160);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (9, 9, 21.9, 350, 450, 110, 25);
INSERT INTO BasketballPlayerStats (BasketballPlayerStatID, PlayerStatID, PointsPerGame, Rebounds, Assists, Steals, Blocks) VALUES (10, 10, 17.3, 700, 250, 70, 100);

-- BasketballGameStats table
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (1, 2, 45, 40, 28, 25);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (2, 9, 42, 38, 30, 27);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (3, 1, 48, 43, 26, 23);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (4, 3, 39, 41, 32, 29);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (5, 4, 44, 46, 27, 24);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (6, 5, 47, 42, 29, 26);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (7, 6, 41, 39, 31, 28);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (8, 7, 43, 45, 25, 22);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (9, 8, 46, 44, 33, 30);
INSERT INTO BasketballGameStats (BasketballGameStatID, GameStatID, HomeTeamRebounds, AwayTeamRebounds, HomeTeamAssists, AwayTeamAssists) VALUES (10, 10, 40, 37, 28, 25);

-- BaseballTeams table
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (1, 4, 1.1, 1);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (2, 1, 0.95, 2);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (3, 2, 1.05, 3);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (4, 3, 1.0, 4);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (5, 5, 0.9, 5);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (6, 6, 1.15, 1);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (7, 7, 1.02, 2);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (8, 8, 0.98, 3);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (9, 9, 1.08, 4);
INSERT INTO BaseballTeams (BaseballTeamID, TeamID, HomeRunFactor, DivisionRank) VALUES (10, 10, 0.93, 5);

-- BaseballPlayers table
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (1, 6, 'Center Field', 'Right', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (2, 1, 'Pitcher', 'Right', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (3, 2, 'First Base', 'Left', 'Left');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (4, 3, 'Shortstop', 'Right', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (5, 4, 'Third Base', 'Right', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (6, 5, 'Catcher', 'Right', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (7, 7, 'Right Field', 'Left', 'Left');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (8, 8, 'Second Base', 'Switch', 'Right');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (9, 9, 'Left Field', 'Right', 'Left');
INSERT INTO BaseballPlayers (BaseballPlayerID, PlayerID, Position, BattingHand, ThrowingHand) VALUES (10, 10, 'Pitcher', 'Left', 'Left');

-- BaseballPlayerStats table
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (1, 6, 0.305, 45, 110, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (2, 1, 0.000, 0, 0, 2.75, 220);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (3, 2, 0.285, 35, 95, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (4, 3, 0.290, 20, 75, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (5, 4, 0.275, 30, 85, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (6, 5, 0.260, 15, 60, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (7, 7, 0.310, 40, 100, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (8, 8, 0.280, 10, 55, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (9, 9, 0.270, 25, 80, NULL, NULL);
INSERT INTO BaseballPlayerStats (BaseballPlayerStatID, PlayerStatID, BattingAverage, HomeRuns, RBI, ERA, Strikeouts) VALUES (10, 10, 0.185, 0, 5, 3.50, 180);

-- BaseballGameStats table
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (1, 4, 10, 8, 1, 2);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (2, 1, 9, 7, 0, 1);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (3, 2, 11, 9, 2, 0);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (4, 3, 8, 6, 1, 1);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (5, 5, 12, 10, 0, 2);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (6, 6, 7, 5, 2, 1);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (7, 7, 13, 11, 1, 0);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (8, 8, 6, 4, 0, 3);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (9, 9, 10, 9, 1, 1);
INSERT INTO BaseballGameStats (BaseballGameStatID, GameStatID, HomeTeamHits, AwayTeamHits, HomeTeamErrors, AwayTeamErrors) VALUES (10, 10, 8, 7, 2, 2);

-- TennisPlayers table
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (1, 3, 'Right', 'All-court');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (2, 1, 'Left', 'Serve-and-volley');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (3, 2, 'Right', 'Baseline');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (4, 4, 'Right', 'Aggressive baseliner');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (5, 5, 'Left', 'Counterpuncher');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (6, 6, 'Right', 'All-court');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (7, 7, 'Right', 'Aggressive baseliner');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (8, 8, 'Left', 'Serve-and-volley');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (9, 9, 'Right', 'Baseline');
INSERT INTO TennisPlayers (TennisPlayerID, PlayerID, Handedness, PlayingStyle) VALUES (10, 10, 'Right', 'Counterpuncher');

-- TennisPlayerStats table
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (1, 3, 1, 20, 103, 0.819);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (2, 1, 5, 3, 25, 0.735);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (3, 2, 2, 17, 82, 0.802);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (4, 4, 3, 12, 70, 0.785);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (5, 5, 8, 1, 15, 0.680);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (6, 6, 10, 0, 10, 0.650);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (7, 7, 4, 7, 45, 0.760);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (8, 8, 15, 0, 5, 0.620);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (9, 9, 20, 0, 3, 0.600);
INSERT INTO TennisPlayerStats (TennisPlayerStatID, PlayerStatID, ATPRanking, GrandSlamTitles, CareerTitles, WinLossRatio) VALUES (10, 10, 25, 0, 2, 0.580);

-- TennisMatches table
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (1, 1, 1, 2, 'Hard', 'Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (2, 2, 3, 4, 'Clay', 'Semi-Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (3, 3, 5, 6, 'Grass', 'Quarter-Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (4, 4, 7, 8, 'Hard', 'Round of 16');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (5, 5, 9, 10, 'Clay', 'Round of 32');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (6, 6, 1, 3, 'Grass', 'Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (7, 7, 2, 4, 'Hard', 'Semi-Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (8, 8, 5, 7, 'Clay', 'Quarter-Final');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (9, 9, 6, 8, 'Grass', 'Round of 16');
INSERT INTO TennisMatches (TennisMatchID, GameID, Player1ID, Player2ID, Surface, Round) VALUES (10, 10, 9, 1, 'Hard', 'Round of 32');

-- TennisMatchStats table
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (1, 1, 15, 10, 2, 3);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (2, 2, 8, 12, 1, 4);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (3, 3, 20, 18, 3, 2);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (4, 4, 7, 9, 2, 1);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (5, 5, 11, 13, 4, 3);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (6, 6, 16, 14, 1, 2);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (7, 7, 9, 11, 3, 2);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (8, 8, 13, 15, 2, 4);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (9, 9, 10, 8, 1, 3);
INSERT INTO TennisMatchStats (TennisMatchStatID, GameStatID, Player1Aces, Player2Aces, Player1DoubleFaults, Player2DoubleFaults) VALUES (10, 10, 12, 14, 2, 1);

-- GolfPlayers table
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (1, 4, '1996-08-29', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (2, 1, '2000-06-15', 'Left');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (3, 2, '2005-09-01', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (4, 3, '1998-07-20', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (5, 5, '2007-10-10', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (6, 6, '2010-03-05', 'Left');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (7, 7, '2009-01-15', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (8, 8, '2012-08-30', 'Right');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (9, 9, '2011-05-22', 'Left');
INSERT INTO GolfPlayers (GolfPlayerID, PlayerID, ProSince, Handedness) VALUES (10, 10, '2013-11-01', 'Right');

-- GolfPlayerStats table
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (1, 4, 1, 7500000.00, 65.5, 72.3);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (2, 1, 5, 4200000.00, 68.2, 70.1);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (3, 2, 3, 5800000.00, 62.8, 71.5);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (4, 3, 2, 6500000.00, 67.9, 73.2);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (5, 5, 8, 3100000.00, 64.3, 69.8);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (6, 6, 12, 2800000.00, 66.1, 68.7);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (7, 7, 7, 3500000.00, 63.7, 70.9);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (8, 8, 15, 2200000.00, 65.8, 67.6);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (9, 9, 20, 1800000.00, 61.9, 66.4);
INSERT INTO GolfPlayerStats (GolfPlayerStatID, PlayerStatID, WorldRanking, SeasonEarnings, DrivingAccuracy, GreenInRegulationPercentage) VALUES (10, 10, 25, 1500000.00, 64.6, 68.2);

-- GolfTournaments table
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (1, 4, 1, 11500000.00, 72);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (2, 1, 2, 9000000.00, 71);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (3, 2, 3, 10000000.00, 72);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (4, 3, 4, 8500000.00, 70);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (5, 5, 5, 7500000.00, 71);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (6, 6, 6, 8000000.00, 72);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (7, 7, 7, 9500000.00, 70);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (8, 8, 8, 7000000.00, 71);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (9, 9, 9, 6500000.00, 72);
INSERT INTO GolfTournaments (GolfTournamentID, TournamentID, CourseID, PurseAmount, ParScore) VALUES (10, 10, 10, 6000000.00, 70);

-- GolfCourses table
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (1, 'Augusta National Golf Club', 'Augusta, Georgia', 18, 72, 7475);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (2, 'Pebble Beach Golf Links', 'Pebble Beach, California', 18, 72, 7040);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (3, 'St Andrews Links (Old Course)', 'St Andrews, Scotland', 18, 72, 7305);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (4, 'TPC Sawgrass', 'Ponte Vedra Beach, Florida', 18, 72, 7245);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (5, 'Whistling Straits', 'Sheboygan, Wisconsin', 18, 72, 7790);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (6, 'Royal Melbourne Golf Club', 'Black Rock, Victoria, Australia', 18, 72, 6579);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (7, 'Muirfield', 'Gullane, East Lothian, Scotland', 18, 71, 7245);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (8, 'Pinehurst No. 2', 'Pinehurst, North Carolina', 18, 72, 7588);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (9, 'Oakmont Country Club', 'Oakmont, Pennsylvania', 18, 71, 7255);
INSERT INTO GolfCourses (CourseID, CourseName, Location, Holes, Par, Length) VALUES (10, 'Bethpage Black Course', 'Farmingdale, New York', 18, 71, 7468);

-- GolfScores table
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (1, 1, 1, 1, 68);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (2, 1, 1, 2, 70);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (3, 1, 1, 3, 69);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (4, 1, 1, 4, 67);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (5, 2, 2, 1, 71);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (6, 2, 2, 2, 69);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (7, 2, 2, 3, 72);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (8, 2, 2, 4, 70);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (9, 3, 3, 1, 67);
INSERT INTO GolfScores (GolfScoreID, GolfTournamentID, GolfPlayerID, Round, Score) VALUES (10, 3, 3, 2, 68);

-- HockeyTeams table
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (1, 3, 1, 85.5);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (2, 10, 2, 83.2);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (3, 1, 3, 82.7);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (4, 2, 4, 81.9);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (5, 4, 5, 80.5);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (6, 5, 6, 79.8);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (7, 6, 7, 78.6);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (8, 7, 8, 77.9);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (9, 8, 9, 76.4);
INSERT INTO HockeyTeams (HockeyTeamID, TeamID, ConferenceRank, PenaltyKillPercentage) VALUES (10, 9, 10, 75.8);

-- HockeyPlayers table
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (1, 5, 'Center', 'Left');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (2, 1, 'Right Wing', 'Right');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (3, 2, 'Defenseman', 'Left');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (4, 3, 'Left Wing', 'Left');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (5, 4, 'Goalie', 'Left');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (6, 6, 'Center', 'Right');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (7, 7, 'Defenseman', 'Right');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (8, 8, 'Left Wing', 'Left');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (9, 9, 'Right Wing', 'Right');
INSERT INTO HockeyPlayers (HockeyPlayerID, PlayerID, Position, ShootingSide) VALUES (10, 10, 'Goalie', 'Left');

-- HockeyPlayerStats table
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (1, 5, 35, 50, 40, 25);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (2, 1, 28, 45, 30, 18);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (3, 2, 10, 35, 60, 15);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (4, 3, 25, 40, 25, 20);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (5, 4, 0, 5, 0, 0);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (6, 6, 30, 55, 35, 22);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (7, 7, 8, 30, 70, 10);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (8, 8, 22, 38, 28, 16);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (9, 9, 26, 42, 32, 19);
INSERT INTO HockeyPlayerStats (HockeyPlayerStatID, PlayerStatID, Goals, Assists, PenaltyMinutes, PlusMinus) VALUES (10, 10, 0, 3, 2, 0);

-- HockeyGameStats table
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (1, 3, 32, 28, 8, 10);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (2, 10, 30, 35, 12, 6);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (3, 1, 27, 29, 14, 16);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (4, 2, 33, 31, 10, 8);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (5, 4, 29, 26, 6, 12);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (6, 5, 34, 30, 8, 10);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (7, 6, 31, 33, 10, 8);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (8, 7, 28, 32, 12, 14);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (9, 8, 35, 27, 8, 6);
INSERT INTO HockeyGameStats (HockeyGameStatID, GameStatID, HomeTeamShots, AwayTeamShots, HomeTeamPenaltyMinutes, AwayTeamPenaltyMinutes) VALUES (10, 9, 30, 29, 10, 12);

-- SoccerTeams table
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (1, 5, 1, 45);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (2, 1, 2, 38);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (3, 2, 3, 30);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (4, 3, 4, 25);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (5, 4, 5, 20);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (6, 6, 6, 15);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (7, 7, 7, 10);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (8, 8, 8, 5);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (9, 9, 9, 0);
INSERT INTO SoccerTeams (SoccerTeamID, TeamID, LeaguePosition, GoalDifference) VALUES (10, 10, 10, -5);

-- SoccerPlayers table
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (1, 7, 'Forward', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (2, 1, 'Midfielder', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (3, 2, 'Defender', 'Left');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (4, 3, 'Forward', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (5, 4, 'Goalkeeper', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (6, 5, 'Midfielder', 'Left');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (7, 6, 'Defender', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (8, 8, 'Forward', 'Left');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (9, 9, 'Midfielder', 'Right');
INSERT INTO SoccerPlayers (SoccerPlayerID, PlayerID, Position, PreferredFoot) VALUES (10, 10, 'Defender', 'Left');

-- SoccerPlayerStats table
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (1, 7, 30, 10, 5, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (2, 1, 15, 20, 3, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (3, 2, 2, 5, 8, 1);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (4, 3, 25, 15, 4, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (5, 4, 0, 0, 1, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (6, 5, 10, 25, 6, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (7, 6, 1, 3, 7, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (8, 8, 20, 8, 2, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (9, 9, 12, 18, 5, 0);
INSERT INTO SoccerPlayerStats (SoccerPlayerStatID, PlayerStatID, Goals, Assists, YellowCards, RedCards) VALUES (10, 10, 3, 2, 9, 1);

-- SoccerGameStats table
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (1, 5, 55.2, 44.8, 15, 10);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (2, 1, 48.7, 51.3, 12, 14);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (3, 2, 52.1, 47.9, 18, 8);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (4, 3, 50.5, 49.5, 13, 11);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (5, 4, 53.8, 46.2, 16, 9);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (6, 6, 47.3, 52.7, 11, 15);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (7, 7, 51.9, 48.1, 14, 12);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (8, 8, 54.6, 45.4, 17, 7);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (9, 9, 49.2, 50.8, 10, 13);
INSERT INTO SoccerGameStats (SoccerGameStatID, GameStatID, HomeTeamPossession, AwayTeamPossession, HomeTeamShots, AwayTeamShots) VALUES (10, 10, 52.8, 47.2, 15, 11);

-- CricketTeams table
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (1, 6, 1, 8);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (2, 1, 2, 1);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (3, 2, 3, 2);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (4, 3, 4, 3);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (5, 4, 5, 4);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (6, 5, 6, 5);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (7, 7, 7, 6);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (8, 8, 8, 7);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (9, 9, 9, 9);
INSERT INTO CricketTeams (CricketTeamID, TeamID, ICCRanking, HomeGroundID) VALUES (10, 10, 10, 10);

-- CricketPlayers table
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (1, 8, 'Right-handed', 'Right-arm fast');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (2, 1, 'Left-handed', 'Left-arm spin');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (3, 2, 'Right-handed', 'Right-arm off-break');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (4, 3, 'Right-handed', 'Right-arm medium');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (5, 4, 'Left-handed', 'Left-arm fast');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (6, 5, 'Right-handed', 'Right-arm leg-break');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (7, 6, 'Left-handed', 'Left-arm orthodox');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (8, 7, 'Right-handed', 'Right-arm fast-medium');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (9, 9, 'Right-handed', 'Right-arm off-break');
INSERT INTO CricketPlayers (CricketPlayerID, PlayerID, BattingStyle, BowlingStyle) VALUES (10, 10, 'Left-handed', 'Left-arm chinaman');

-- CricketPlayerStats table
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (1, 8, 54.3, 25.4, 28, 150);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (2, 1, 45.7, 32.1, 15, 200);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (3, 2, 49.9, 28.7, 22, 180);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (4, 3, 38.5, 35.2, 10, 120);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (5, 4, 33.2, 27.8, 5, 250);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (6, 5, 42.1, 30.5, 18, 100);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (7, 6, 36.8, 33.9, 8, 160);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (8, 7, 51.2, 29.3, 25, 130);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (9, 9, 47.5, 31.7, 20, 140);
INSERT INTO CricketPlayerStats (CricketPlayerStatID, PlayerStatID, BattingAverage, BowlingAverage, Centuries, Wickets) VALUES (10, 10, 39.4, 34.6, 12, 110);

-- CricketMatches table
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (1, 6, 'Test', 450);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (2, 1, 'ODI', 50);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (3, 2, 'T20', 20);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (4, 3, 'Test', 450);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (5, 4, 'ODI', 50);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (6, 5, 'T20', 20);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (7, 7, 'Test', 450);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (8, 8, 'ODI', 50);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (9, 9, 'T20', 20);
INSERT INTO CricketMatches (CricketMatchID, GameID, Format, Overs) VALUES (10, 10, 'Test', 450);

-- CricketMatchStats table
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (1, 6, 350, 275, 10, 10);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (2, 1, 280, 260, 8, 10);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (3, 2, 180, 165, 6, 8);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (4, 3, 400, 380, 10, 10);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (5, 4, 310, 290, 9, 10);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (6, 5, 195, 180, 7, 9);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (7, 7, 420, 400, 10, 10);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (8, 8, 270, 250, 8, 9);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (9, 9, 170, 160, 6, 7);
INSERT INTO CricketMatchStats (CricketMatchStatID, GameStatID, HomeTeamRuns, AwayTeamRuns, HomeTeamWickets, AwayTeamWickets) VALUES (10, 10, 380, 360, 10, 10);

-- RugbyTeams table
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (1, 7, 1, 9);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (2, 1, 2, 1);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (3, 2, 3, 2);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (4, 3, 4, 3);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (5, 4, 5, 4);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (6, 5, 6, 5);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (7, 6, 7, 6);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (8, 8, 8, 7);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (9, 9, 9, 8);
INSERT INTO RugbyTeams (RugbyTeamID, TeamID, WorldRanking, HomeGroundID) VALUES (10, 10, 10, 10);

-- RugbyPlayers table
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (1, 9, 'Fly-half', 112);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (2, 1, 'Scrum-half', 95);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (3, 2, 'Prop', 78);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (4, 3, 'Lock', 86);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (5, 4, 'Flanker', 92);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (6, 5, 'Number 8', 103);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (7, 6, 'Centre', 89);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (8, 7, 'Wing', 75);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (9, 8, 'Full-back', 81);
INSERT INTO RugbyPlayers (RugbyPlayerID, PlayerID, Position, Caps) VALUES (10, 10, 'Hooker', 68);

-- RugbyPlayerStats table
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (1, 9, 25, 250, 180, 450);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (2, 1, 15, 0, 0, 380);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (3, 2, 5, 0, 0, 520);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (4, 3, 8, 0, 0, 580);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (5, 4, 12, 0, 0, 620);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (6, 5, 20, 0, 0, 550);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (7, 6, 30, 0, 0, 320);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (8, 7, 40, 0, 0, 280);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (9, 8, 22, 180, 150, 350);
INSERT INTO RugbyPlayerStats (RugbyPlayerStatID, PlayerStatID, Tries, Conversions, PenaltyGoals, TacklesMade) VALUES (10, 10, 10, 0, 0, 480);

-- RugbyMatchStats table
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (1, 7, 4, 2, 3, 2);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (2, 1, 3, 3, 4, 3);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (3, 2, 5, 1, 2, 4);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (4, 3, 2, 4, 5, 1);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (5, 4, 3, 2, 3, 3);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (6, 5, 4, 3, 2, 2);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (7, 6, 1, 5, 4, 1);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (8, 8, 3, 3, 3, 3);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (9, 9, 4, 1, 2, 3);
INSERT INTO RugbyMatchStats (RugbyMatchStatID, GameStatID, HomeTeamTries, AwayTeamTries, HomeTeamPenalties, AwayTeamPenalties) VALUES (10, 10, 2, 3, 5, 2);

-- BoxingMatches table
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (1, 10, 'Heavyweight', 12, 'WBA Heavyweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (2, 1, 'Welterweight', 12, 'WBC Welterweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (3, 2, 'Middleweight', 12, 'IBF Middleweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (4, 3, 'Lightweight', 12, 'WBO Lightweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (5, 4, 'Featherweight', 12, 'WBA Featherweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (6, 5, 'Super Middleweight', 12, NULL);
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (7, 6, 'Cruiserweight', 12, 'WBC Cruiserweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (8, 7, 'Light Heavyweight', 12, NULL);
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (9, 8, 'Bantamweight', 12, 'IBF Bantamweight Championship');
INSERT INTO BoxingMatches (BoxingMatchID, GameID, WeightClass, Rounds, Title) VALUES (10, 9, 'Flyweight', 12, 'WBO Flyweight Championship');

-- Boxers table
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (1, 10, 'Orthodox', 72);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (2, 1, 'Southpaw', 74);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (3, 2, 'Orthodox', 70);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (4, 3, 'Orthodox', 69);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (5, 4, 'Southpaw', 67);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (6, 5, 'Orthodox', 76);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (7, 6, 'Southpaw', 71);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (8, 7, 'Orthodox', 73);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (9, 8, 'Orthodox', 68);
INSERT INTO Boxers (BoxerID, PlayerID, Stance, ReachInches) VALUES (10, 9, 'Southpaw', 66);

-- BoxerStats table
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (1, 10, 50, 0, 0, 27);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (2, 1, 45, 2, 1, 30);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (3, 2, 40, 5, 0, 35);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (4, 3, 38, 3, 2, 25);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (5, 4, 35, 4, 1, 28);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (6, 5, 42, 1, 0, 33);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (7, 6, 37, 6, 1, 22);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (8, 7, 39, 2, 2, 31);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (9, 8, 36, 5, 0, 26);
INSERT INTO BoxerStats (BoxerStatID, PlayerStatID, Wins, Losses, Draws, KOs) VALUES (10, 9, 33, 7, 1, 20);

-- BoxingMatchResults table
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (1, 1, 1, 2, 'KO', 7);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (2, 2, 3, 4, 'Decision', 12);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (3, 3, 5, 6, 'TKO', 9);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (4, 4, 7, 8, 'Decision', 12);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (5, 5, 9, 10, 'KO', 4);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (6, 6, 2, 4, 'Decision', 12);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (7, 7, 6, 8, 'TKO', 11);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (8, 8, 1, 3, 'Decision', 12);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (9, 9, 5, 7, 'KO', 6);
INSERT INTO BoxingMatchResults (BoxingMatchResultID, BoxingMatchID, WinnerID, LoserID, Result, RoundEnded) VALUES (10, 10, 9, 10, 'Decision', 12);

-- MMAFights table
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (1, 1, 'Heavyweight', 5, 'UFC Heavyweight Championship');
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (2, 2, 'Lightweight', 5, 'UFC Lightweight Championship');
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (3, 3, 'Welterweight', 5, NULL);
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (4, 4, 'Middleweight', 5, 'UFC Middleweight Championship');
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (5, 5, 'Featherweight', 5, NULL);
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (6, 6, 'Bantamweight', 5, 'UFC Bantamweight Championship');
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (7, 7, 'Flyweight', 5, NULL);
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (8, 8, 'Light Heavyweight', 5, 'UFC Light Heavyweight Championship');
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (9, 9, 'Strawweight', 5, NULL);
INSERT INTO MMAFights (MMAFightID, GameID, WeightClass, Rounds, Title) VALUES (10, 10, 'Heavyweight', 3, NULL);

-- MMAFighters table
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (1, 1, 'Orthodox', 76);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (2, 2, 'Southpaw', 74);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (3, 3, 'Orthodox', 72);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (4, 4, 'Switch', 70);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (5, 5, 'Orthodox', 69);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (6, 6, 'Southpaw', 75);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (7, 7, 'Orthodox', 71);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (8, 8, 'Switch', 73);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (9, 9, 'Orthodox', 68);
INSERT INTO MMAFighters (MMAFighterID, PlayerID, Stance, ReachInches) VALUES (10, 10, 'Southpaw', 77);

-- MMAFighterStats table
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (1, 1, 25, 2, 0, 15);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (2, 2, 22, 3, 1, 12);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (3, 3, 20, 5, 0, 10);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (4, 4, 18, 4, 2, 8);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (5, 5, 23, 1, 0, 14);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (6, 6, 19, 6, 0, 11);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (7, 7, 21, 3, 1, 13);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (8, 8, 17, 7, 0, 9);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (9, 9, 24, 2, 0, 16);
INSERT INTO MMAFighterStats (MMAFighterStatID, PlayerStatID, Wins, Losses, Draws, KOTKOs) VALUES (10, 10, 16, 8, 1, 7);

-- MMAFightResults table
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (1, 1, 1, 2, 'KO', 2);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (2, 2, 3, 4, 'Submission', 3);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (3, 3, 5, 6, 'Decision', 5);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (4, 4, 7, 8, 'TKO', 4);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (5, 5, 9, 10, 'Submission', 1);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (6, 6, 2, 4, 'Decision', 5);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (7, 7, 6, 8, 'KO', 2);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (8, 8, 1, 3, 'TKO', 3);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (9, 9, 5, 7, 'Submission', 4);
INSERT INTO MMAFightResults (MMAFightResultID, MMAFightID, WinnerID, LoserID, Result, RoundEnded) VALUES (10, 10, 9, 10, 'Decision', 3);

-- TrackAndFieldEvents table
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (1, '100m Sprint', 'Track', 9.58, 1);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (2, 'Long Jump', 'Field', 8.95, 2);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (3, '400m Hurdles', 'Track', 46.78, 3);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (4, 'Shot Put', 'Field', 23.37, 4);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (5, '1500m', 'Track', 206.00, 5);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (6, 'High Jump', 'Field', 2.45, 6);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (7, '200m Sprint', 'Track', 19.19, 1);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (8, 'Javelin Throw', 'Field', 98.48, 7);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (9, '5000m', 'Track', 755.36, 8);
INSERT INTO TrackAndFieldEvents (EventID, EventName, EventType, WorldRecord, WorldRecordHolderID) VALUES (10, 'Triple Jump', 'Field', 18.29, 9);

-- TrackAndFieldAthletes table
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (1, 1, 'Sprinter');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (2, 2, 'Long Jumper');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (3, 3, 'Hurdler');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (4, 4, 'Shot Putter');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (5, 5, 'Middle Distance Runner');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (6, 6, 'High Jumper');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (7, 7, 'Javelin Thrower');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (8, 8, 'Long Distance Runner');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (9, 9, 'Triple Jumper');
INSERT INTO TrackAndFieldAthletes (TrackAndFieldAthleteID, PlayerID, Specialization) VALUES (10, 10, 'Decathlete');

-- TrackAndFieldResults table
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (1, 1, 1, '2021-08-01', 9.80, 1);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (2, 2, 2, '2021-08-02', 8.65, 2);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (3, 3, 3, '2021-08-03', 47.50, 1);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (4, 4, 4, '2021-08-04', 22.90, 3);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (5, 5, 5, '2021-08-05', 210.00, 2);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (6, 6, 6, '2021-08-06', 2.35, 1);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (7, 7, 1, '2021-08-07', 19.62, 1);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (8, 8, 7, '2021-08-08', 95.20, 2);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (9, 9, 8, '2021-08-09', 765.00, 3);
INSERT INTO TrackAndFieldResults (ResultID, EventID, AthleteID, CompetitionDate, Result, Rank) VALUES (10, 10, 9, '2021-08-10', 17.98, 1);

-- SwimmingEvents table
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (1, '100m Freestyle', 'Freestyle', 100, 46.91, 1);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (2, '200m Butterfly', 'Butterfly', 200, 119.41, 2);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (3, '400m Individual Medley', 'Medley', 400, 243.84, 3);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (4, '100m Backstroke', 'Backstroke', 100, 51.85, 4);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (5, '200m Breaststroke', 'Breaststroke', 200, 126.12, 5);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (6, '50m Freestyle', 'Freestyle', 50, 20.91, 6);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (7, '1500m Freestyle', 'Freestyle', 1500, 871.02, 7);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (8, '100m Butterfly', 'Butterfly', 100, 49.50, 8);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (9, '200m Backstroke', 'Backstroke', 200, 111.92, 9);
INSERT INTO SwimmingEvents (EventID, EventName, StrokeType, Distance, WorldRecord, WorldRecordHolderID) VALUES (10, '100m Breaststroke', 'Breaststroke', 100, 56.88, 10);

-- Swimmers table
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (1, 1, 'Freestyle');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (2, 2, 'Butterfly');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (3, 3, 'Individual Medley');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (4, 4, 'Backstroke');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (5, 5, 'Breaststroke');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (6, 6, 'Sprint Freestyle');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (7, 7, 'Distance Freestyle');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (8, 8, 'Butterfly');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (9, 9, 'Backstroke');
INSERT INTO Swimmers (SwimmerID, PlayerID, Specialization) VALUES (10, 10, 'Breaststroke');

-- SwimmingResults table
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (1, 1, 1, '2021-07-25', 47.50, 1);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (2, 2, 2, '2021-07-26', 121.20, 2);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (3, 3, 3, '2021-07-27', 245.00, 1);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (4, 4, 4, '2021-07-28', 52.30, 3);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (5, 5, 5, '2021-07-29', 127.50, 2);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (6, 6, 6, '2021-07-30', 21.20, 1);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (7, 7, 7, '2021-07-31', 875.00, 2);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (8, 8, 8, '2021-08-01', 50.10, 1);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (9, 9, 9, '2021-08-02', 113.00, 3);
INSERT INTO SwimmingResults (ResultID, EventID, SwimmerID, CompetitionDate, Time, Rank) VALUES (10, 10, 10, '2021-08-03', 57.50, 2);

-- CoachingHistory table
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (1, 1, 1, '2015-01-01', NULL, 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (2, 2, 2, '2016-07-01', '2020-06-30', 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (3, 3, 3, '2017-01-01', NULL, 'Assistant Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (4, 4, 4, '2018-03-15', NULL, 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (5, 5, 5, '2019-06-01', '2021-05-31', 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (6, 6, 6, '2020-01-01', NULL, 'Assistant Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (7, 7, 7, '2016-08-01', '2019-07-31', 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (8, 8, 8, '2017-11-01', NULL, 'Head Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (9, 9, 9, '2018-09-01', '2021-08-31', 'Assistant Coach');
INSERT INTO CoachingHistory (CoachingHistoryID, CoachID, TeamID, StartDate, EndDate, Position) VALUES (10, 10, 10, '2019-12-01', NULL, 'Head Coach');

-- Referees table
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (1, 'Michael', 'Oliver', '1985-02-20', 'English', 7);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (2, 'Pierluigi', 'Collina', '1960-02-13', 'Italian', 7);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (3, 'Joe', 'Crawford', '1951-08-30', 'American', 2);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (4, 'Alain', 'Rolland', '1966-08-22', 'Irish', 9);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (5, 'Nigel', 'Owens', '1971-06-18', 'Welsh', 9);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (6, 'Carlos', 'Ramos', '1971-09-15', 'Portuguese', 3);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (7, 'Kenny', 'Bayless', '1950-05-04', 'American', 10);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (8, 'Herb', 'Dean', '1970-09-30', 'American', 10);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (9, 'Joe', 'West', '1952-10-31', 'American', 6);
INSERT INTO Referees (RefereeID, FirstName, LastName, DateOfBirth, Nationality, SportID) VALUES (10, 'Wes', 'McCauley', '1972-01-11', 'Canadian', 5);

-- GameOfficials table
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (1, 5, 1, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (2, 2, 3, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (3, 7, 4, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (4, 1, 2, 'Assistant Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (5, 3, 10, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (6, 6, 9, 'Head Umpire');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (7, 10, 7, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (8, 8, 8, 'Head Referee');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (9, 4, 9, 'Assistant Umpire');
INSERT INTO GameOfficials (GameOfficialID, GameID, RefereeID, Role) VALUES (10, 9, 6, 'Chair Umpire');

-- Sponsors table
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (1, 'Nike', 'Sportswear', '1964-01-25');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (2, 'Adidas', 'Sportswear', '1949-08-18');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (3, 'Coca-Cola', 'Beverages', '1886-05-08');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (4, 'Emirates', 'Airlines', '1985-03-25');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (5, 'Rolex', 'Luxury Watches', '1905-11-15');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (6, 'Heineken', 'Beverages', '1864-02-15');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (7, 'Samsung', 'Electronics', '1938-03-01');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (8, 'Visa', 'Financial Services', '1958-09-18');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (9, 'Toyota', 'Automotive', '1937-08-28');
INSERT INTO Sponsors (SponsorID, SponsorName, Industry, Founded) VALUES (10, 'Red Bull', 'Energy Drinks', '1987-04-01');

-- SponsorshipDeals table
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (1, 1, 1, 'Team', '2020-01-01', '2024-12-31', 50000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (2, 2, 2, 'Player', '2019-06-01', '2023-05-31', 30000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (3, 3, 1, 'Tournament', '2021-01-01', '2025-12-31', 100000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (4, 4, 5, 'Team', '2018-07-01', '2022-06-30', 40000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (5, 5, 3, 'Tournament', '2020-01-01', '2023-12-31', 75000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (6, 6, 2, 'Tournament', '2019-01-01', '2022-12-31', 60000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (7, 7, 3, 'Player', '2020-09-01', '2024-08-31', 25000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (8, 8, 4, 'Tournament', '2021-01-01', '2024-12-31', 80000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (9, 9, 7, 'Team', '2019-03-01', '2023-02-28', 35000000.00);
INSERT INTO SponsorshipDeals (DealID, SponsorID, EntityID, EntityType, StartDate, EndDate, DealValue) VALUES (10, 10, 4, 'Player', '2020-05-01', '2024-04-30', 20000000.00);

-- MediaCoverage table
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (1, 1, 'ESPN', 15.5, 5000000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (2, 2, 'TNT', 12.3, 4000000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (3, 3, 'NBC', 18.7, 6000000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (4, 4, 'Fox Sports', 10.2, 3500000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (5, 5, 'Sky Sports', 8.9, 3000000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (6, 6, 'CBS', 14.1, 4500000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (7, 7, 'BT Sport', 7.5, 2500000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (8, 8, 'ABC', 16.8, 5500000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (9, 9, 'Eurosport', 6.2, 2000000.00);
INSERT INTO MediaCoverage (CoverageID, GameID, NetworkName, ViewershipMillions, Revenue) VALUES (10, 10, 'BBC', 9.6, 3200000.00);

-- SocialMediaAccounts table
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (1, 1, 'Player', 'Twitter', '@TomBrady', 2000000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (2, 2, 'Player', 'Instagram', '@kingjames', 50000000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (3, 1, 'Team', 'Facebook', 'NewEnglandPatriots', 7000000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (4, 3, 'Player', 'Twitter', '@rogerfederer', 12500000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (5, 2, 'Team', 'Instagram', '@lakers', 15000000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (6, 4, 'Player', 'Facebook', 'TigerWoods', 3000000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (7, 5, 'Player', 'Twitter', '@sidneycrosby', 1500000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (8, 3, 'Team', 'Instagram', '@mapleleafs', 1800000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (9, 6, 'Player', 'Twitter', '@MikeTrout', 2200000);
INSERT INTO SocialMediaAccounts (AccountID, EntityID, EntityType, Platform, Username, Followers) VALUES (10, 4, 'Team', 'Facebook', 'NewYorkYankees', 8500000);

-- Transfers table
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (1, 7, 5, 2, '2021-08-31', 100000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (2, 2, 2, 9, '2020-07-15', 85000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (3, 5, 3, 10, '2021-06-30', 65000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (4, 1, 1, 8, '2020-03-20', 50000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (5, 6, 4, 1, '2021-01-10', 75000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (6, 3, 6, 4, '2020-09-01', 55000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (7, 8, 7, 6, '2021-07-01', 70000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (8, 4, 8, 3, '2020-08-15', 60000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (9, 9, 9, 7, '2021-02-01', 45000000.00);
INSERT INTO Transfers (TransferID, PlayerID, FromTeamID, ToTeamID, TransferDate, TransferFee) VALUES (10, 10, 10, 5, '2020-12-31', 40000000.00);

-- Awards table
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (1, 'MVP', 2, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (2, 'Golden Boot', 7, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (3, 'Cy Young Award', 6, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (4, 'Ballon d''Or', 7, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (5, 'Stanley Cup', 5, 'Team');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (6, 'Super Bowl MVP', 1, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (7, 'Wimbledon Championship', 3, 'Individual');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (8, 'NBA Championship', 2, 'Team');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (9, 'World Series', 6, 'Team');
INSERT INTO Awards (AwardID, AwardName, SportID, AwardType) VALUES (10, 'FIFA World Cup', 7, 'Team');

-- AwardWinners table
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (1, 1, 2, 'Player', 2020, '29.7 points, 11.8 rebounds, 8.9 assists per game');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (2, 2, 7, 'Player', 2021, '37 goals in 34 matches');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (3, 3, 6, 'Player', 2020, '2.43 ERA, 213 strikeouts in 181 innings');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (4, 4, 7, 'Player', 2019, '51 goals and 21 assists in all competitions');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (5, 5, 3, 'Team', 2021, 'Defeated Montreal Canadiens in 5 games');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (6, 6, 1, 'Player', 2021, '201 yards, 3 touchdowns in Super Bowl LV');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (7, 7, 3, 'Player', 2019, 'Defeated Novak Djokovic in 5 sets');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (8, 8, 2, 'Team', 2020, 'Defeated Miami Heat in 6 games');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (9, 9, 4, 'Team', 2020, 'Defeated Tampa Bay Rays in 6 games');
INSERT INTO AwardWinners (AwardWinnerID, AwardID, WinnerID, WinnerType, Year, AchievementDetails) VALUES (10, 10, 5, 'Team', 2018, 'Defeated Croatia 4-2 in the final');

-- Stadiums table
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (1, 'Wembley Stadium', 'London', 'England', 90000, 2007);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (2, 'Camp Nou', 'Barcelona', 'Spain', 99354, 1957);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (3, 'MetLife Stadium', 'East Rutherford', 'USA', 82500, 2010);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (4, 'Melbourne Cricket Ground', 'Melbourne', 'Australia', 100024, 1853);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (5, 'Maracana', 'Rio de Janeiro', 'Brazil', 78838, 1950);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (6, 'Allianz Arena', 'Munich', 'Germany', 75000, 2005);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (7, 'Yankee Stadium', 'New York City', 'USA', 54251, 2009);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (8, 'San Siro', 'Milan', 'Italy', 80018, 1926);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (9, 'Estadio Azteca', 'Mexico City', 'Mexico', 87523, 1966);
INSERT INTO Stadiums (StadiumID, StadiumName, City, Country, Capacity, OpeningYear) VALUES (10, 'FNB Stadium', 'Johannesburg', 'South Africa', 94736, 1989);

-- TrainingFacilities table
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (1, 'Gillette Stadium Practice Facility', 1, 'Foxborough, Massachusetts', 75000, 2002);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (2, 'UCLA Health Training Center', 2, 'El Segundo, California', 120000, 2017);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (3, 'Ford Performance Centre', 3, 'Toronto, Ontario', 68000, 2009);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (4, 'George M. Steinbrenner Field', 4, 'Tampa, Florida', 85000, 1996);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (5, 'Aon Training Complex', 5, 'Manchester, England', 108000, 2000);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (6, 'Reliance Stadium', 6, 'Mumbai, India', 50000, 2010);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (7, 'High Performance Centre', 7, 'Wellington, New Zealand', 45000, 2015);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (8, 'Lambeau Field Training Facility', 8, 'Green Bay, Wisconsin', 70000, 1995);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (9, 'Advocate Center', 9, 'Chicago, Illinois', 60000, 2014);
INSERT INTO TrainingFacilities (FacilityID, FacilityName, TeamID, Location, Size, OpeningYear) VALUES (10, 'Bell Sports Complex', 10, 'Brossard, Quebec', 55000, 2008);

-- Merchandise table
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (1, 1, 1, 'Jersey', 99.99, 5000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (2, 2, 2, 'Cap', 29.99, 10000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (3, 3, 5, 'Scarf', 24.99, 7500);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (4, 4, 6, 'T-Shirt', 34.99, 15000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (5, 5, 7, 'Hoodie', 69.99, 3000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (6, 6, 8, 'Replica Ball', 19.99, 8000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (7, 7, 9, 'Poster', 9.99, 20000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (8, 8, 1, 'Keychain', 4.99, 25000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (9, 9, 2, 'Autographed Photo', 149.99, 1000);
INSERT INTO Merchandise (MerchandiseID, TeamID, PlayerID, ItemType, Price, StockQuantity) VALUES (10, 10, 5, 'Bobblehead', 24.99, 5000);

-- FanClubs table
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (1, 'Patriots Nation', 1, 1994, 100000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (2, 'Lakers Legion', 2, 1967, 150000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (3, 'Leafs Nation', 3, 1927, 80000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (4, 'Yankee Universe', 4, 1903, 200000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (5, 'Red Devils Supporters Club', 5, 1878, 250000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (6, 'Mumbai Maniacs', 6, 2008, 50000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (7, 'All Blacks Supporters Club', 7, 1903, 75000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (8, 'Cheeseheads', 8, 1919, 90000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (9, 'Bulls Backers', 9, 1966, 110000);
INSERT INTO FanClubs (FanClubID, ClubName, TeamID, FoundedYear, MemberCount) VALUES (10, 'Habs Fan Club', 10, 1909, 95000);

-- SportsBettingProviders table
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (1, 'Bet365', 2000, 'Stoke-on-Trent, United Kingdom');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (2, 'DraftKings', 2012, 'Boston, Massachusetts, USA');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (3, 'William Hill', 1934, 'London, United Kingdom');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (4, 'FanDuel', 2009, 'New York City, New York, USA');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (5, 'Paddy Power', 1988, 'Dublin, Ireland');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (6, 'Betfair', 2000, 'London, United Kingdom');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (7, 'Unibet', 1997, 'Malta');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (8, 'Ladbrokes', 1886, 'London, United Kingdom');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (9, '888sport', 2008, 'Gibraltar');
INSERT INTO SportsBettingProviders (ProviderID, ProviderName, FoundedYear, Headquarters) VALUES (10, 'Bwin', 1997, 'Vienna, Austria');

-- BettingOdds table
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (1, 1, 1, 1.85, 2.10, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (2, 2, 2, 1.95, 1.95, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (3, 3, 3, 2.20, 1.75, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (4, 4, 4, 1.65, 2.35, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (5, 5, 5, 2.00, 1.90, 3.50);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (6, 6, 6, 1.80, 2.15, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (7, 7, 7, 1.55, 2.60, 3.80);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (8, 8, 8, 2.05, 1.85, NULL);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (9, 9, 9, 1.75, 2.25, 3.60);
INSERT INTO BettingOdds (OddsID, GameID, ProviderID, HomeTeamOdds, AwayTeamOdds, DrawOdds) VALUES (10, 10, 10, 1.90, 2.00, NULL);

-- NutritionPlans table
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (1, 1, 'High Protein', 3500, 30, '2021-01-01', '2021-12-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (2, 2, 'Balanced', 3200, 25, '2021-02-15', '2022-02-14');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (3, 3, 'Low Carb', 2800, 35, '2021-03-01', '2021-08-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (4, 4, 'Vegan', 3000, 20, '2021-01-01', '2021-12-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (5, 5, 'Keto', 2500, 40, '2021-04-01', '2021-09-30');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (6, 6, 'Mediterranean', 3300, 22, '2021-02-01', '2022-01-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (7, 7, 'High Carb', 3800, 18, '2021-03-15', '2021-11-15');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (8, 8, 'Paleo', 2900, 32, '2021-01-01', '2021-12-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (9, 9, 'Intermittent Fasting', 3100, 28, '2021-05-01', '2021-10-31');
INSERT INTO NutritionPlans (NutritionPlanID, PlayerID, DietType, CalorieTarget, ProteinPercentage, StartDate, EndDate) VALUES (10, 10, 'Zone Diet', 3400, 30, '2021-02-01', '2022-01-31');

-- TrainingPrograms table
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (1, 1, 'Offseason Strength', '2021-02-01', '2021-07-31', 'Strength');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (2, 2, 'Pre-Season Conditioning', '2021-08-01', '2021-09-30', 'Endurance');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (3, 3, 'In-Season Maintenance', '2021-10-01', '2022-04-30', 'Skills');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (4, 4, 'Spring Training', '2021-02-15', '2021-03-31', 'Technique');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (5, 5, 'Summer Fitness Boost', '2021-06-01', '2021-07-31', 'Cardio');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (6, 6, 'Pre-Tournament Prep', '2021-08-15', '2021-09-30', 'Tactics');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (7, 7, 'World Cup Readiness', '2021-05-01', '2021-08-31', 'Team Cohesion');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (8, 8, 'Rookie Integration', '2021-04-01', '2021-08-31', 'Fundamentals');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (9, 9, 'Playoff Push', '2022-03-01', '2022-04-30', 'Mental Toughness');
INSERT INTO TrainingPrograms (ProgramID, TeamID, ProgramName, StartDate, EndDate, FocusArea) VALUES (10, 10, 'Injury Prevention', '2021-09-01', '2022-05-31', 'Flexibility');
