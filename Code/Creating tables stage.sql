CREATE DATABASE StagePlayerStatistics;

USE StagePlayerStatistics;

CREATE TABLE Teams(
team_id INT PRIMARY KEY,
name VARCHAR(100) 
);

CREATE TABLE Venues(
venue_id INT PRIMARY KEY,
name VARCHAR(255),
city VARCHAR(255)
);

CREATE TABLE Leagues(
league_id INT PRIMARY KEY,
name VARCHAR(100), 
country VARCHAR(80) 
);

CREATE TABLE Players(
player_id INT PRIMARY KEY,
name VARCHAR(100),
number INT
);

CREATE TABLE Matches(
fixture_id INT PRIMARY KEY,
home_id INT,
away_id INT,
referee VARCHAR(50),
date TINYINT UNSIGNED,
month TINYINT UNSIGNED,
year SMALLINT UNSIGNED,
venue_id INT,
league_id INT,
league_round VARCHAR(50),
h_goals TINYINT UNSIGNED,
a_goals TINYINT UNSIGNED,
FOREIGN KEY(home_id) REFERENCES Teams(team_id),
FOREIGN KEY(away_id) REFERENCES Teams(team_id),
FOREIGN KEY(venue_id) REFERENCES Venues(venue_id),
FOREIGN KEY(league_id) REFERENCES Leagues(league_id)
);

CREATE TABLE Players_stats(
player_stats_id INT PRIMARY KEY AUTO_INCREMENT,
match_id INT,
player_id INT,
mins TINYINT UNSIGNED,
position CHAR(1),
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
FOREIGN KEY(match_id) REFERENCES Matches(fixture_id),
FOREIGN KEY(player_id) REFERENCES Players(player_id)
);
