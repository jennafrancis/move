class CitiesController < ApplicationController
  def index
    # redirect_to '/cities/:id' if current_city
  end

  def set_city
    session[:city_id].clear if session[:city_id]
    session[:city_id] = params[:studios][:city_id]
    redirect_to city_path(current_city)
  end

  def show
    # @city = City.find(params[:id])
    @studios = Studio.where('city_id = ?', current_city.id)
    #separate studio db logic to studio controller
  end
end
