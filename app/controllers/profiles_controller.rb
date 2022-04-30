class ProfilesController < ApplicationController

  def index
    @user = current_user
    @boats = Boat.find(@user.boats.ids)
    @booking = Booking.find(@user.bookings.ids)

  end

  def bookings
    @user = current_user
    @bookings = Booking.find(@user.bookings.ids)
  end

  def boats
    @user = current_user
    @boats = Boat.find(@user.boats.ids)
  end


end
