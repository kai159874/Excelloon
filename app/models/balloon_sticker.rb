class BalloonSticker < ApplicationRecord

  belongs_to :balloon
  belongs_to :sticker

  validates :quantity, presence: true

  def find_balloon_sticker(balloon_id, sticker_id)
    BalloonSticker.find_by(balloon_id: balloon_id, stiker_id: sticker_id)
  end
end
