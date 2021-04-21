class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

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
    params.require(:cat).permit(:name, :breed, :color, :description, :age, :picture_url)
  end
end
