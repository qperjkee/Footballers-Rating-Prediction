import pandas as pd

def filter_and_save_csv(filename, columns_to_keep):
    data = pd.read_csv(filename)
    
    data = data[columns_to_keep]
    
    data.to_csv(filename, index=False)

filter_and_save_csv("league.csv", ["League_id", "Name", "Country"])
filter_and_save_csv("team.csv", ["Team_id", "Name"])
filter_and_save_csv("player.csv", ["Player_id", "Name", "Number"])
filter_and_save_csv("matches.csv", ["Fixture_id","Home_id","Away_id","Referee","Date","Month","Year","Venue_id","League_id","league_round","H_Goals","A_Goals"])

file_path = "venue.csv"
data = pd.read_csv(file_path)

data = data.dropna(subset=['Venue_id'])

data['Venue_id'] = data['Venue_id'].astype(int)

data.to_csv(file_path, index=False)

file_path = 'player_stats.csv'
data = pd.read_csv(file_path)

data = data[data['Mins'] != 0]

data.to_csv(file_path, index=False)
