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
    @studio = Studio.new
  end

  def create
    studio = Studio.new(studio_params)
    if studio.save
      redirect_to studio_path(studio)
    else
      render :new
    end
  end

  def show
    session[:studio_id] = params[:id]
    @studio = current_studio
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :street_address, :city_id)
  end
end
