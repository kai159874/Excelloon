class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true

end
