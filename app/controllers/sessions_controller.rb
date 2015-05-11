class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to root_path
  end

  def create
    player = Player.where(handle: params[:handle]).first

    if player && params[:password].present? && player.authenticate(params[:password])
      session[:player_id] = player.id
      #redirect_to dashboard_path, notice: "You have been logged in."
    else
      flash[:error] = "Your username or password are incorrect. Please try again."
      redirect_to login_url
    end
  end    

  def failure
    flash[:alert] = "Authentication Failed"
    redirect_back_or root_url
  end

  def destroy
     session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out."
 end
  
end
