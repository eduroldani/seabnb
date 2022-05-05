class ReviewsController < ApplicationController

  def new
    @boat = Boat.find(params[:boat_id])
    @review = Review.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @review = Review.new(review_params)
    @review.boat = @boat
    @review.save
    redirect_to boat_path(@boat)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :boat_id)
  end
end
