class CitiesController < ApplicationController
  def index
  end

  def set_city
    session[:city_id].clear if session[:city_id]
    session[:city_id] = params[:studios][:city_id]
    redirect_to studios_path
  end
end
