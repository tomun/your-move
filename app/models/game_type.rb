require_relative "../games/tic_tac_toe"

class GameType < ActiveRecord::Base
    
  def self.game_types
    @game_types = Array.new
    GameType.all.each do |gt|
      @game_types << gt
    end
    @game_types
  end

  def create
    klass = class_name.constantize
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
