module Public::BalloonsHelper

  def balloon_user(balloon)
    User.find_by(id: balloon.user_id)
  end

end
