require_relative "../games/tic_tac_toe"

class GameType < ActiveRecord::Base
  has_many :games

  @@game_types = []

  def self.game_types
    if @@game_types.count == 0
      self.register_games
    else
      @@game_types
    end
  end

  def self.register_games
    games_classes = [ TicTacToe ]
    game_types = []

    games_classes.each do |game_class|
      game_type = GameType.find_by class_name:game_class.name

      if game_type == nil
        game_type = GameType.new class_name: game_class.name, game_type_name: game_class.new.game_type_name
        game_type.save
      end

      game_types << game_type
    end

    @@game_types = game_types

    @@game_types
  end
    
  # def self.game_types
  #   @game_types = Array.new
  #   GameType.all.each do |gt|
  #     @game_types << gt
  #   end
  #   @game_types
  # end

  def klass
    class_name.constantize
  end

  def create
    klass.new 
  end

  # used by invitations/new.html.erb for select_tag's options_for_select parameter
  def self.options_all
    @gms = Array.new

    src = Array.new
    src << ""
    src << ""
    @gms << src

    game_types.each do |gm|
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
