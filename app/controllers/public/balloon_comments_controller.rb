class Public::BalloonCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_balloon_comment

  def create
    comment = current_user.balloon_comments.new(balloon_comment_params)
    comment.balloon_id = @balloon.id
    comment.save
  end

  def destroy
    comment = BalloonComment.find(params[:id])
    comment.destroy
  end

  private

  def balloon_comment_params
    params.require(:balloon_comment).permit(:comment)
  end

  def ensure_balloon_comment
    @balloon = Balloon.find(params[:balloon_id])
  end


end
