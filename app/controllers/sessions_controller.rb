class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    player = Player.where(handle: params[:handle]).first

    if player && params[:password].present? && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to root_path, notice: "You have been logged in."
    else
      flash[:error] = "Your username or password are incorrect. Please try again."
      redirect_to root_path
    end
  end    

  def failure
    flash[:alert] = "Authentication Failed"
    redirect_to root_url
  end

  def destroy
puts "Destroyed!"
    session[:player_id] = nil
    redirect_to root_url, notice: "You have been logged out."
 end
  
end
