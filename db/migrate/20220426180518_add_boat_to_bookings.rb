class AddBoatToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :boat, null: false, foreign_key: true
  end
end
