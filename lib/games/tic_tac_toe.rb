require_relative "game_base"
require "json"
require "matrix"

class Array
  def same_values?
    self.uniq.length == 1 && self.uniq != [nil]
  end
end

class TicTacToe < GameBase
  def game_type_name
    "Tic-Tac-Toe"
  end

  def initialize(board = nil, moving_player = 1)
    if board
      @board = board
    else
      @board = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
    end
    if moving_player
      @moving_player = moving_player
    else
      @moving_player = 1
    end
  end

  def to_json(*a)
    {
      "json_class" => self.class.name,
      "data"       => {"board" => @board, "moving_player" => @moving_player}
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o["data"]["board"], o["data"]["moving_player"])
  end

  def board_html game_id, player_no
    html = "<table style='board'>"
    @board.each_with_index do |row, rowix|
      html << "<tr>"
      row.each_with_index do |col, colix|
        hv = (rowix == 1 ? " h" : "") + (colix == 1 ? " v" : "")

        html << "<td class='square#{hv}'>"

        if col == nil
          if player_no == moving_player
            html << "<a href='/games/#{game_id}/move?row=#{rowix}&col=#{colix}'></a>"
          else
            html << "&nbsp;"
          end
        else
          html << (col == 1 ? "X" : "O")
        end

        html << "</td>"
      end
      html << "</tr>"
    end
    html << "</table>"
  end

  def move params
    rowix = params[:row].to_i
    colix = params[:col].to_i

    if @board[rowix][colix] == nil
      @board[rowix][colix] = @moving_player

      if game_over?
        @moving_player = 0
      else
        if @moving_player == 1
          @moving_player = 2
        else
          @moving_player = 1
        end
      end
    end
  end

  def moving_player
    @moving_player
  end

  def game_over?
    winning_player > 0 || !(@board.flatten.include?(nil))
  end

  def winning_player
    if win? 1
      1
    elsif win? 2
      2
    else
      0
    end
  end

private

  def win?(player)
    n = @board.size
    m = Matrix[*@board]
    pvec = Matrix.build(1,n){player}.row(0)
    m.row_vectors.any?      { |r| puts "r = #{r}"; r == pvec } ||
      m.column_vectors.any? { |c| puts "c = #{c}"; c == pvec } ||
      (Vector.[](*(m.each(:diagonal).to_a) == pvec )
  end

end
