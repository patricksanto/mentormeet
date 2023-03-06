class Mentorship < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews
  has_many :mentorship_tags, dependent: :destroy
  has_many :bookings
  has_many :tags, through: :mentorship_tags
  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :content, presence: true
  validates :content, length: { minimum: 100 }
  validates :address, presence: true
  validates :callout, length: { minimum: 30 }
  validates :callout, length: { maximum: 80 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :globalsearch,
                  against: %i[title content],
                  associated_against: {
                    user: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
