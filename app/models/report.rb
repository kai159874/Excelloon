class Report < ApplicationRecord

  belongs_to :user
  belongs_to :balloon

  validates :user_id, uniqueness: {scope: :balloon_id}
  
end
