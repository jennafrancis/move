class GroupClassesController < ApplicationController
  before_action :set_group_class

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_group_class
    @gc = GroupClass.find(params[:id])
  end
end
