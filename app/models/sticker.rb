class Sticker < ApplicationRecord

  has_many :balloon_stickers, dependent: :destroy

  validates :message, presence: true

end
