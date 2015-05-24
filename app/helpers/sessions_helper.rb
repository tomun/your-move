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

  def other_players
    Player.where("id <> ?", current_player.id)
  end

  # def authentication_required
  #   unless signed_in?
  #     store_location
  #     redirect_to login_url, notice: "Please sign in"
  #   end
  # end

  # def store_location
  #   session[:return_to] = request.url if request.get?
  # end

end
