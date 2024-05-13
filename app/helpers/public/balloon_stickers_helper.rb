module Public::BalloonStickersHelper
  def quantity_for_balloon_sticker(balloon, sticker)
    balloon_sticker = BalloonSticker.find_by(balloon_id: balloon.id, sticker_id: sticker.id)
    balloon_sticker ? balloon_sticker.quantity : 0
  end
end
