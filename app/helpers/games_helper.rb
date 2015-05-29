include PlayersHelper

module GamesHelper

  def opponent_handle(player_id, game_id)
    g = Game.find(game_id)
    return "(Error)" unless g

    result = "(Error)"

    if g.player_1_id == player_id
      result = get_player(g.player_2_id).handle
    elsif g.player_2_id == player_id
      result = get_player(g.player_1_id).handle
    end

    result
  end

  def whose_turn(game_id)
    g = Game.find(game_id)
    if g.whose_turn > 0
      g.public_send("player_#{g.whose_turn}_id")
    else
      -1
    end
  end

  def your_turn?(game_id, player_id)
    (whose_turn(game_id) == player_id)
  end

end
