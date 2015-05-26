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
        InvitationMailer.send_invitation(@invite).deliver_now
        redirect_to root_url, notice: "Your invitation has been sent!"
      else
        render "new"
      end
    end
  end

  def respond
    @invite = get_invitation_by_hash(params[:link_hash])
    if @invite.recipient_player == session[:player_id]
      @invite.challenge_responded = Time.now
      if params[:answer]=="n" 
        @invite.was_accepted = false
        if @invite.save
          redirect_to dashboard_path, notice: "You have declined the invitation."
        end
      elsif params[:answer]=="y"
        @invite.was_accepted = true
        if @invite.save
          players = set_player_order(@invite.player_id, @invite.recipient_player)
          @game = Game.new
          @game.invitation_id = @invite.id
          @game.game_type_id = @invite.game_type_id
          @game.player_1 = players[0]
          @game.player_2 = players[1]
          @game.game_started = Time.now
#          @game.game_data = whatever
          if @game.save
            redirect_to dashboard_path, notice: "You have accept the invitation."
          end
        end
      end
    end
  end

private
  
  def invitation_params
    params.require(:invitation).permit(:game_type_id, :recipient_player)
  end

end
