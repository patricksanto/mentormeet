class Review < ApplicationRecord
  belongs_to :mentorship
  belongs_to :booking
  validates :title, presence: true
  validates :rating, presence: true
  validates :content, length: { minimum: 30 }
end
