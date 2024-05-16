class Public::HomesController < ApplicationController
  before_action :top_authenticate_user

  def top
    @stickers = Sticker.all
    @balloons = Balloon.all.order(id: "DESC")
    if params[:type] == "friends"
      @type = "friends"
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
