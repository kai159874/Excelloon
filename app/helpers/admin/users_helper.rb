module Admin::UsersHelper

  def find_user(balloon)
    User.find_by(id: balloon.user_id)
  end

end
