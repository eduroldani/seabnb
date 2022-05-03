class BoatsController < ApplicationController

  def index
    if params[:query].present?
      @boats = Boat.search_by_name_and_location(params[:query])
    else
      @boats = Boat.all
    end
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    else
    @boat = Boat.new
    end
  end

  def create
    @boat = Boat.new(boat_params)
    if current_user.nil?
      @boat.user = User.find(63)
    else
      @boat.user = current_user
    end
    if @boat.save
      redirect_to boats_path
    else
      raise
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end

  private



  def boat_params
    params.require(:boat).permit(:name, :location, :price_per_day, :size, :max_speed, :capacity,  :description, :photo)
  end


end
