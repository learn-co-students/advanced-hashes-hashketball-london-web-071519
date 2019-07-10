
def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
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
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(player_name)
  points = nil
  game_hash.each{ |team, info|
     info[:players].each { |people|
        if people[:name] == player_name
          points = people[:points]
        end
      }
   }
points
end

def shoe_size(player_name)
  shoe = nil
  game_hash.each{ |team, info|
      info[:players].each{ |people|
        if people[:name] == player_name
           shoe = people[:shoe]
        end
        }}
 shoe
end

def team_colors(team_name)
  game_hash.each{ |team, info|
  if info[:team_name] == team_name
    return colors = info[:colors]
  end
  }
end

def team_names
  teams = []
  game_hash.each{ |team, info|
    teams << info[:team_name]
    }
 teams
 end

 def player_numbers(team_name)
   jerseys =[]
   num = nil
    game_hash.each{ |team, info|
      if info[:team_name] == team_name
        info[:players].each{ |people|
          jerseys <<  people[:number]

            }

        end
}

jerseys
  end

  def player_stats(player_name)
    h = {}
    game_hash.each{ |team, info|
       info[:players].each { |people|
         if people[:name] == player_name
           h =  people
           h.delete(:name)
         end
         }
       }
p h
end

def big_shoe_rebounds
  h = {}
  s= {}
  a = []
  rebound = nil
  game_hash.each{ |team, info|
     info[:players].each { |people|
       h["#{people[:name]}"] = people[:shoe]
      }}
    #Sort the hash for largest shoe size and player's name
    s = h.sort_by{|k,v| v}.reverse.to_h
    a = s.first.to_a
    p a[0]
    #Sub-routine to check on the player's rebound
    game_hash.each{ |team, info|
        info[:players].each{ |people|
          if people[:name] == a[0]
             rebound = people[:rebounds]
          end
          }}
    p rebound
  end

def most_points_scored
    h = {}
    s= {}
    a = []
    game_hash.each{ |team, info|
       info[:players].each { |people|
         h["#{people[:name]}"] = people[:points]
        }}
      #Sort the hash for highest points and player's name
      s = h.sort_by{|k,v| v}.reverse.to_h
      a = s.first.to_a
      p a[0]
    end


    def winning_team
      team_score = nil
      h = {}
      s = {}

        game_hash.each{ |team, info|
          team_score = 0
           info[:players].each { |people|
             team_score += people[:points]
            }
          h["#{info[:team_name]}"] = team_score
          }
          #Sort the hash for highest points and player's name
          s = h.sort_by{|k,v| v}.reverse.to_h
          a = s.first.to_a
          p a[0]
    end

def player_with_longest_name
      h = {}
      s= {}
      a = []
      game_hash.each{ |team, info|
         info[:players].each { |people|
           h["#{people[:name]}"] = people[:name].length
          }}
        #Sort the hash for name_length and player's name
        s = h.sort_by{|k,v| v}.reverse.to_h
        a = s.first.to_a
        p a[0]
      end

def long_name_steals_a_ton?
  l_name = player_with_longest_name
  h = {}
  s= {}
  a = []
  game_hash.each{ |team, info|
     info[:players].each { |people|
       h["#{people[:name]}"] = people[:steals]
      }}
    #Sort the hash for most steals and player's name
    s = h.sort_by{|k,v| v}.reverse.to_h
    a = s.first.to_a
    return true if a[0] == l_name
  end
