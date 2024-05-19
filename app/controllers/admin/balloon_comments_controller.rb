class Admin::BalloonCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @balloon = Balloon.find(params[:balloon_id])
    comment = BalloonComment.find(params[:id])
    comment.destroy
    redirect_to request.referer, notice: "コメントを削除しました。"
  end

end
