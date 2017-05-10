class GroupClassesController < ApplicationController
  def show
    @gc = GroupClass.find(params[:id])
  end
end
