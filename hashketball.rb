def game_hash
  {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => {
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
  }}},
   :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => {
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
     }}}}
end

def num_points_scored(string)
  game_hash.each{|team, items|
    items.each {|key, value|
      if key == :players
        value.each {|k,v|
          if k == string
            v.each {|x, y|
              if x == :points
                return y
              end
            }
          end
        }
      end
    }
  }
end

def shoe_size(string)
  game_hash.each{|team, items|
    items.each {|key, value|
      if key == :players
        value.each {|k,v|
          if k == string
            v.each {|x, y|
              if x == :shoe
                return y
              end
            }
          end
        }
      end
    }
  }
end

def team_colors(string)
  game_hash.each {|team, items|
    if items.has_value?(string)
      items.each {|key, value|
        if key == :colors
          return value
        end
      }
    end
  }
end

def team_names
  teams = []
  game_hash.each {|team, items|
    items.each {|key, value|
      if key == :team_name
        teams << value
      end
    }
  }
  teams
end
  

def player_numbers(string)
  jerseys = []
  game_hash.each{|team, items|
    if items.has_value?(string)
      items.each {|key, value|
        if key == :players
          value.each {|k, v|
            v.each {|x, y|
              if x == :number
                jerseys << y
              end
            }
          }
        end
      }
    end
  }
  jerseys.sort!
end

def player_stats(string)
	game_hash.each{|team, items|
	  items.each {|key, value|
	    if key == :players
	      value.each {|k, v|
	        if k == string
	          return v
	        end
	      }
	    end
	  }
	}
end

def number_of_rebounds(string)
  game_hash.each{|team, items|
    items.each {|key, value|
      if key == :players
        value.each {|k,v|
          if k == string
            v.each {|x, y|
              if x == :rebounds
                return y
              end
            }
          end
        }
      end
    }
  }
end

def big_shoe_rebounds
  max_shoe_size = 0
	max_player = ""
	game_hash.each{|team, items|
	  	items.each {|key, value|
	    	if key == :players
	      	value.each {|k, v|
	        	shoe = shoe_size(k)
	        	if (max_shoe_size < shoe)
	          		max_shoe_size = shoe
	          		max_player = k
	        	end
	      	}
	    	end
	  	}
	}
	number_of_rebounds(max_player)
end
