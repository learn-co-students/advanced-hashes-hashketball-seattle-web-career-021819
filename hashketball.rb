#require "pry"

def game_hash
  {
    :home => {:team_name => "Brooklyn Nets",
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
        }},
    :away => {:team_name => "Charlotte Hornets",
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
        }}
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data| #home/away , first level
    team_data.each do |attribute, data|  #names/colors , values of those
      if attribute == :players         #gets to players level
        data.each do |names, stats|  #go through names in player hash
          if names == player_name   #find a player name match
            stats.each do |type, stat|  #go through player's stats
              if type == :points    #if land at points
                return stat       #return the actual stat value
          end
        end
end
      end
    end
  end
end
end
#num_points_scored("Brendan Haywood")


def shoe_size(player_name)
  game_hash.each do |location, team_data| #home/away , first level
    team_data.each do |attribute, data|  #names/colors , values of those
      if attribute == :players         #gets to players level
        data.each do |names, stats|  #go through names in player hash
          if names == player_name   #find a player name match
            stats.each do |type, stat|  #go through player's stats
              if type == :shoe     #if land at size
                return stat       #return the actual stat value
          end
        end
end
      end
    end
  end
end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data.has_value?(team)
        team_data.each do |attribute, data|
          if attribute == :colors
            return data
        end
      end
      end
    end
  end

  def team_names
    return_array = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :team_name
          return_array << data
        end
      end
    end
    return return_array
  end

  def player_numbers(team_name)
    return_array = []
      game_hash.each do |location, team_data|
        if team_data.has_value?(team_name)
          team_data.each do |attribute, data|
           if attribute == :players
             data.each do |names, stats|
               stats.each do |stats, type|

               if stats == :number
                 return_array << type
             end
           end
           end
         end
    end
  end
end
  return return_array
end


def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |names, stats|
          if names == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat_type|
      if stat_type[:shoe] > biggest_shoe
        biggest_shoe = stat_type[:shoe]
        rebounds = stat_type[:rebounds]
      end
    end
end
return rebounds
end 
