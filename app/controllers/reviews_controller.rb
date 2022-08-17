class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = Restaurant.new
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(prams[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:resttaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
