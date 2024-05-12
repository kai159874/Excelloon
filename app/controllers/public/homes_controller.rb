class Public::HomesController < ApplicationController
  helper Public::BalloonStickersHelper
  def top
    # 有効ユーザーの取得？
    @balloons = Balloon.all.order(id: "DESC")
    @stickers = Sticker.all
  end

  def about
  end
end
