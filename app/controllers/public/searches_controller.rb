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
    @search_obj = params[:search_obj]
    unless params[:keyword] == ""
      if @search_obj == "content"
        @keyword = params[:keyword]
        @balloons = Balloon.where("content LIKE ?", "%#{@keyword}%").where_user_active.includes(:user).order(id: "DESC").page(params[:page]).per(20)
      else
        @keyword = "##{params[:keyword]}"
        @tag = Tag.find_by(name: params[:keyword])
        unless @tag.nil?
          @balloons = @tag.balloons.where_user_active.includes(:user).order(id: "DESC").page(params[:page]).per(20)
        else
          @balloons =[]
        end
      end
    else
      redirect_to request.referer
    end
  end
end
