class Review < ApplicationRecord
  belongs_to :mentorship
  belongs_to :booking
end
