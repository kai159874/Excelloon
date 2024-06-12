class Notification < ApplicationRecord

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  enum action_type: { commented_to_own_balloon: 0, followed_me: 1}

end
