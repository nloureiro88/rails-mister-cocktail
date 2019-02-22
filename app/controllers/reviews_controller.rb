class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @review = Dose.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.save
    redirect_to @cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:rating, :cocktail_id)
  end
end
