class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_user, only: [:show, :update]

  def index
    @users = User.all.order(id: "DESC").page(params[:page]).per(100)
  end

  def show
    @balloons = @user.balloons.order(id: "DESC").page(params[:page]).per(100)
  end

  def update
    if @user.is_active === true
      @user.update(is_active: false)
      redirect_to admin_user_path(@user), notice: "退会処理が完了しました。"
    else
      @user.update(is_active: true)
      redirect_to admin_user_path(@user), notice: "復元処理が完了しました。"
    end
  end

  private

  def ensure_user
    @user = User.find_by(public_uid: params[:id])
  end

end
