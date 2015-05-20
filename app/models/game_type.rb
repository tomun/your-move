require_relative "../games/tic_tac_toe"

class GameType < ActiveRecord::Base
  @@game_types = []

  def self.game_types
    if @@game_types.count == 0
      self.register_games
    else
      GameType.all.each do |game_type| 
        @@game_types << game_type
      end
      @@game_types
    end
  end

  def self.register_games
    games = [ TicTacToe ]
    game_types = []

    games.each do |game|
      game_type = GameType.find_by game_type_name:game.name

      if game_type == nil
        game_type = GameType.new game_type_name: game.name
        game_type.save
      end

      game_types << game_type
    end
    
    @@game_types = game_types

    @@game_types
  end

  def create
    klass = game_type_name.constantize
    klass.new 
  end

  def self.options_all
    @gms = Array.new

    src = Array.new
    src << ""
    src << ""
    @gms << src

    GameType.all.each do |gm|
      src = Array.new
      src << gm.game_type_name
      src << gm.id
      @gms << src
    end

    @sorted = @gms.sort_by do |i|
      i.first
    end

    @sorted
  end

end