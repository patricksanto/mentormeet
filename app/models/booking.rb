class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentorship
  has_one :review
  validates :date, presence: true
  validates :is_accepted, inclusion: { in: [ true, false ] }



end



