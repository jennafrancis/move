class GroupClassesController < ApplicationController
  before_action :set_group_class

  def show
    @reviews = @gc.reviews
  end

  def edit
  end

  def update
    @gc.update(group_class_params)
    if @gc.save
      flash[:notice] = "Successfully updated class."
      redirect_to studio_group_class_path(@gc.studio, @gc)
    else
      render :edit
    end
  end

  private

  def set_group_class
    @gc = GroupClass.find(params[:id])
  end

  def group_class_params
    params.require(:group_class).permit(:name, :duration, :studio_id, category_ids: [], categories_attributes: :name)
  end
end
