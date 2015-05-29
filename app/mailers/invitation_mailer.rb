class InvitationMailer < ApplicationMailer
  include PlayersHelper
  include GameTypeHelper
  default from: "invitations@your-move.net"

  def accept_invitation(invitation, is_first)
    setup(invitation)
    @is_first = is_first
    mail(to: @inviter.email, subject: "Your challenge has been accepted!")
  end

  def reject_invitation(invitation)
    setup(invitation)
    mail(to: @inviter.email, subject: "Your challenge has been rejected!")
  end

  def send_invitation(invitation)
    setup(invitation)
    mail(to: @invitee.email, subject: "Would you like to play a game?")
  end

  def withdraw_invitation(invitation)
    setup(invitation)
    mail(to: @invitee.email, subject: "A challenge has been withdrawn")
  end

private

    def setup(invitation)
      @invitation = invitation
      @inviter = get_player(@invitation.player_id)
      @invitee = get_player(@invitation.recipient_player)
      @game_type = get_game_type(@invitation.game_type_id)
    end

end
