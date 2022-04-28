class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
end
