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
