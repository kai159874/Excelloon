class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  has_one :notification, as: :notifiable, dependent: :destroy
  after_create :create_notifications

  private

  # def create_notifications
  #   Notification.create(notifiable: self, user: @user, action_type: :direct_message_to_me)
  # end

end
