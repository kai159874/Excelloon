class Public::BalloonStickersController < ApplicationController
  before_action :authenticate_user!

  def create
    @stickers = Sticker.all
    @balloon = Balloon.find(params[:balloon_id])
    if BalloonSticker.find_by(balloon_id: @balloon, sticker_id: params[:sticker_id]).present?
      balloon_sticker = BalloonSticker.find_by(balloon_id: @balloon, sticker_id: params[:sticker_id])
      balloon_sticker.quantity += 1
      balloon_sticker.update(quantity: balloon_sticker.quantity)
    else
      balloon_sticker = BalloonSticker.new(balloon_sticker_params)
      balloon_sticker.quantity = 1
      balloon_sticker.save
    end
  end

  private

    def balloon_sticker_params
      params.permit(:balloon_id, :sticker_id)
    end

end
