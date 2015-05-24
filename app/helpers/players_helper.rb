module PlayersHelper

  def get_player(id)
    Player.find(id)
  end  

end
