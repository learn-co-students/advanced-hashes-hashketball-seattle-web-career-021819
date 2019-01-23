require "pry"

def game_hash
  teams = {
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

def num_points_scored(jeff_name)
  points = 0
  stats_hash = game_hash
  stats_hash.each do |location, team_data|
    players_hash = team_data[:players]
    players_hash.each do |the_player_name, the_player_data_hash|
      if the_player_name == jeff_name
        points = stats_hash[location][:players][jeff_name][:points]
      end
    end
  end
  points
end


def shoe_size(input_player)
  shoes = 0
  stats = game_hash
  stats.each do |location, team_data|
    player_hash = team_data[:players]
    player_hash.each_key do |their_name|
      if their_name == input_player
        shoes = team_data[:players][their_name][:shoe]
      end
    end
  end
  shoes
end


def team_colors(team_input)
  color_array = []
  stats = game_hash
  stats.each do |location, team_data|
    if team_data[:team_name] == team_input
      color_array = team_data[:colors]
    end
  end
  color_array
end


def team_names
  team_array = []
  stats = game_hash
  stats.each do |location, team_data|
    team_array << team_data[:team_name]
  end
  team_array
end


def player_numbers(team_input)
  numbers_array = []
  stats = game_hash
  stats.each do |location, team_data|
    if team_data[:team_name] == team_input
      team_data[:players].each_value do |data_hash|
        numbers_array << data_hash[:number]
      end
    end
  end
  numbers_array
end


def player_stats(name_input)
  output_hash = {}
  stats = game_hash
  stats.each do |location, team_data|
    team_data[:players].each do |their_name, their_stats|
      if their_name == name_input
        output_hash = their_stats
      end
    end
  end
  output_hash
end


def biggest_shoe_name
  name_output = ""
  really_big_shoe = 0
  stats = game_hash
  stats.each_value do |team_data|
    team_data[:players].each do |their_name, player_data|
      if player_data[:shoe] > really_big_shoe
        really_big_shoe = player_data[:shoe]
        name_output = their_name
      end
    end
  end
  name_output
end


def big_shoe_rebounds
  rebounds_output = 0
  target_name = biggest_shoe_name
  stats = game_hash
  stats.each_value do |team_data|
    if team_data[:players].key?(target_name)
      rebounds_output = team_data[:players][target_name][:rebounds]
    end
  end
  rebounds_output
end
