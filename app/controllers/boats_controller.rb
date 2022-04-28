class BoatsController < ApplicationController

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if current_user.nil?
      @boat.user = User.find(1)
    else
      @boat.user = current_user
    end
    if @boat.save
      redirect_to boats_path
    else
      raise
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :description, :photo)
  end


end
