class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:mypage, :edit, :update, :withdrow]
  before_action :exist_user?, only: [:show]

  def mypage
    @stickers = Sticker.all
    set_months_balloons_counts(@user)
    hidden_balloons = Balloon.all.where_user_delete.includes(:user)
    if params[:type] == "favorite"
      favorites = Favorite.where(user_id: current_user.id).pluck(:balloon_id).reverse
      @balloons = Balloon.find(favorites) - hidden_balloons
      @balloons = Kaminari.paginate_array(@balloons).page(params[:page]).per(20)
      @type = "favorite"
    else
      @balloons = @user.balloons.order(id: "DESC").page(params[:page]).per(20)
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

    if current_user.friends?(@user) || current_user.follow_request?(current_user, @user)
      if @user.is_active ===false
        @balloons = []
      else
        @balloons = @user.balloons.order(id: "DESC").page(params[:page]).per(20)
      end
      set_months_balloons_counts(@user)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_current_user
    @user = current_user
  end

  def set_months_balloons_counts(user)
    if ActiveRecord::Base.connection.adapter_name.downcase == 'sqlite'
      @month_balloons_counts = user.balloons.group("strftime('%Y-%m', created_at)").count
    else
      @month_balloons_counts = user.balloons.group("DATE_FORMAT(created_at, '%Y-%m')").count
    end
  end

  def exist_user?
    unless User.find_by(public_uid: params[:id])
      redirect_to root_path, alert: "存在しないユーザーです。"
    end
  end

end
