class ApplicationController < ActionController::Base
  include SessionsHelper
  
#  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  layout :resolve_layout

private

    def resolve_layout
      if signed_in?
        "player"
      else
        "public"
      end
    end

end
