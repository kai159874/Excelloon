class Report < ApplicationRecord

  belongs_to :reporter_id, class_name: "User"
  belongs_to :reported_id, class_name: "User"
  belongs_to :balloon_id

  validates :reporter_id, presence: true
  validates :reported_id, presence: true
  validates :balloon_id, presence: true

end
