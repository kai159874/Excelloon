class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  has_one :notification, as: :notifiable, dependent: :destroy
  after_create :create_notifications

  private

  def create_notifications
    self.room.user_rooms.each do |user_room|
      next if user_room.user == self.user # 送信者自身には通知しない
      Notification.create(notifiable: self, user: user_room.user, action_type: :direct_message_to_me)
    end
  end

end
