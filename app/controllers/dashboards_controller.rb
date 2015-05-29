class DashboardsController < ApplicationController
  include SessionsHelper

  def index
    @invites_from_you = current_player.invites_from_player
    @invites_to_you = current_player.invites_to_player
    @your_games = current_player.current_games
  end

  def home
  end

end
