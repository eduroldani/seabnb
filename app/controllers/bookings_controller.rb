class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    if current_user.nil?
      @booking.user = User.find(52)
    else
      @booking.user = current_user
    end
    if @booking.save
      redirect_to bookings_path
    else
      raise
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :total_amount, :boat_id, :review_id)
  end
end
