class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    if review.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :group_class_id)
  end
end
