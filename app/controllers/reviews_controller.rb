class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @group_classes = GroupClass.all
    raise params.inspect
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :group_class_id)
  end
end
