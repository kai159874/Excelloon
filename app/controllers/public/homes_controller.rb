class Public::HomesController < ApplicationController

  def top
    @stickers = Sticker.all
    if user_signed_in?
      user_ids = current_user.friends.pluck(:id)
      user_ids.push(current_user.id)
      @friends_balloons = Balloon.where_user_active.includes(:user).where(user_id: user_ids).order(created_at: :desc).page(params[:friends_balloons_page]).per(20)
    end
    @balloon_all = Balloon.where_user_active.includes(:user).order(id: "DESC").page(params[:balloon_all_page]).per(20)
  end

  def about
  end

  def tos
  end

end
