class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews

    render :json => @reviews
  end

  def new
    @review = Review.new
    @classes = GroupClass.where('studio_id = ?', current_studio)
  end

  def create
    @classes = GroupClass.where('studio_id = ?', current_studio)
    @review = Review.new(review_params)
    @review.user = current_user
    if !params[:review][:group_class_id].blank? && !params[:review][:group_class_attributes][:name].blank?
      flash[:error] = "Please select a class or create a new one, not both."
      render :new
    elsif params[:review][:group_class_attributes][:duration].to_i > 360
      flash[:error] = "Invalid group class duration. Please try again."
      render :new
    else
      if @review.save
        redirect_to studio_group_class_path(current_studio, @review.group_class)
      else
        render :new
      end
    end
  end

  def create_from_ajax
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      render json: @review, status: 201
    else
      render 'group_classes/show'
    end
  end

  def destroy
    review = Review.find(params[:id])
    gc = review.group_class
    review.destroy
    redirect_to studio_group_class_path(current_studio, gc)
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
        ]
      )
  end
end
