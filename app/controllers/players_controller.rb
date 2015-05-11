class PlayersController < ApplicationController
  include PlayersHelper

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:player_id] = @player.id
      #UserMailer.welcome_email(@player).deliver_later(wait: 1.minute)
      redirect_to root_url, notice: "You have signed up"
    else
      render "new"
    end
  end

  private

    def player_params
      params.require(:player).permit(:handle, :email, :password, :password_confirmation)
    end

end
