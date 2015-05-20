class InvitationMailer < ApplicationMailer
  default from: "invitations@your-move.net"

  def send_invitation(invitee)
    @player = invitee
    mail(to: invitee.email, subject: "Would you like to play a game?")
  end

end
