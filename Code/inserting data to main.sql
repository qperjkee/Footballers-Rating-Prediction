INSERT INTO PlayerStatistics.Teams (team_id, name)
SELECT DISTINCT team_id, name
FROM StagePlayerStatistics.Teams ST
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Teams PT
    WHERE PT.name = ST.name
);

INSERT INTO PlayerStatistics.Venues (venue_id, name, city)
SELECT DISTINCT venue_id, name, city
FROM StagePlayerStatistics.Venues SV
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Venues PV
    WHERE PV.name = SV.name AND PV.city = SV.city
);

INSERT INTO PlayerStatistics.Leagues (league_id, name, country)
SELECT DISTINCT league_id, name, country
FROM StagePlayerStatistics.Leagues SL
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Leagues PL
    WHERE PL.name = SL.name AND PL.country = SL.country
);

INSERT INTO PlayerStatistics.Players (player_id, name, number)
SELECT DISTINCT player_id, name, number
FROM StagePlayerStatistics.Players SP
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Players PP
    WHERE PP.name = SP.name AND PP.number = SP.number
);

INSERT INTO PlayerStatistics.Referees (name)
SELECT DISTINCT referee
FROM StagePlayerStatistics.Matches SM
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Referees PR
    WHERE PR.name = SM.referee
);

INSERT INTO PlayerStatistics.League_rounds (name)
SELECT DISTINCT league_round
FROM StagePlayerStatistics.Matches SM
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.League_rounds PL
    WHERE PL.name = SM.league_round
);

INSERT INTO PlayerStatistics.Positions (name)
SELECT DISTINCT position
FROM StagePlayerStatistics.Players_stats SP
WHERE SP.position NOT IN (
    SELECT name
    FROM PlayerStatistics.Positions
);

INSERT INTO PlayerStatistics.Dates (date, month, year)
SELECT DISTINCT date, month, year
FROM StagePlayerStatistics.Matches SM
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Dates PD
    WHERE PD.date = SM.date AND PD.month = SM.month AND PD.year = SM.year
);

INSERT INTO PlayerStatistics.Fact_table_matches(
    fact_id,
    league_id,
    venue_id,
    home_team_id,
    away_team_id,
    referee_id,
    date_id,
    league_round_id,
    home_team_goals,
    away_team_goals
)
SELECT 
    m.fixture_id AS fact_id,
    l.league_id,
    v.venue_id,
    ht.team_id AS home_team_id,
    at.team_id AS away_team_id,
    (SELECT referee_id FROM PlayerStatistics.Referees WHERE name = m.referee) AS referee_id,
    (SELECT date_id FROM PlayerStatistics.Dates WHERE date = m.date AND month = m.month AND year = m.year) AS date_id,
    (SELECT league_round_id FROM PlayerStatistics.League_rounds WHERE name = m.league_round) AS league_round_id,
    m.h_goals AS home_team_goals,
    m.a_goals AS away_team_goals
FROM 
    StagePlayerStatistics.Matches AS m
JOIN
    PlayerStatistics.Leagues l ON m.league_id = l.league_id
JOIN
    PlayerStatistics.Venues v ON m.venue_id = v.venue_id
JOIN
    StagePlayerStatistics.Teams ht ON m.home_id = ht.team_id
JOIN
    StagePlayerStatistics.Teams at ON m.away_id = at.team_id
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Fact_table_matches AS F
    WHERE F.fact_id = m.fixture_id
      AND F.home_team_id = ht.team_id
      AND F.away_team_id = at.team_id
      AND F.date_id = (SELECT date_id FROM PlayerStatistics.Dates WHERE date = m.date AND month = m.month AND year = m.year)
);

INSERT INTO PlayerStatistics.Fact_table_players(
    match_id,
    player_id,
    position_id,
    mins_played,
    rating,
    offside,
    shots_total,
    shots_on,
    goal,
    assist,
    goal_conceded,
    saves,
    key_pass,
    tackles,
    blocks,
    interceptions,
    dribbles,
    dribbles_past,
    fouls,
    fouls_drawn,
    y_card,
    r_card,
    penalty_won,
    penalty_saved,
    penalty_committed,
    penalty_missed,
    total_points
)
SELECT 
    fm.fact_id,
    p.player_id,
    (SELECT position_id FROM PlayerStatistics.Positions WHERE name = ps.position) AS position_id,
    mins AS mins_played,
    rating,
    offside,
    shots_total,
    shots_on,
    goal,
    assist,
    goal_conceded,
    saves,
    key_pass,
    tackles,
    blocks,
    interceptions,
    dribbles,
    dribbles_past,
    fouls,
    fouls_drawn,
    y_card,
    r_card,
    penalty_won,
    penalty_saved,
    penalty_committed,
    penalty_missed,
    total_points
FROM 
    StagePlayerStatistics.Players_stats AS ps
JOIN
    PlayerStatistics.Fact_table_matches AS fm ON ps.match_id = fm.fact_id
JOIN
	PlayerStatistics.Players p ON ps.player_id = p.player_id
WHERE NOT EXISTS (
    SELECT 1
    FROM PlayerStatistics.Fact_table_players AS F
    WHERE F.match_id = ps.match_id
      AND F.player_id = ps.player_id
);