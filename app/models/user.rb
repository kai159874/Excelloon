class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # IDランダム生成
  generate_public_uid

  has_one_attached :profile_image

  has_many :balloons
  has_many :favorites
  has_many :balloon_comments

  # 通報機能
  has_many :active_reports,  class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :passive_reports, class_name: "Report", foreign_key: "reported_id", dependent: :destroy
  has_many :reporting, through: :active_reports,  source: :reported
  has_many :reporters, through: :passive_reports, source: :reporter

  # follow機能
  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
