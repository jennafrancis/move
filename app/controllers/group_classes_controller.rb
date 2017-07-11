class GroupClassesController < ApplicationController
  before_action :set_group_class, except: [:new, :create, :show]

  def new
    @group_class = GroupClass.new
  end

  def create
    @group_class = GroupClass.new(group_class_params)
    @group_class.studio = current_studio
    if @group_class.save
      render json: @group_class
    else
      render :new
    end
  end

  def show
    @studio = Studio.find(params[:studio_id])
    @group_class = GroupClass.next(@studio, params[:id])

    render :json => @group_class
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
