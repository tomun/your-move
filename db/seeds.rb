player_list = [
  ['alvin', 'alvin@hotmail.com', 'zipper'],
  ['betty', 'betty@hotmail.com', 'yuppers'],
  ['charles', 'charles@hotmail.com', 'xylophone'],
  ['denise', 'denise@hotmail.com', 'window'],
  ['eddy', 'eddy@hotmail.com', 'viper']
]

player_list.each do |handle, email, password|
  Player.create(handle: handle, email: email, password: password)
end

game_types_list = [
  ['Tic-Tac-Toe', 'TicTacToe']
]

game_types_list.each do |name, cname|
  GameType.create(game_type_name: name, class_name: cname)
end

game_list = [
  ["Tic-Tac-Toe", "alvin", "betty", DateTime.now]
]

game_list.each do |game_type_name, player_1_handle, player_2_handle, game_started| 
  game_type_id = GameType.find_by(game_type_name: game_type_name).id
  player_1_id = Player.find_by(handle: player_1_handle).id
  player_2_id = Player.find_by(handle: player_2_handle).id
  Game.create(game_type_id: game_type_id, player_1_id: player_1_id, player_2_id: player_2_id, game_started: game_started)
end