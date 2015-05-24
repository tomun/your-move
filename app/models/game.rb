class Game < ActiveRecord::Base
  belongs_to :game_type

  def name
    game_type.create.friendly_name
  end

  def board_html

  end
  
end
