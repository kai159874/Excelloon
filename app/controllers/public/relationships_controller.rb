class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    other_user = User.find(params[:user_id])
    Relationship.create(follower_id: current_user.id, followed_id: other_user.id)
    if current_user.matchers?(other_user)
      redirect_to follow_requests_path, notice: "#{other_user.name}さんと友達になりました！"
    else
      redirect_to mypage_path, notice: "友達申請を送りました！"
    end
  end

  def destroy
    other_user = User.find(params[:user_id])
    if current_user.matchers?(other_user)
      current_user.unfollow(other_user)
      other_user.unfollow(current_user)
      redirect_to friends_path, notice: "#{other_user.name}さんを友達リストから解除しました。"
    else
      other_user.unfollow(current_user)
      redirect_to mypage_path, notice: "友達申請を拒否しました。"
    end
  end

  def friends
    @users = current_user.friends
  end

  def follow_requests
    @users = User.all
  end

end
