class Balloon < ApplicationRecord
  has_many :favorites
  has_many :reports
  has_many :comments
  has_many :balloon_stickers

  has_one_attached :balloon_image

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
    validates :content
    validates :color_status
  end

  def convert_balloon_image(size)
    balloon_image.variant( resize: size ).processed
  end


end
