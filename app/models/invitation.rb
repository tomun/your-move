class Invitation < ActiveRecord::Base
  belongs_to :player

  def game_name
    GameType.find(game_type_id).game_type_name
  end

  def issuer_handle
    Player.find(player_id).handle
  end

  def recipient_handle
    Player.find(recipient_player).handle
  end
end
