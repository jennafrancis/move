class StudiosController < ApplicationController
  def index
    if current_city
      @studios = Studio.where('city_id = ?', current_city.id)
    else
      flash[:error] = "Please select a city to continue."
      redirect_to cities_path
    end
  end

  def show
    session[:studio_id] = params[:id]
    @studio = current_studio
  end
end
