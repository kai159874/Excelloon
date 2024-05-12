class Public::BalloonStickersController < ApplicationController
  before_action :authenticate_user!

  def create
    if BalloonSticker.find_by(balloon_id: params[:balloon_id], sticker_id: params[:sticker_id]).present?
      balloon_sticker = BalloonSticker.find_by(balloon_id: params[:balloon_id], sticker_id: params[:sticker_id])
      balloon_sticker.quantity += 1
      balloon_sticker.update(quantity: balloon_sticker.quantity)
      # ↓非同期までの仮置き
      redirect_to request.referer
    else
      balloon_sticker = BalloonSticker.new(balloon_sticker_params)
      balloon_sticker.quantity = 1
      balloon_sticker.save
      redirect_to request.referer
    end
  end

  private

    def balloon_sticker_params
        params.permit(:balloon_id, :sticker_id)
    end

end
