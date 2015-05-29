require 'spec_helper'

describe Game, type: :model do

  let(:game) { create(:game) }

  describe "#name" do
    it "returns the name of game" do
      expect(game.name).to eq("Tic-Tac-Toe")
    end
  end

  describe "#game_obj" do
    it "returns an instance of the game object" do
      expect(game.game_obj).to be_an_instance_of(TicTacToe)
    end
  end

  describe "#board_html" do
    it "return html representing a game board for a given player" do
      html = game.board_html(game.player_1)
      expect(html).to include("<table")
    end
  end

  describe "#move" do
    it "makes a move on the game board and returns the new player number" do
      parameters = { row: 0, col: 0 }
      expect(game.move(parameters)).to eq(2)
    end
  end

  describe "#moving_player" do
    it "returns the current player whose turn it is" do
      expect(game.moving_player).to eq(game.player_1)
    end
  end

  describe "#winning_player" do
    context "when no one is a winner" do
      it "retursn nil" do
        expect(game.winning_player).to eq(nil)
      end
    end

    context "when player 1 is the winner" do
      it "returns player 1" do
        # player 1 move
        game.move ({ row: 0, col: 0 })
        # player 2 move
        game.move ({ row: 1, col: 0 })
        # player 1 move
        game.move ({ row: 0, col: 1 })
        # player 2 move
        game.move ({ row: 1, col: 1 })
        # player 1 move, win!
        game.move ({ row: 0, col: 2 })

        expect(game.winning_player).to eq(game.player_1)
      end
    end
  end

  describe "#whose_turn" do
    it "returns the current player number whose turn it is" do
      expect(game.whose_turn).to eq(1)
    end
  end

  describe "#game_started" do
    it "returns the date when the game started" do
      expect(game.game_started.to_datetime).to be_within(2.second).of(DateTime.now)
    end
  end

end
