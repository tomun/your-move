class InvitationMailer < ApplicationMailer
  include PlayersHelper
  include GameTypeHelper
  default from: "invitations@your-move.net"


  def send_invitation(invitation)
    @invitation = invitation
    @inviter = get_player(@invitation.player_id)
    @invitee = get_player(@invitation.recipient_player)
    @game = get_game_type(@invitation.game_type_id)
    mail(to: @invitee.email, subject: "Would you like to play a game?")
  end

end
