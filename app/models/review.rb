class Review < ApplicationRecord
  belongs_to :mentorship
  belongs_to :booking

  validates :title, presence: true
  validates :title, length: { minumum: 5 }
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, length: { minimum: 30 }
end
