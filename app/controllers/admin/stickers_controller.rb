class Admin::StickersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_sticker, only: [:edit, :update, :destroy]

  def index
    @stickers = Sticker.all
    @sticker = Sticker.new
  end

  def create
    @sticker = Sticker.new(sticker_params)
    if @sticker.save
      redirect_to admin_stickers_path, notice: "新規ステッカーを登録しました。"
    else
      @stickers = Sticker.all
      render :index
    end
  end

  def edit
  end

  def update
    if @sticker.update(sticker_params)
      redirect_to admin_stickers_path, notice: "ステッカーを編集しました。"
    else
      render :edit, alert: "編集に失敗しました。"
    end
  end

  def destroy
    @sticker.destroy
    redirect_to admin_stickers_path, notice: "ステッカーを削除しました。"
  end

  private

  def sticker_params
    params.require(:sticker).permit(:message)
  end

  def ensure_sticker
    @sticker = Sticker.find(params[:id])
  end

end
