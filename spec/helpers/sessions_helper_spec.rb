require 'spec_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:player) { create(:player) }
  let(:other_player) { create(:player) }

  describe "#current_player" do
    it "stores a player if signed_in?" do
      session[:player_id] = player.id
      expect(current_player).to eq player
    end

    it "returns nil if not signed_in?" do
      expect(current_player).to be_nil
    end
  end

  describe "signed_in?" do
    it "returns true if signed in" do
      session[:player_id] = player.id
      expect(signed_in?).to be_truthy
    end

    it "returns false if not signed in" do
      expect(signed_in?).to be_falsey
    end
  end

# Same test found in game_type_spec?
  describe "game_types" do
    it "returns the list of available games" do
      game_names = []
      game_types.each { |game_type| game_names << game_type.class_name }

      expect(game_names).to include "TicTacToe"
    end
  end

end
