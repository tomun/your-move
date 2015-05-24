require_relative "game_base"
require "json"

class TicTacToe < GameBase
  def friendly_name
    "Tic Tac Toe"
  end

  @board = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  def initialize(board = nil)
    if board
      @board = board
    end
  end

  def to_json(*a)
    {
      "json_class" => self.class.name,
      "data"       => {"board" => @board}
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o["data"]["board"])
  end
end