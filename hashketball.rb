# Write your code here!

require 'pry'

def game_hash
  match_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12},
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |home_away, team_data|
    team_data.each do |team, attributes|
      if attributes.is_a?(Hash)
        attributes.each do |player_name, player_stats|
           if player_name == name
            player_stats.each do |stat, data|
              if stat.to_s == "points"
                return data
              end
            end
           end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |home_away, team_data|
    team_data.each do |team, attributes|
      if attributes.is_a?(Hash)
        attributes.each do |player_name, player_stats|
           if player_name == name
            player_stats.each do |stat, data|
              if stat.to_s == "shoe"
                return data
              end
            end
           end
        end
      end
    end
  end
end

def team_colors(team_names)
  game_hash.each do |home_away, team_data|
      if team_data.values.include?(team_names)
        team_data.each do |team, attributes|
          if team.to_s == "colors"
            return attributes
          end
        end
      end
  end
end

def team_names
  teams_names = []
  game_hash.collect do |home_away, team_data|
    team_data.each do |attributes, data|
      if attributes == :team_name
        teams_names.push(data)
      end
    end
  end
  return teams_names
end

def player_numbers(team_name)
  players_number = []
  game_hash.each do |home_away, team_data|
      if team_data.values.include?(team_name)
        team_data.each do |team, attributes|
          if team.to_s == "players"
            attributes.each do |name, data|
              data.each do |number, shirt_no|
                if number.to_s == "number"
                  players_number.push(shirt_no)
                end
              end
            end
          end
        end
      end
  end
  return players_number
end

def player_stats(player_name)
  game_hash.each do |home_away, team_data|
    team_data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoes = {}
  game_hash.each do |home_away, team_data|
    team_data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          stats.each do |stat, value|
            if stat == :shoe
              biggest_shoes[player] = value
            end
          end
        end
        attributes.each do |player, stats|
          stats.each do |stat, value|
            player_with_biggest_shoes = biggest_shoes.key(biggest_shoes.values.max)
              if player == player_with_biggest_shoes && stat == :rebounds
                return value
              end
          end
        end
      end
    end
  end
end
