LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/team.csv' 
INTO TABLE teams 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/league.csv' 
INTO TABLE leagues 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/player.csv' 
INTO TABLE players 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/venue.csv' 
INTO TABLE venues
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/matches.csv' 
INTO TABLE matches
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

LOAD DATA LOCAL INFILE 'C:/Users/ukr03/Desktop/tilt/term data analys/Data/player_stats.csv' 
INTO TABLE Players_stats
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(`Match_id`,`Player_id`,`Mins`,`Position`,`Rating`,`Offside`,`Shots_total`,`Shots_on`,`Goal`,`Assist`,`Goal_conceded`,`Saves`,`Key_Pass`,`Tackles`,`Blocks`,`Interceptions`,`Dribbles`,`Dribbles_past`,`Fouls`,`Fouls_drawn`,`Y_Card`,`R_Card`,`Penalty_Won`,`Penalty_saved`,`Penalty_committed`,`Penalty_missed`,`Total_points`);
