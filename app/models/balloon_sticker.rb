class BalloonSticker < ApplicationRecord

  belongs_to :balloon
  belongs_to :sticker

  validates :quantity, presence: true

end
