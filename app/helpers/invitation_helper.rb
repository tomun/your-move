module InvitationHelper
  include ApplicationHelper
  
  def valid_opponent?(name)
    !Player.where("lower(handle) = ?", name.downcase).blank?
  end

  def prepare_invite(name, game)
    if name.blank?
      #TODO match a player based on the game, with a preference
      # for a player not already in that game

      @random_match = true
    else
      @opponent = Player.where("lower(handle) = ?", name.downcase).first
      @random_match = false
    end

    if @opponent.id.nil?
      puts "Whoa!"
    else
      @invite = Invitation.new
      @invite.initiating_player = session[:player_id]
      @invite.recipient_player = @opponent.id
      @invite.game_type_id = game
      @invite.was_random_match = @random_match
      @invite.challenge_issued = Time.now
      @invite.challenge_expires = @invite.challenge_issued + CHALLENGE_WINDOW.days
    end

    @invite
  end

end
