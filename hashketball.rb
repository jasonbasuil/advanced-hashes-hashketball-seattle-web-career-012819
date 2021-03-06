
def game_hash
	game_hash = {
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

def num_points_scored(player_name)
	points_scored = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players 
				value.each do |team_mate, stat|
					if team_mate == player_name
						stat.each do |key, result|
							if key == :points && points_scored == nil 
								points_scored = result
							end
						end
					end
				end
			end
		end
	end			
	points_scored 
end

def shoe_size(player_name)
	shoe_return = nil 
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players 
				value.each do |team_mate, stat|
					if team_mate == player_name
						stat.each do |key, result|
							if key == :shoe && shoe_return == nil
								shoe_return = result
							end
						end
					end
				end
			end
		end
	end
	shoe_return
end

def team_colors(team_to_find)
	team_color_return = nil 
	team_found = false
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if value == team_to_find && team_found == false 
				team_found = true 
			else
				if team_found && attribute == :colors && team_color_return == nil
					team_color_return = value
				end
			end
		end
	end
	team_color_return
end

def team_names
	team_names_return = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :team_name
				team_names_return << value 
			end
		end
	end
	team_names_return
end

def player_numbers(team_to_find)
	team_found = false 
	player_jerseys_return = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :team_name && value == team_to_find
				team_found = true
			else
				if team_found && attribute == :players 
					value.each do |key, result|
						result.each do |stat, stat_value|
							if stat == :number
								player_jerseys_return << stat_value
							end
						end
					end
				end
			end
		end
		team_found = false 
	end
	player_jerseys_return
end

def player_stats(player_name)	
	player_stats_return = nil 
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players 
				value.each do |team_mate, stat|
					if team_mate == player_name && player_stats_return == nil
						player_stats_return = stat 
					end
				end
			end
		end
	end
	player_stats_return
end

def big_shoe_rebounds
	rebounds_to_return = nil
	biggest_shoe_size = []
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					update_record = false
					stat_hash.each do |stat, stat_val|
						if stat == :shoe
							if biggest_shoe_size.length < 1 || biggest_shoe_size[1][:shoe] < stat_val
								update_record = true
							end
						end
					end
					if update_record
						biggest_shoe_size = []
						biggest_shoe_size << team_mate
						biggest_shoe_size << stat_hash
						rebounds_to_return = biggest_shoe_size[1][:rebounds]
					end
				end
			end
		end
	end
	rebounds_to_return
end





