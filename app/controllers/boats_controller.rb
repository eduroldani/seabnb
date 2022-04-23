class BoatsController < ApplicationController

  def index
  end

  def new
    @boat = Boat.new
  end




  private


  def boat_params
    params.require(:boat).permit(:name, :description, :photo)
  end


end
