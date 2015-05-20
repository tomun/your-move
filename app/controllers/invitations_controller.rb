class InvitationsController < ApplicationController
  include InvitationHelper

  def new
    @invitation = Invitation.new
    puts "New invitation"
  end

  def create
    @invite = prepare_invite(params[:invitation][:recipient_player], params[:game_type_id])

    if @invite.nil? 
      flash[:error] = "Unknown player handle"
      redirect_to new_invitation_path
    else
      if @invite.save
        puts "Success!"
      else
        puts "Failure!"
      end

    end

  end

private
  
  def invitation_params
    params.require(:invitation).permit(:game_type_id, :recipient_player)
  end

end
