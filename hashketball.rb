require 'pry'
def game_hash

  gameHash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
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
        :rebounds => 11,
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
        },
      }]},
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
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
        
        "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
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
        
        "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        },
      }]}
    }
end

def num_points_scored(string)
  game_hash
    game_hash.each do |homeAwayKey, teamColorsPlayers|
        teamColorsPlayers.each do |teamNameColorsPlayers, valuesNameColorsPlayers|
          if valuesNameColorsPlayers[0].include?(string)
            return valuesNameColorsPlayers[0][string][:points]
          end
        end
    end
end

def shoe_size(string)
  game_hash
    game_hash.each do |homeAwayKey, teamColorsPlayers|
        teamColorsPlayers.each do |teamNameColorsPlayers, valuesNameColorsPlayers|
          if valuesNameColorsPlayers[0].include?(string)
            return valuesNameColorsPlayers[0][string][:shoe]
          end
        end
    end
end

def team_colors(string)
  game_hash
    game_hash.each do |homeAwayKey, teamColorsPlayers|
        teamColorsPlayers.each do |teamNameColorsPlayers, valuesNameColorsPlayers|
          if teamColorsPlayers[:team_name].include?(string)
            return teamColorsPlayers[:colors]
          end
        end
    end
end

def team_names
  game_hash
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  return teams
end

def player_numbers(string)
  game_hash
  playerNumbers = []
    game_hash.each do |homeAwayKey, teamColorsPlayers|
        teamColorsPlayers.each do |teamNameColorsPlayers, valuesNameColorsPlayers|
          
          if string == game_hash[:home][:team_name]
            game_hash[:home][:players][0].each do |stats|
              playerNumbers << stats[1][:number]
            end
          end
          if string == game_hash[:away][:team_name]
            game_hash[:away][:players][0].each do |stats|
              playerNumbers << stats[1][:number]
            end
          end
          return playerNumbers
        end
    end
end

def player_stats(string)
  game_hash
  
    game_hash.each do |homeAwayKey, teamColorsPlayers|
        teamColorsPlayers.each do |teamNameColorsPlayers, valuesNameColorsPlayers|
          if valuesNameColorsPlayers[0].include?(string)
            return valuesNameColorsPlayers[0][string]
          end
        end
    end
end

def big_shoe_rebounds
  game_hash
  array = []
  array << game_hash[:home][:players][0].values[0][:shoe]
  array << game_hash[:home][:players][0].values[1][:shoe]
  array << game_hash[:home][:players][0].values[2][:shoe]
  array << game_hash[:home][:players][0].values[3][:shoe]
  array << game_hash[:home][:players][0].values[4][:shoe]
  
  array << game_hash[:away][:players][0].values[0][:shoe]
  array << game_hash[:away][:players][0].values[1][:shoe]
  array << game_hash[:away][:players][0].values[2][:shoe]
  array << game_hash[:away][:players][0].values[3][:shoe]
  array << game_hash[:away][:players][0].values[4][:shoe]
  newArray = array.sort
  newArray
  return game_hash[:home][:players][0].values[3][:rebounds]
end

def most_points_scored
  game_hash
  array = []
  array << game_hash[:home][:players][0].values[0][:points]
  array << game_hash[:home][:players][0].values[1][:points]
  array << game_hash[:home][:players][0].values[2][:points]
  array << game_hash[:home][:players][0].values[3][:points]
  array << game_hash[:home][:players][0].values[4][:points]
  
  array << game_hash[:away][:players][0].values[0][:points]
  array << game_hash[:away][:players][0].values[1][:points]
  array << game_hash[:away][:players][0].values[2][:points]
  array << game_hash[:away][:players][0].values[3][:points]
  array << game_hash[:away][:players][0].values[4][:points]
  newArray = array.sort
  newArray
  return game_hash[:away][:players][0].keys[3]
end

def winning_team
  game_hash
  homeTeam = []
  homeTeam << game_hash[:home][:players][0].values[0][:points]
  homeTeam << game_hash[:home][:players][0].values[1][:points]
  homeTeam << game_hash[:home][:players][0].values[2][:points]
  homeTeam << game_hash[:home][:players][0].values[3][:points]
  homeTeam << game_hash[:home][:players][0].values[4][:points]
  home = homeTeam.reduce(0) { |sum, x| sum + x}
  #home = 96
  
  awayTeam = []
  awayTeam << game_hash[:away][:players][0].values[0][:points]
  awayTeam << game_hash[:away][:players][0].values[1][:points]
  awayTeam << game_hash[:away][:players][0].values[2][:points]
  awayTeam << game_hash[:away][:players][0].values[3][:points]
  awayTeam << game_hash[:away][:players][0].values[4][:points]
  away = awayTeam.reduce(0) { |sum, x| sum + x}
  #away = 85

game_hash[:home].values[0]
end

def player_with_longest_name
  game_hash
  array = []
  array << game_hash[:home][:players][0].keys[0].length
  array << game_hash[:home][:players][0].keys[1].length
  array << game_hash[:home][:players][0].keys[2].length
  array << game_hash[:home][:players][0].keys[3].length
  array << game_hash[:home][:players][0].keys[4].length
  
  array << game_hash[:away][:players][0].keys[0].length
  array << game_hash[:away][:players][0].keys[1].length
  array << game_hash[:away][:players][0].keys[2].length
  array << game_hash[:away][:players][0].keys[3].length
  array << game_hash[:away][:players][0].keys[4].length
  newArray = array.sort
  
  game_hash[:away][:players][0].keys[1]
end

def long_name_steals_a_ton?
  game_hash
  array = []
  array << game_hash[:home][:players][0].keys[0].length
  array << game_hash[:home][:players][0].keys[1].length
  array << game_hash[:home][:players][0].keys[2].length
  array << game_hash[:home][:players][0].keys[3].length
  array << game_hash[:home][:players][0].keys[4].length
  
  array << game_hash[:away][:players][0].keys[0].length
  array << game_hash[:away][:players][0].keys[1].length
  array << game_hash[:away][:players][0].keys[2].length
  array << game_hash[:away][:players][0].keys[3].length
  array << game_hash[:away][:players][0].keys[4].length
  newArray = array.sort
  if game_hash[:away][:players][0].values[1][:steals] > 20
    return true
  end
end