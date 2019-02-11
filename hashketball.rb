# Write your code here!
def game_hash
   {
 :home => {
   :team_name => "Brooklyn Nets",
   :colors => ["Black", "White"],
   :players => [
     {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
   }, {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
   }, {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
   }, {
     :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
   }, {
     :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
   ]
 },

 :away => {
   :team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => [
     {
       :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
     }, {
       :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
     }, {
       :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
     }, {
       :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
     }, {
       :player_name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
     }
    ]
  }
}
end

def players_list
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  total_players = home_players + away_players
  total_players
end

def num_points_scored(name)
  find = players_list.find do |player|
     name == player.fetch(:player_name)
  end
  find.fetch(:points)
end

def shoe_size(name)
  find = players_list.find do |player|
     name == player.fetch(:player_name)
  end
  find.fetch(:shoe)
end

def team_data 
  home_stats = game_hash.values_at(:home)
  away_stats = game_hash.values_at(:away)
  total_stats = home_stats + away_stats
  total_stats
end 

def team_colors(name)
  find = team_data.find do |team|
    name == team.fetch(:team_name)
  end
  find.fetch(:colors)
end

def team_names
  team_data.collect do |team|
    team[:team_name]
  end
end

def player_numbers(name)
  jersey_numbers = team_data.find do |team|
    name == team.fetch(:team_name)
  end
  jersey_numbers[:players].collect do |team|
    team[:number]
  end
end

def player_stats(name)
  players_data = players_list.find do |teammate|
    name == teammate.fetch(:player_name)
  end
  players_data.delete_if do |noun, string|
    noun == :player_name
  end
end

def biggest_shoes
  players_list.max_by do |shoes|
    shoes.fetch(:shoe)
  end
end

def big_shoe_rebounds
  biggest_shoes.fetch(:rebounds)
end