module InvitationHelper
  
  def valid_opponent?(name)
    !Player.where("lower(handle) = ?", handle.downcase).blank?
  end

end
