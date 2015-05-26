class DashboardsController < ApplicationController
  include SessionsHelper

  def index
    @invites_from_you = current_player.invites_from_player
    @invites_to_you = current_player.invites_to_player
  end

  def home
  end

end
