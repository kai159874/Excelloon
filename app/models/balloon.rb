class Balloon < ApplicationRecord
  belongs_to :user

  has_many :favorites,        dependent: :destroy
  has_many :reports,          dependent: :destroy
  has_many :balloon_comments, dependent: :destroy
  has_many :balloon_stickers, dependent: :destroy
  has_many :balloon_tags,     dependent: :destroy
  has_many :tags, through: :balloon_tags

  has_one :notification, as: :notifiable, dependent: :destroy

  has_one_attached :balloon_image

  scope :where_user_active, -> { joins(:user).where(users: { is_active: true }) }
  scope :where_user_delete, -> { joins(:user).where(users: { is_active: false }) }

  enum color_status: {
    white:    1,
    black:    2,
    red:      3,
    orange:   4,
    yellow:   5,
    grass:    6,
    green:    7,
    water:    8,
    blue:     9,
    wisteria: 10,
    purple:   11,
    pink:     12
  }

  with_options presence: true do
    validates :user_id
    validates :content, length: { in: 1..200 }
    validates :color_status
  end

  def convert_balloon_image(size)
    balloon_image.variant( resize: size ).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
