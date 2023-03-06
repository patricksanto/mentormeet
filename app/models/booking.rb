class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentorship
  has_one :review

  enum status: %i[pending accepted denied]
  validates :date, presence: true
  validates :message, presence: true
  validates :message, length: { minimum: 10 }
end
