class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
