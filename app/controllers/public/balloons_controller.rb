class Public::BalloonsController < ApplicationController
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
    @balloon.destroy ? (redirect_to root_path) : (render :edit)
  end

  private

  def balloon_params
    params.require(:balloon).permit(:content, :color_status, :user_id, :balloon_image)
  end

  def ensure_balloon
    @balloon = Balloon.find(params[:id])
  end

end
