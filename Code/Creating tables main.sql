CREATE DATABASE PlayerStatistics;

USE PlayerStatistics;

CREATE TABLE Teams(
team_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE Venues(
venue_id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
city VARCHAR(255)
);

CREATE TABLE Leagues(
league_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL, 
country VARCHAR(80) 
);

CREATE TABLE Players(
player_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
number INT
);

CREATE TABLE Referees(
referee_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE League_rounds(
league_round_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE Positions(
position_id INT PRIMARY KEY AUTO_INCREMENT,
name CHAR(1) NOT NULL
);

CREATE TABLE Dates(
date_id INT PRIMARY KEY AUTO_INCREMENT,
date TINYINT UNSIGNED NOT NULL,
month TINYINT UNSIGNED NOT NULL,
year SMALLINT UNSIGNED NOT NULL
);

CREATE TABLE Fact_table_matches(
fact_id INT PRIMARY KEY,
league_id INT,
venue_id INT,
home_team_id INT,
away_team_id INT,
referee_id INT,
date_id INT,
league_round_id INT,
home_team_goals TINYINT,
away_team_goals TINYINT,
FOREIGN KEY(league_id) REFERENCES Leagues(league_id),
FOREIGN KEY(venue_id) REFERENCES Venues(venue_id),
FOREIGN KEY(home_team_id) REFERENCES Teams(team_id),
FOREIGN KEY(away_team_id) REFERENCES Teams(team_id),
FOREIGN KEY(referee_id) REFERENCES Referees(referee_id),
FOREIGN KEY(date_id) REFERENCES Dates(date_id),
FOREIGN KEY(league_round_id) REFERENCES League_rounds(league_round_id)
);

CREATE TABLE Fact_table_players(
fact_id INT PRIMARY KEY AUTO_INCREMENT,
match_id INT,
player_id INT,
position_id INT,
mins_played TINYINT UNSIGNED,
home_team_goals TINYINT,
away_team_goals TINYINT,
rating DECIMAL(1,1),
offside TINYINT UNSIGNED,
shots_total TINYINT UNSIGNED,
shots_on TINYINT UNSIGNED,
goal TINYINT UNSIGNED,
assist TINYINT UNSIGNED,
goal_conceded TINYINT UNSIGNED,
saves TINYINT UNSIGNED,
key_pass TINYINT UNSIGNED,
tackles TINYINT UNSIGNED,
blocks TINYINT UNSIGNED,
interceptions TINYINT UNSIGNED,
dribbles TINYINT UNSIGNED,
dribbles_past TINYINT UNSIGNED,
fouls TINYINT UNSIGNED,
fouls_drawn TINYINT UNSIGNED,
y_card TINYINT UNSIGNED,
r_card TINYINT UNSIGNED,
penalty_won TINYINT UNSIGNED,
penalty_saved TINYINT UNSIGNED,
penalty_committed TINYINT UNSIGNED,
penalty_missed TINYINT UNSIGNED,
total_points TINYINT,
FOREIGN KEY(player_id) REFERENCES Players(player_id),
FOREIGN KEY(match_id) REFERENCES Fact_table_matches(fact_id),
FOREIGN KEY(position_id) REFERENCES Positions(position_id)
);
