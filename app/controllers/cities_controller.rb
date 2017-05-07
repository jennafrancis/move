class CitiesController < ApplicationController
  def index
  end

  def create
    city = City.find(params[:studios][:city_id])
    redirect_to city_path(city)
  end

  def show
    @city = City.find(params[:id])
  end
end
