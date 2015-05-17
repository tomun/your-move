class Player < ActiveRecord::Base
  has_secure_password
  before_create :generate_api_key

  has_many :invitations

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

  def invites_from_player
    invitations
  end

  def invites_to_player
    invites = Invitation.where("recipient_player = ?", id)
    invites
  end
end
