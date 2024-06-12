class BalloonComment < ApplicationRecord

  belongs_to :user
  belongs_to :balloon

  has_one :notification, as: :notifiable, dependent: :destroy
  after_create :create_notifications

  validates :comment, presence: true

  private
  
  def create_notifications
    Notification.create(notifiable: self, user: balloon.user, action_type: :commented_to_own_balloon)
  end

end
