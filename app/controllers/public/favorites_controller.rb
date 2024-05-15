class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @balloon = Balloon.find(params[:balloon_id])
    favorite = current_user.favorites.new(balloon_id: @balloon.id)
    favorite.save
  end

  def destroy
    @balloon = Balloon.find(params[:balloon_id])
    favorite = current_user.favorites.find_by(balloon_id: @balloon.id)
    favorite.destroy
  end

end
