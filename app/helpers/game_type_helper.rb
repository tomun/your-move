module GameTypeHelper
  include ApplicationHelper

  def get_game_type(id)
    GameType.find(id)
  end  

end
