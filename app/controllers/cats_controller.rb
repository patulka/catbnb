class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @cats = Cat.search_by_cat_info(params[:query])
    else
      @cats = Cat.all
    end
    @markers = @cats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { cat: cat }),
        image_url: helpers.asset_url('paws.png')
      }
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @booking = Booking.new
    # needed for else-if on display of booking form
    @all_my_cats = Cat.where(user_id: current_user.id)
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

  def my_cats
    @cats = Cat.where(user_id: current_user.id)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :color, :description, :age, :picture_url, :city, :photo)
  end
end
