class StudiosController < ApplicationController
  def index
    if current_city
      @studios = Studio.where('city_id = ?', current_city.id)
    else
      flash[:error] = "Please select a city to continue."
      redirect_to cities_path
    end
  end

  def new
  end

  def create
  end

  def show
    session[:studio_id] = params[:id]
    @studio = current_studio
  end

  private

  def studio_params
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
