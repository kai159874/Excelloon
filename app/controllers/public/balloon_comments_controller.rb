class Public::BalloonCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_balloon_comment

  def create
    @balloon_comment = current_user.balloon_comments.new(balloon_comment_params)
    @balloon_comment.balloon_id = @balloon.id
    @user = User.find_by(id: @balloon.user_id)
    if current_user == @user || current_user.friends.include?(@user)
      @balloon_comment.save
    end
  end

  def destroy
    @user = User.find_by(id: @balloon.user_id)
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
