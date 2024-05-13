class Sticker < ApplicationRecord
  
  has_many :balloon_stickers, dependent: :destroy
  
end
