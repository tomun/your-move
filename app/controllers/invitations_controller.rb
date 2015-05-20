class InvitationssController < ApplicationController

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # POST /invitations
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

  # DELETE /invitations/1
  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:handle, :email, :password, :password_confirmation)
    end

end
