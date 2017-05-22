class StudiosController < ApplicationController
  def index
    @studios = Studio.where('city_id = ?', current_city.id)
  end

  def show
    session[:studio_id] = params[:id]
    @studio = current_studio
  end
end
