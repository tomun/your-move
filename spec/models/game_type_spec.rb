require 'spec_helper'

describe GameType, type: :model do

  it "can register the games" do
    game_types = GameType.register_games

    game_names = []
    game_types.each { |game_type| game_names << game_type.game_type_name }

    expect(game_names).to include "Tic-Tac-Toe"
  end

  it "can return all registered games" do
    game_types = GameType.game_types
    game_names = Array.new
    game_types.each { |gt| game_names << gt.game_type_name }
    expect(game_names).to include "Tic-Tac-Toe"
  end

  it "can create a Game object" do
    game_types = GameType.game_types

    game = game_types[0].create

    expect(game.game_type_name).to eq "Tic-Tac-Toe"
  end

end
