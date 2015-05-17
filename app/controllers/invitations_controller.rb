class InvitationsController < ApplicationController

  def new

  end

  def create
  end

  def index
    @invitation = Invitation.new
  end

end
