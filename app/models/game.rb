require "json"

class Game < ActiveRecord::Base
  belongs_to :game_type

  def name
    game_obj.friendly_name
  end

  def game_obj
    if !@game_obj
      if game_data
        @game_obj = game_type.klass.json_create(JSON.parse(game_data))
      else
        @game_obj = game_type.create
      end
    end
    @game_obj
  end

  def board_html
    game_obj.board_html "#{id}"
  end

  def move params
    game_obj.move params
  end
  
  # a little hack to allow game creation in the game index page
  def default_game_type
    GameType.game_types.first
  end

end
