class Player < ActiveRecord::Base
  has_secure_password

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

end
