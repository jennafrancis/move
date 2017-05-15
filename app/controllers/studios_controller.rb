class StudiosController < ApplicationController
  def show
    session[:studio_id] = params[:id]
    @studio = current_studio
  end
end
