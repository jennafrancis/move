class StudiosController < ApplicationController
  def show
    session[:studio_id] = params[:id]
    @studio = Studio.find(params[:id])
  end
end
