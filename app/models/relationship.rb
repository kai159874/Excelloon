class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  has_one :notification, as: :notifiable, dependent: :destroy
  after_create :create_notifications

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validates :follower_id, uniqueness: { scope: :followed_id }

  private

  def create_notifications
    Notification.create(notifiable: self, user: followed, action_type: :followed_me)
  end

end
