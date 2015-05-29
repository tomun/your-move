module GameTypeHelper
  include ApplicationHelper

  def get_game_type(id)
    GameType.find(id)
  end 

  def get_game_name(id)
    gt = GameType.find(id)
    if gt.nil?
      "(Undefined)"
    else
      gt.game_type_name
    end
  end 

end
