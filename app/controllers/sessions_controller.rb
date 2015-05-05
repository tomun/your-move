class SessionsController < ApplicationController
  include SessionsHelper

  def new

  puts params.inspect

    if params[:commit] == "Log in"
      puts "Log in"
    elsif params[:commit] == "Register"
      puts "Register"
    else
      puts "Uh, oh!"
    end

    redirect_to root_path
  end

  def create
  end

  def failure
  end

  def destroy
  end

private
  
  def user_params
  end
  
end
