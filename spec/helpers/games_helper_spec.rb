require 'spec_helper'

RSpec.describe GamesHelper, type: :helper do

  let(:game) { create(:game) }

  describe "#opponent_handle" do
    it "returns the handle of a players opponent for a given game" do
      handle = opponent_handle(game.player_1.id, game.id)
      expect(handle).to eq(game.player_2.handle)
    end
  end

  describe "#whose_turn" do
    it "returns the id of the player whose turn it is for a given game" do
      player_id = whose_turn(game.id)
      expect(player_id).to eq(game.player_1.id)
    end
  end

  describe "#your_turn?" do
    it "returns true if the given player id's turn is up for a given game id" do
      expect(your_turn?(game.id, game.player_1.id)).to be_truthy
    end
  end
  
end
