class CatsController < ApplicationController
  def new
    @cat = Cat.new
  end

  def create
    @user = current_user
    @cat = Cat.new(cat_params)
    @cat.user = @user
    if @cat.save!
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cats).permit(:name, :breed, :color, :description)
  end
end
