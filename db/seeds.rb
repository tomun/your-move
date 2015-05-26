#Add some initial players

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

#Add some initial games

game_types_list = [
  ['Tic-Tac-Toe', 'TicTacToe']
]

game_types_list.each do |name, cname|
  GameType.create(game_type_name: name, class_name: cname)
end

#Add some pending invitations

invitations_list = [
  [1, 2, 1, false, '2015-05-25 22:26:21.508860','gnt0j8mmft'],
  [2, 3, 1, true, '2015-05-24 22:26:21.508860', 'qbwzysn2tl'],
  [3, 4, 1, false, '2015-05-23 22:26:21.508860', '46t7mrgmm4'],
  [4, 5, 1, false, '2015-05-22 22:26:21.508860', '3adowe4827'],
  [1, 3, 1, false, '2015-05-21 22:26:21.508860', 'gnt0qwemft'],
  [1, 4, 1, true, '2015-04-23 22:26:21.508860', '234dks38dk'],
  [3, 4, 1, true, '2015-05-01 22:26:21.508860', '5nt0j8mmfg'],
  [2, 5, 1, false, '2015-05-11 22:26:21.508860', '6nt0j8mmf4'],
  [5, 1, 1, false, '2015-05-15 22:26:21.508860', '7nt0j8mmfk']
]

invitations_list.each do |player, recipient, game, random, issued, hash| 
  Invitation.create(player_id: player, recipient_player: recipient, game_type_id: game, was_random_match: random, challenge_issued: issued, challenge_expires: DateTime.parse(issued) + 30.days, link_hash: hash)
end

#Deprecated, I think

#game_list = [
#  ["Tic-Tac-Toe", "alvin", "betty", DateTime.now]
#]
#
#game_list.each do |game_type_name, player_1_handle, player_2_handle, game_started| 
#  game_type_id = GameType.find_by(game_type_name: game_type_name).id
#  player_1_id = Player.find_by(handle: player_1_handle).id
#  player_2_id = Player.find_by(handle: player_2_handle).id
#  Game.create(game_type_id: game_type_id, player_1_id: player_1_id, player_2_id: #player_2_id, game_started: game_started)
#end
