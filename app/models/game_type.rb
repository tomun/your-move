class GameType < ActiveRecord::Base

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
