require 'spec_helper'
require 'games/tic_tac_toe'

describe TicTacToe do
  before do
    @game = TicTacToe.new
    @json = "{\"json_class\":\"TicTacToe\",\"data\":{\"board\":[[null,null,null],[null,null,null],[null,null,null]],\"moving_player\":1}}"
  end

  def make_moves_to_player_1_win
      # X X X
      # O O .
      # . . . 

      @game.move ({ row: 0, col: 0 }) # X
      @game.move ({ row: 1, col: 0 }) # O
      @game.move ({ row: 0, col: 1 }) # X
      @game.move ({ row: 1, col: 1 }) # O
      @game.move ({ row: 0, col: 2 }) # X
  end

  def make_moves_to_a_draw
      # X O O
      # O X X
      # X X O

      @game.move ({ row: 0, col: 0 }) # X
      @game.move ({ row: 0, col: 1 }) # O
      @game.move ({ row: 1, col: 1 }) # X
      @game.move ({ row: 0, col: 2 }) # O
      @game.move ({ row: 1, col: 2 }) # X
      @game.move ({ row: 1, col: 0 }) # O
      @game.move ({ row: 2, col: 0 }) # X
      @game.move ({ row: 2, col: 2 }) # O
      @game.move ({ row: 2, col: 1 }) # X
  end

  def make_a_game_state_from_a_board board
    TicTacToe.new board, 1
  end

  context "#game_type_name" do
    it "returns the human readable game name" do
      expect(@game.game_type_name).to eq("Tic-Tac-Toe")
    end
  end

  context "#to_json" do
    it "serializes the game state to json" do
      expect(@game.to_json).to include(@json)
    end
  end

  context "#json_create" do
    it "deserializes the game state from json" do
      game = TicTacToe.json_create(JSON.parse(@json))
      expect(game).to_not be_nil
      expect(game.moving_player).to eq(1)
    end
  end

  context "#board_html" do
    it "outputs html with player move links in it" do
      html = @game.board_html 1234, 1
      expect(html).to include("<a href='/games/1234/move?row=0&col=0'")
    end
  end

  context "#move" do
    it "changes the board to reflect the move" do
      @game.move ({row: 0, col: 0})
      html = @game.board_html 1234, 1
      expect(html).to include("<td class='square'>X</td>")
    end
  end
  
  context "#moving_player" do
    it "should be 1 initially" do
      expect(@game.moving_player).to eq(1)
    end

    it "should be 2 after the first move" do
      @game.move ({row: 0, col: 0})
      expect(@game.moving_player).to eq(2)
    end

    it "should be 0 when the game is over" do
      make_moves_to_player_1_win
      expect(@game.moving_player).to eq(0)
    end
  end

  context "#game_over?" do
    it "should be false if the game is in progress" do
      expect(@game.game_over?).to be_falsey
    end

    it "should be true if a player won" do
      make_moves_to_player_1_win
      expect(@game.game_over?).to be_truthy
    end

    it "should be true if the game is a draw" do
      make_moves_to_a_draw
      expect(@game.game_over?).to be_truthy
    end
  end

  context "#winning_player" do
    it "should return 0 if the game is in progress" do
      expect(@game.winning_player).to eq(0)
    end

    it "should return 0 if the game is over but a draw" do
      make_moves_to_a_draw
      expect(@game.winning_player).to eq(0)
    end

    it "should return 1 if player 1 wins horizontally" do
      game = make_a_game_state_from_a_board([
        [1, 1, 1],
        [nil, nil, nil],
        [nil, nil, nil]
        ])
      expect(game.winning_player).to eq(1)
    end

    it "should return 1 if player 1 wins vertically" do
      game = make_a_game_state_from_a_board([
        [1, nil, nil],
        [1, nil, nil],
        [1, nil, nil]
        ])
      expect(game.winning_player).to eq(1)
    end

    it "should return 1 if player 1 wins left-top to bottom" do
      game = make_a_game_state_from_a_board([
        [1, nil, nil],
        [nil, 1, nil],
        [nil, nil, 1]
        ])
      expect(game.winning_player).to eq(1)
    end

    it "should return 1 if player 1 wins right-top to bottom" do
      game = make_a_game_state_from_a_board([
        [nil, nil, 1],
        [nil, 1, nil],
        [1, nil, nil]
        ])
      expect(game.winning_player).to eq(1)
    end

  end

end