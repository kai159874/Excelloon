class Balloon < ApplicationRecord
  has_many :favorites
  has_many :reports
  has_many :comments
  has_many :balloon_stickers
  
  has_one_attached :balloon_image
  
  with_options presence: true do
    validates :user_id
    validates :content
    validates :color_status
  end
  
end
