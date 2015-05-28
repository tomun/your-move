module DashboardsHelper

  def turn_class(game_id, player_id)
    if your_turn?(game_id, player_id)
      @class = "your_turn"
    else
      @class = "not_your_turn"
    end

    @class
  end

end
