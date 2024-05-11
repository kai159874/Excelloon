class Public::BalloonsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_balloon, only: [:show, :update, :destroy]

  def new
    @balloon = Balloon.new
  end

  def create
    @balloon = current_user.balloons.new(balloon_params)
    if @balloon.save
      flash[:notice] = "バルーンを作りました！"
      redirect_to balloon_path(@balloon)
    else
      render :new
    end
  end

  def show
    # さすがにクソコードすぎる モデルにメソッド書きたい あとviewの表示方法考える
    @sticker1 = Sticker.find(1)
    @sticker2 = Sticker.find(2)
    @sticker3 = Sticker.find(3)
    @sticker4 = Sticker.find(4)
    @sticker1_quantity = BalloonSticker.find_by(balloon_id: @balloon.id, sticker_id: @sticker1.id)
    @sticker2_quantity = BalloonSticker.find_by(balloon_id: @balloon.id, sticker_id: @sticker2.id)
    @sticker3_quantity = BalloonSticker.find_by(balloon_id: @balloon.id, sticker_id: @sticker3.id)
    @sticker4_quantity = BalloonSticker.find_by(balloon_id: @balloon.id, sticker_id: @sticker4.id)
    @user = User.find(@balloon.user_id)
  end

  def update
    if @balloon.update(balloon_params)
      flash[:notice] = "バルーンの色を変更しました。"
      redirect_to balloon_path(@balloon)
    else
      flash[:alert] = "色の変更に失敗しました。"
      render :show
    end
  end

  def destroy
    if @balloon.destroy
      flash[:notice] = "バルーンを削除しました。"
      redirect_to root_path
    else
      render :edit
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
