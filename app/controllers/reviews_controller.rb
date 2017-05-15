class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @classes = GroupClass.where('studio_id = ?', session[:studio_id])
  end

  def create
    @classes = GroupClass.where('studio_id = ?', session[:studio_id])
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

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to '/'
  end

  private

  def review_params
    params.require(:review).permit(
    :rating,
    :content,
    :group_class_id,
    group_class_attributes:[
      :name,
      :duration,
      :studio_id
      ])
  end
end
