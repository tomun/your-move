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
