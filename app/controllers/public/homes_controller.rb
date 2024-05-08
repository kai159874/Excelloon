class Public::HomesController < ApplicationController
  def top
    # 有効ユーザーの取得？
    @balloons = Balloon.all.order(id: "DESC")
  end

  def about
  end
end
