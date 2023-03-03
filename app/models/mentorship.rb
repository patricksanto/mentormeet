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
  validates :place, presence: true

  TAGS = ['Arts', 'Business', 'Sports', 'Tech', 'Self-development',
          'Photography', 'Painting', 'Ceramics', 'Spirituality',
          'Career', 'Books', 'Cuisine', 'Illustration', 'Woodwork']

end
