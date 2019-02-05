# Write your code here!
require 'pry'

def game_hash
{
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}
end

def get_player_stat(player, stat)
  game_hash.each do |team, info|
    if info[:players].include?(player)
      return info[:players][player][stat]
    end
  end
end

def num_points_scored(player)
  get_player_stat(player, :points)
end

def shoe_size(player)
  get_player_stat(player, :shoe)
end

def team_colors(team)
  game_hash[:home][:team_name] == team ? game_hash[:home][:colors] : game_hash[:away][:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  player_numbers = []

  game_hash.each do |team, info|
    if info[:team_name] == team_name
      info[:players].each do |player, stats|
        player_numbers << stats[:number]
      end
    end
  end

  player_numbers
end

def player_stats(player)
  game_hash.each do |team, info|
    if info[:players].include?(player)
      return info[:players][player]
    end
  end
end

def get_largest_shoe_player
  largest_shoe = 0
  player_name = ""

  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if stats[:shoe] > largest_shoe
        largest_shoe = stats[:shoe]
        player_name = player
      end
    end
  end

  player_name
end
      
def big_shoe_rebounds() 
  get_player_stat(get_largest_shoe_player, :rebounds)
end

# BONUS

def most_points_scored
  most_points = 0
  player_name = ""

  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_name = player
      end
    end
  end

  player_name
end

def winning_team
  total1 = 0
  total2 = 0

  game_hash[:home][:players].each do |player, stats|
      total1 += stats[:points]
  end

  game_hash[:away][:players].each do |player, stats|
      total2 += stats[:points]
  end

  total1 > total2 ? game_hash[:home][:team_name] : game_hash[:away][:team_name] 
end

def player_with_longest_name
  player_name = ""

  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if player.length > player_name.length
        player_name = player
      end
    end
  end

  player_name
end

def long_name_steals_a_ton?
  player_name = player_with_longest_name
  steals_a_ton= ""
  steals = 0

  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        steals_a_ton = player
      end
    end
  end

  player_name == steals_a_ton
end