class BookingsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.cat = @cat
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'cats/show'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end
end

#    cat_bookings POST   /cats/:cat_id/bookings(.:format)      bookings#create
# new_cat_booking GET    /cats/:cat_id/bookings/new(.:format)  bookings#new
#             cat GET    /cats/:id(.:format)                  cats#show
