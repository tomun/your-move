require 'spec_helper'


RSpec.describe GamesHelper, type: :helper do

  let(:game) { create(:game) }

  describe "#opponent_handle" do
    it "returns the handle of a players opponent for a given game" do
      handle = opponent_handle(game.player_1.id, game.id)
      expect(handle).to eq(game.player_2.handle)
    end
  end
end
