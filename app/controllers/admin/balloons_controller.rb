class Admin::BalloonsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_balloon
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @user = User.find(@balloon.user_id)
  end

  def destroy
    @balloon.destroy
    redirect_to admin_top_path, notice: "バルーンを削除しました。"
  end

  private

  def ensure_balloon
    @balloon = Balloon.find(params[:id])
  end

  def record_not_found
    redirect_to admin_top_path, alert: "存在しないページです。"
  end

end
