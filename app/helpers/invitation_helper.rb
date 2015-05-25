module InvitationHelper
  include ApplicationHelper
  
  def valid_opponent?(name)
    !Player.where("lower(handle) = ?", name.downcase).blank?
  end

  def prepare_invite(name, game)
    if name.blank?
      loop do
        offset = rand(Player.count)
        @opponent = Player.offset(offset).first
        break @opponent unless @opponent.id == session[:player_id]
      end
      @random_match = true
    else
      @opponent = Player.where("lower(handle) = ?", name.downcase).first
      @random_match = false
    end

    if @opponent.id.nil?
      puts "Whoa!"
    else
      @invite = Invitation.new
      @invite.link_hash = create_hash
      @invite.player_id = session[:player_id]
      @invite.recipient_player = @opponent.id
      @invite.game_type_id = game
      @invite.was_random_match = @random_match
      @invite.challenge_issued = Time.now
      @invite.challenge_expires = @invite.challenge_issued + CHALLENGE_WINDOW.days
    end

    @invite
  end

  def create_hash
    loop do
      new_hash = rand(36**10).to_s(36)
      break new_hash unless Invitation.exists?(link_hash: new_hash)
    end
  end

end
