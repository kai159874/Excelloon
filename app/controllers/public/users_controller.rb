class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:mypage, :edit, :update, :withdrow]

  def mypage
    @stickers = Sticker.all
    set_months_balloons_counts(@user)
    if params[:type] == "favorite"
      favorites = Favorite.where(user_id: current_user.id).pluck(:balloon_id).reverse
      @balloons = Balloon.find(favorites)
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
    @balloons = @user.balloons.order(id: "DESC").page(params[:page]).per(20)
    set_months_balloons_counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_current_user
    @user = current_user
  end

  def set_months_balloons_counts(user)
    start_date = Date.today.beginning_of_year
    end_date = start_date.end_of_year
    @counts = user.balloons.where("date(created_at) BETWEEN date(?) AND date(?)", start_date, end_date).group("strftime('%Y-%m', created_at)").count
  end

end
