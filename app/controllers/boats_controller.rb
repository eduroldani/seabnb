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

  private


  def boat_params
    params.require(:boat).permit(:name, :description, :photo)
  end


end
