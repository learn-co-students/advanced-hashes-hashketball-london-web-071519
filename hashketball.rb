require "pry"

def game_hash()
  hash = {}
  hash[:home] = {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],
    :players => [
    {"Alan Anderson" => {:number => 0, :shoe => 16,
        :points => 22, :rebounds => 12, :assists => 12, :steals => 3,
        :blocks => 1, :slam_dunks => 1}},
    {"Reggie Evans" => {:number => 30, :shoe => 14,
        :points => 12, :rebounds => 12, :assists => 12, :steals => 12,
        :blocks => 12, :slam_dunks => 7}},
    {"Brook Lopez" => {:number => 11, :shoe => 17,
        :points => 17, :rebounds => 19, :assists => 10, :steals => 3,
        :blocks => 1, :slam_dunks => 15}},
     {"Mason Plumlee" => {:number => 1, :shoe => 19,
         :points => 26, :rebounds => 11, :assists => 6, :steals => 3,
         :blocks => 8, :slam_dunks => 5}},
     {"Jason Terry" => {:number => 31, :shoe => 15,
         :points => 19, :rebounds => 2, :assists => 2, :steals => 4,
         :blocks => 11, :slam_dunks => 1}}]}


hash[:away] = {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
  :players => [
    {"Jeff Adrien" => {:number => 4, :shoe => 18,
      :points => 10, :rebounds => 1, :assists => 1, :steals => 2,
      :blocks => 7, :slam_dunks => 2}},
    {"Bismack Biyombo" => {:number => 0, :shoe => 16,
        :points => 12, :rebounds => 4, :assists => 7, :steals => 22,
        :blocks => 15, :slam_dunks => 10}},
    {"DeSagna Diop" => {:number => 2, :shoe => 14,
        :points => 24, :rebounds => 12, :assists => 12, :steals => 4,
        :blocks => 5, :slam_dunks => 5}},
    {"Ben Gordon" => {:number => 8, :shoe => 15,
          :points => 33, :rebounds => 3, :assists => 2, :steals => 1,
          :blocks => 1, :slam_dunks => 0}},
    {"Kemba Walker" => {:number => 33, :shoe => 15,
              :points => 6, :rebounds => 12, :assists => 12, :steals => 7,
              :blocks => 5, :slam_dunks => 12}}]}

  return hash
end

#puts game_hash()

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry

      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

#good_practices()


def num_points_scored(name)
  game = game_hash
  game[:home][:players].each do |hometeam|
    if name == hometeam.keys[0]
      return hometeam[hometeam.keys[0]][:points]
    end
  end
  game[:away][:players].each do |awayteam|
    if name == awayteam.keys[0]
      return awayteam[awayteam.keys[0]][:points]
    end
  end
end


def shoe_size(name)
  game = game_hash
  game[:home][:players].each do |hometeam|
    if name == hometeam.keys[0]
      return hometeam[hometeam.keys[0]][:shoe]
    end
  end
  game[:away][:players].each do |awayteam|
    if name == awayteam.keys[0]
      return awayteam[awayteam.keys[0]][:shoe]
    end
  end
end


def team_colors(what_name)
  game = game_hash
  #binding.pry
  if what_name == game[:home][:team_name]
    return game[:home][:colors]
  else
    return game[:away][:colors]
  end
end


def team_names()
  game = game_hash
  teams_array = []
  teams_array[0] = game[:home][:team_name]
  teams_array[1] = game[:away][:team_name]
  return teams_array
end


def player_numbers(the_name)
  game = game_hash
  shirt_array = []
  game.keys.each do |team_id|
    if game[team_id][:team_name] == the_name
      game[team_id][:players].each do |hometeam|
        shirt_array << hometeam[hometeam.keys[0]][:number]
      end
    end
  end
  return shirt_array.sort
end

def player_stats(the_name)
  game = game_hash
  my_hash = {}
  game.keys.each do |team_id|
      game[team_id][:players].each do |hometeam|
        if hometeam.keys[0] == the_name
          return hometeam[the_name]
      end
    end
  end
end


def big_shoe_rebounds()
  big_foot = 0
  my_rebounds = 0
  game = game_hash
  game.keys.each do |team_id|
    game[team_id][:players].each do |player|
      if player[player.keys[0]][:shoe] > big_foot
        big_foot = player[player.keys[0]][:shoe]
        my_rebounds = player[player.keys[0]][:rebounds]
      end
    end
    end
    return my_rebounds
end


def most_points_scored()
  top_points = 0
  top_name = ""
  game = game_hash
  game.keys.each do |team_id|
    #binding.pry
    game[team_id][:players].each do |player|
      #binding.pry
      if player[player.keys[0]][:points] > top_points
        top_points = player[player.keys[0]][:points]
        top_name = player.keys[0]
      end
    end
  end
  return top_name
end


def winning_team()
  game = game_hash
  for_the_win = {}
  sum = 0
  game.keys.each do |team_id|
    game[team_id][:players].each do |player|
      sum += player[player.keys[0]][:points]
        for_the_win[team_id] = sum

      end
      sum = 0
  end
  #binding.pry
  if for_the_win[:home] > for_the_win[:away]
    return game[:home][:team_name]
  else
    return game[:away][:team_name]
  end
end

def player_with_longest_name()
  game = game_hash
  name_count = 0
  long_name = ""

  game.keys.each do |team_id|
    game[team_id][:players].each do |player|
      if player.keys[0].length > name_count
        name_count = player.keys[0].length
        long_name = player.keys[0]
      end
    end
  end
  return long_name
end

def long_name_steals_a_ton?()
  game = game_hash
  name_count = 0
  max_steals = 0
  long_name = ""
  most_steals = nil
  long_name_steals = 0
  game.keys.each do |team_id|
  game[team_id][:players].each do |player|
    if player.keys[0].length > name_count
      name_count = player.keys[0].length
      long_name = player.keys[0]

      long_name_steals = player[player.keys[0]][:steals]
    end
    if player[player.keys[0]][:steals] > max_steals
      max_steals = player[player.keys[0]][:steals]
    end
  end
end

most_steals = (max_steals == long_name_steals)
return most_steals
end
