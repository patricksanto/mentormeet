class Conversation < ApplicationRecord

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id
  validates :sender_id, uniqueness: { scope: :mentorship }

  # scope :between, -> (sender_id, recipient_id) do
  #   where
  #     ((conversations.sender_id = ?\s && conversations.recipient_id = ?\s) || (conversations.sender_id = ?\s && conversations.recipient_id =?\s), sender_id,recipient_id, recipient_id, sender_id)
    # end
end
