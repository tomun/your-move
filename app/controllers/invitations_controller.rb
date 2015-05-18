class InvitationsController < ApplicationController
  include InvitationHelper

  def new
    @invitation = Invitation.new
    puts "New invitation"
  end

  def create
    if valid_opponent?(params[:invitation][:recipient_player])

    else
flash[:error] = "Unknown player handle"
      redirect_to new_invitation_path
    end
  end

private
  
  def invitations_params
    params.require(:invitations).permit(:game_type_id, :invitation_recipient_player)
  end

end
