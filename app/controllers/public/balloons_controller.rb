class Public::BalloonsController < ApplicationController
  before_action :ensure_balloon, only: [:show, :edit, :update, :destroy]
  
  def new
    @balloon = Balloon.new
  end
  
  def create
    @balloon = current_user.balloon.new(balloon_params)
    if @balloon.save
      redirect_to balloons_path, flash[:success] = "バルーンを作りました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    @balloon.update(balloon_params) ? (redirect_to balloon_path(@balloon)) : (render :edit)
  end
  
  def destroy
    @balloon.destroy ? (redirect_to balloons_path) : (render :edit)
  end
  
  private
  
  def balloon.params
    params.requier(:balloon).permit(:content, :color_status, :user_id)
  end
  
  def ensure_balloon
    @balloon = Balloon.find(params[:id])
  end
  
end
