class CitiesController < ApplicationController
  def index
  end

  def create
    # city = City.find()
    redirect_to city_path(params[:studios][:city_id])
  end

  def show
    @city = City.find(params[:id])
    @studios = Studio.where('city_id = ?', @city.id)
    #separate studio db logic to studio controller
  end
end
