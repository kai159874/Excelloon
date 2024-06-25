class BalloonTag < ApplicationRecord
  belongs_to :balloon
  belongs_to :tag

  validates :balloon_id, uniqueness: { scope: :tag_id }
end
