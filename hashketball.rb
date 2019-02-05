# Write your code here!



def game_hash
  game_hash =
  {
    :home => {
      :team_name => "Brooklyn nets",
      :colors => ["Black", "White"],
      :players =>{
        :alan_anderson => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        :reggie_evans => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7

        },
        :brook_lopez => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        :mason_plumlee => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5

        },
        :jason_terry => {
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
      :team_name => "Charlotte hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>{
        :jeff_adrien => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        :bismak_biyombo => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10

        },
        :desagna_diop => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        :ben_gordon => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0

        },
        :brendan_haywood => {
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


def num_points_scored(player)
  player_to_check = player.gsub(/\s+/,"_").downcase.to_sym #convert text input into symbol for analysis
  player_to_check = player_to_check.to_sym

  #iterate down to player level for each team, check if matches, produce points if it does
  game_hash.each do |team, data|

    data.each do |attribute, data2|
      if attribute == :players

          data2.each do |player, value|
            if player == player_to_check
              value.each do |stat, number|
                if stat == :points
                  return number
                end
              end
            end
          end
      end
    end
  end
end


def shoe_size(player)
  player_to_check = player.gsub(/\s+/,"_").downcase.to_sym #convert text input into symbol for analysis
  player_to_check = player_to_check.to_sym

  #iterate down to player level for each team, check if matches, produce points if it does
  game_hash.each do |team, data|

    data.each do |attribute, data2|
      if attribute == :players

          data2.each do |player, value|
            if player == player_to_check
              value.each do |stat, number|
                if stat == :shoe
                  return number
                end
              end
            end
          end
      end
    end
  end
end


def team_colors(team)
  team_to_check = team.capitalize

  game_hash.each do |team, data|

    data.each do |data2, var|
      if data2 == :team_name
        if var == team_to_check
          data.each do |data2, var|
            if data2 == :colors
              return var
          end
        end
      end
    end
  end
end
end


def team_names
  team_name_hash = []
  game_hash.each do |team, data|

    data.each do |data2, val|
      if data2 == :team_name
         team_name_hash << val.gsub(/\w+/, &:capitalize)
      end
    end
  end
  team_name_hash
end


def player_numbers(teams)

  team_input = teams.capitalize
  jersey_num_arr = []

  game_hash.each do |team, data|

    data.each do |attribute, data2|
       if attribute == :team_name
          if data2 == team_input
            data.each do |attribute2, data3|
              if attribute2 == :players
                data3.each do |a3, d4|
                  d4.each do |a5, d5|
                    if a5 == :number
                      jersey_num_arr << d5
                    end
                  end
                end
              end
            end
          end
        end
    end
  end
  jersey_num_arr
end


def player_stats(name)
  player_check = name.gsub(/\s+/,"_").downcase
  player_check = player_check.to_sym

  game_hash.each do |team, data|

    data.each do |attribute, data2|
      if attribute == :players
        data2.each do |a2, d3|
          if a2 == player_check
            return d3
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  largest_shoe = 0
  largest_shoe_player = ""

  game_hash.each do |team, data|

    data.each do |att, data2|
      if att == :players
        data2.each do |a3, d3|
          d3.each do |a4, d4|
            if a4 == :shoe
              if d4 > largest_shoe
                largest_shoe = d4
                  d3.each do |a4, d4|
                    if a4 == :rebounds
                      return d4
                    end
                  end
                #puts a3--- a3 == the players  name
              end
            end
          end
        end
      end
    end
  end
end
