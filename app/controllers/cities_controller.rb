class CitiesController < ApplicationController
  def index
  end

  def show
    session[:city_id].clear if session[:city_id]
    session[:city_id] = params[:id]
    redirect_to studios_path
  end
end
