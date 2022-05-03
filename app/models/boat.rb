class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :size, presence: true
  validates :max_speed, presence: true
  validates :capacity, presence: true
  validates :photo, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
