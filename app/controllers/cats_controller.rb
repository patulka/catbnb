class CatsController < ApplicationController
  before_action :find_cat, only: [:show]

  def show
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :breed, :photo, :description, :color)
  end
end
