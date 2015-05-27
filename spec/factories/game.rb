FactoryGirl.define do
  factory :game do
    transient do
      game_class_name "TicTacToe"
    end

    game_type do
      GameType.find_by(class_name: game_class_name) || FactoryGirl.create(:game_type, class_name: game_class_name)
    end

    player_1_id do
      FactoryGirl.create(:player)
    end
    player_2_id do
      FactoryGirl.create(:player)
    end
  end
end
