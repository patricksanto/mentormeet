class Mentorship < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :title, length: { minimum: 30 }
  validates :content, presence: true
  validates :place, presence: true
  validates :is_remote
  validates :is_hybrid


end
