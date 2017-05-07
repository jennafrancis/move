class CitiesController < ApplicationController
  def index
  end

  def create
    current_city(params[:studios][:city_id])
    redirect_to city_path(current_city)
  end

  def show
    @city = City.find(params[:id])
    @studios = Studio.where('city_id = ?', current_city.id)
    #separate studio db logic to studio controller
  end
end
