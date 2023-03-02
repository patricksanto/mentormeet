class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  has_many :bookings
  has_many :mentorships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone, presence: true
  # validates :phone, presence: true
  # validates :address, presence: true
  # validates :birthday, presence: true
  # validates :city, presence: true
end
