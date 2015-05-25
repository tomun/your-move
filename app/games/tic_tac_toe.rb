require_relative "game_base"
require "json"

class TicTacToe < GameBase
  def game_type_name
    "Tic-Tac-Toe"
  end

  def initialize(board = nil, current_player = 1)
    if board
      @board = board
    else
      @board = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
    end
    if current_player
      @current_player = current_player
    else
      @current_player = 1
    end
  end

  def to_json(*a)
    {
      "json_class" => self.class.name,
      "data"       => {"board" => @board, "current_player" => @current_player}
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o["data"]["board"], o["data"]["current_player"])
  end

  def board_html game_id
    html = "<table style='board'>"
    @board.each_with_index do |row, rowix|
      html << "<tr>"
      row.each_with_index do |col, colix|
        hv = (rowix == 1 ? "h " : " ") + (colix == 1 ? "v" : "")

        html << "<td class='square #{hv}'>"

        if col == nil
          move_uri = "/games/" + game_id + '/move?row=' + rowix.to_s + '&col=' + colix.to_s
          html << "<a href=\"#{move_uri}\"></a>"
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

    @board[rowix][colix] = @current_player

    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end

  def current_player
    @current_player
  end

  def game_over?
    !(@board.flatten.include?(nil))
  end

  def winner
    #TODO
  end

end