class Tag < ApplicationRecord

  has_many :balloon_tags, dependent: :destroy
  has_many :balloons, through: :balloon_tags

  validates :name, length: { in: 1..20 }, uniqueness: true

end
