CREATE DATABASE Test;

USE Test;

CREATE TABLE Teams(
team_id INT PRIMARY KEY,
name VARCHAR(50) 
);

CREATE TABLE Venues(
venue_id INT PRIMARY KEY,
name VARCHAR(255),
city VARCHAR(255)
);

CREATE TABLE Leagues(
league_id INT PRIMARY KEY,
name VARCHAR(60), 
country VARCHAR(50) 
);

CREATE TABLE Players(
player_id INT PRIMARY KEY,
name VARCHAR(60),
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

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/team.csv' 
INTO TABLE teams 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (`Team_id`,`Name`);

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/league.csv' 
INTO TABLE leagues 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (`League_id`,`Name`,`Country`);

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/player.csv' 
INTO TABLE players 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS (`Player_id`,`Name`,@ignore,`Number`);

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/venue.csv' 
INTO TABLE venues
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS 
(`Venue_id`,`Name`,`City`);

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/matches.csv' 
INTO TABLE matches
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS 
(`Fixture_id`,`Home_id`,`Away_id`,`Referee`,`Date`,`Month`,`Year`,`Venue_id`,@ignore,`League_id`,`league_round`,@ignore,`H_Goals`,`A_Goals`);

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/player_stats.csv' 
INTO TABLE Players_stats
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS 
(`Match_id`,`Player_id`,`Mins`,`Position`,`Rating`,`Offside`,`Shots_total`,`Shots_on`,`Goal`,`Assist`,`Goal_conceded`,`Saves`,`Key_Pass`,`Tackles`,`Blocks`,`Interceptions`,`Dribbles`,`Dribbles_past`,`Fouls`,`Fouls_drawn`,`Y_Card`,`R_Card`,`Penalty_Won`,`Penalty_saved`,`Penalty_committed`,`Penalty_missed`,`Total_points`);
