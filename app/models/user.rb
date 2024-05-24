class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # IDランダム生成
  generate_public_uid column: :public_uid

  def to_param
    public_uid
  end

  validates :name, presence: true, length: { in: 1..10 }
  
  scope :only_active, -> { where(is_active: true) }

  has_one_attached :profile_image

  has_many :balloons,         dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :balloon_comments, dependent: :destroy
  has_many :reports,          dependent: :destroy

  # follow機能
  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def get_profile_image
    if profile_image.attached?
      profile_image.variant( resize: "160x160" ).processed
      return profile_image
    else
      profile_image = 'no_image.jpg'
    end
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

  def friends
    followings & followers
  end

  def friends?(other_user)
    active_relationships.find_by(followed_id: other_user.id) && passive_relationships.find_by(follower_id: other_user.id)
  end

  def follow_request?(user, other_user)
    !user.friends?(other_user) && other_user.following?(user)
  end

end
