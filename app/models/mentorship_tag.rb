class MentorshipTag < ApplicationRecord
  belongs_to :mentorship
  belongs_to :tag
  validates :tag, uniqueness: { scope: :mentorship }
end
