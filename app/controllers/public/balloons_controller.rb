class Public::BalloonsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_balloon, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    @balloon = Balloon.new
  end

  def create
    @balloon = current_user.balloons.new(balloon_params)

    tag_name = params[:tag_name].split(",")
    tags = tag_name.map { |tag_name| Tag.find_or_initialize_by(name: tag_name) }

    tags.each do |tag|
      if tag.invalid?
        @tag_name = params[:tag_name]
        @balloon.errors.add(:tags, tag.errors.full_massages.join("\n"))
        return render :edit, status: :unprocessable_entity
      end
    end
    @balloon.tags = tags

    if @balloon.save
      redirect_to balloon_path(@balloon), notice: "バルーンを作りました！"
    else
      @tag_name = params[:tag_name]
      render :new
    end
  end

  def show
    @stickers = Sticker.all
    @user = User.find(@balloon.user_id)
    unless @user.is_active
      redirect_to root_path, alert: "退会ユーザーのバルーンです。"
    end
    @balloon_comment = BalloonComment.new
  end

  def update
    if @balloon.update(balloon_params)
      redirect_to balloon_path(@balloon), notice: "バルーンの色を変更しました。"
    else
      render :show, alert: "色の変更に失敗しました。"
    end
  end

  def destroy
    @balloon.destroy
    redirect_to root_path, notice: "バルーンを削除しました。"
  end

  private

  def balloon_params
    params.require(:balloon).permit(:content, :color_status, :user_id, :balloon_image)
  end

  def ensure_balloon
    @balloon = Balloon.find(params[:id])
  end

  def record_not_found
    redirect_to root_path, alert: "存在しないページです。"
  end

end
