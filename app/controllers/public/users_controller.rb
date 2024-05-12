class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:mypage, :edit, :update, :withdrow]

  def mypage
    @balloons = @user.balloons.order(id: "DESC")
    @stickers = Sticker.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "情報を更新しました。"
      redirect_to mypage_path
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrow
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  def show
    @user = User.find_by(public_uid: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_current_user
    @user = current_user
  end

end
