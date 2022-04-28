class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @boat = Boat.find(params[:id])
    @booking.boat = @boat
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      raise
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :total_amount, :boat_id, :review_id)
  end
end
