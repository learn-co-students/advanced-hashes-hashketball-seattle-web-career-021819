require 'pry'



def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end
#takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if name == player
        return attribute[:points]
      end
    end
  end
end

#takes in an argument of a player's name and returns the shoe size for that player.
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if name == player
        return attribute[:shoe]
      end
    end
  end
end

#takes in an argument of the team name and returns an array of that teams colors
def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

#operates on the game hash to return an array of the team names.
def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

# takes in an argument of a team name and returns an array of the jersey number's for that team.
def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].map do |name, attribute|
        numbers << attribute[:number]
      end
    end
  end
  numbers
end

#takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if name == player
        return attribute
      end
    end
  end
end

#return the number of rebounds associated with the player that has the largest shoe size.
def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if attribute[:shoe] > shoe_size
        shoe_size = attribute[:shoe]
        rebounds = attribute[:rebounds]
        return rebounds
      end
    end
  end
end

# BONUS | Which player has the most points?
def most_points_scored
   most_point = 0
   player = 0
   game_hash.each do |location, team_data|
      team_data[:players].each do |name, attribute|
         if attribute[:points] > most_point
            most_point = attribute[:points]
            player = name
         end
     end
   end
   player
end
