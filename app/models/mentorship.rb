class Mentorship < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :content, presence: true
  validates :content, length: { minimum: 100 }
  validates :place, presence: true

end
