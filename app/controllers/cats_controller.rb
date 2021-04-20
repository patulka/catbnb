class CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
  end
end
