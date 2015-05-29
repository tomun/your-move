FactoryGirl.define do
  factory :game do
    transient do
      game_class_name "TicTacToe"
      player_1_handle "Alvin"
      player_2_handle "Betty"
    end

    game_type do
      GameType.find_by(class_name: game_class_name) || FactoryGirl.create(:game_type, class_name: game_class_name)
    end

    player_1 do
      Player.find_by(handle: player_1_handle) || FactoryGirl.create(:player, handle: player_1_handle)
    end
    player_2 do
      Player.find_by(handle: player_2_handle) || FactoryGirl.create(:player, handle: player_2_handle)
    end
  end
end
