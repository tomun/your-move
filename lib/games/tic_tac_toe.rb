require_relative "game_base"
require "json"
require "matrix"

class Matrix
  def row_vectors_any? vector
    row_vectors.any? { |r| r == vector }
  end

  def column_vectors_any? vector
    column_vectors.any? { |c| c == vector }
  end

  def diagonal_vectors_any? vector
    Vector.[](*each(:diagonal).to_a) == vector
  end

  def minor_diagonal_vectors_any? vector
    (0...row_size).all? { |i| to_a[i][row_size - i - 1] == vector[i] }
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

  def win?(p)
    matrix = Matrix[*@board]
    vector = Matrix.build(1, @board.size) { p }.row(0)
    matrix.row_vectors_any?(vector) || matrix.column_vectors_any?(vector) || matrix.diagonal_vectors_any?(vector) || matrix.minor_diagonal_vectors_any?(vector)
  end

end
