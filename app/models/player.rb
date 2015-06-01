class Player < ActiveRecord::Base
  has_secure_password
  before_create :generate_api_key

  has_many :invitations
  has_many :games

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

  def invites_from_player
    invites = Invitation.where("player_id = ? AND challenge_expires > current_timestamp AND challenge_responded IS NULL AND was_withdrawn IS NULL", id)
    invites
  end

  def invites_to_player
    invites = Invitation.where("recipient_player = ? AND challenge_expires > current_timestamp AND challenge_responded IS NULL AND was_withdrawn IS NULL", id)
    invites
  end

  def current_games
    games = Game.where("(player_1_id = ? OR player_2_id = ?) AND game_ended IS NULL", id, id)
  end

end
