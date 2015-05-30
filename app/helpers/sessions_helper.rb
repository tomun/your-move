module SessionsHelper

  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  def signed_in?
    !current_player.nil?
  end

  def game_types
    @game_types ||= GameType.game_types
  end

end
