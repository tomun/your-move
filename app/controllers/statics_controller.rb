class StaticsController < ApplicationController

  def home #matches app/views/static/home.html.erb
    if signed_in?
      redirect_to dashboard_url
    end
  end

end
