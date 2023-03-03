class Tag < ApplicationRecord
  has_many :mentorship_tags, dependent: :destroy
  has_many :mentorships, through: :mentorship_tags
  validates :name, presence: true, length: { minimum: 2 }
end
