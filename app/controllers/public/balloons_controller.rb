class Public::BalloonsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_balloon, only: [:show, :destroy]

  def new
    @balloon = Balloon.new
  end

  def create
    @balloon = current_user.balloons.new(balloon_params)
    if @balloon.save
      flash[:success] = "バルーンを作りました！"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @balloon.destroy
      flash[:success] = "バルーンを削除しました。"
      redirect_to root_path
    else
      (render :edit)
    end
  end

  private

  def balloon_params
    params.require(:balloon).permit(:content, :color_status, :user_id, :balloon_image)
  end

  def ensure_balloon
    @balloon = Balloon.find(params[:id])
  end

end
