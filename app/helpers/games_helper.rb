module GamesHelper

  def opponent_handle(player_id, game_id)
    g = Game.find(game_id)
    return nil unless g

    result = nil

    if g.player_1_id == player_id
      result = g.player_2_id
    elsif g.player_2_id == player_id
      result = g.player_1_id
    end

    result
  end

end
