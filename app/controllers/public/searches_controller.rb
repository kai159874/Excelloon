class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
  end

  def user_search
    @keyword = params[:keyword]
    @result = User.find_by('public_uid LIKE ?', @keyword)
  end

  def balloons_search
    @stickers = Sticker.all
    unless params[:keyword].nil?
      @keyword = params[:keyword]
      @balloons = Balloon.where("content LIKE ?", "%#{@keyword}%").where_user_active.includes(:user).order(id: "DESC").page(params[:page]).per(20)
    else
      @keyword = "##{params[:tag_keyword]}"
      @balloons = Tag.find_by(name: params[:tag_keyword]).balloons.where_user_active.includes(:user).order(id: "DESC").page(params[:page]).per(20)
    end
  end
end
