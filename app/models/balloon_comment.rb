class BalloonComment < ApplicationRecord

  belongs_to :user
  belongs_to :balloon

  validates :comment, presence: true

end
