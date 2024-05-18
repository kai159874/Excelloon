class Public::HomesController < ApplicationController
  before_action :top_authenticate_user

  def top
    @stickers = Sticker.all
    if params[:type] == "friends"
      @type = "friends"
      user_ids = current_user.friends.pluck(:id)
      user_ids.push(current_user.id)
      @balloons = Balloon.where(user_id: user_ids).order(created_at: :desc)
    else
      @balloons = Balloon.all.order(id: "DESC")
    end
  end

  def about
  end

  private

  def top_authenticate_user
    if params[:type] == "friends" && !user_signed_in?
      redirect_to root_path
    end
  end

end
