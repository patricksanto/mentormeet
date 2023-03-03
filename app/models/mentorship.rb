class Mentorship < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :content, presence: true
  validates :content, length: { minimum: 100 }
  validates :place, presence: true

  geocoded_by :place
  after_validation :geocode, if: :will_save_change_to_place?
end
