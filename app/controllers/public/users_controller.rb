class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:mypage, :edit, :update, :withdrow]

  def mypage
    @stickers = Sticker.all
    if params[:type] == "favorite"
      favorites = Favorite.where(user_id: current_user.id).pluck(:balloon_id).reverse
      @balloons = Balloon.find(favorites)
      @type = "favorite"
    else
      @balloons = @user.balloons.order(id: "DESC")
      @type = "mine"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrow
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "退会しました。"
  end

  def show
    @stickers = Sticker.all
    @user = User.find_by(public_uid: params[:id])
    @balloons = @user.balloons.order(id: "DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_current_user
    @user = current_user
  end

end
