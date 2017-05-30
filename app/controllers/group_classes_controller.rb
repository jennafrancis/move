class GroupClassesController < ApplicationController
  before_action :set_group_class

  def show
  end

  def edit
  end

  def update
    @group_class.update(group_class_params)
    if @group_class.save
      flash[:notice] = "Successfully updated class."
      redirect_to studio_group_class_path(@group_class.studio, @group_class)
    else
      render :edit
    end
  end

  private

  def set_group_class
    @group_class = GroupClass.find(params[:id])
  end

  def group_class_params
    params.require(:group_class).permit(:name, :duration, :studio_id, category_ids: [], categories_attributes: :name)
  end
end
