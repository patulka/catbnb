class BookingsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new(booking_params)
    @booking.cat = @cat
    if @booking.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end
end

#    cat_bookings POST   /cats/:cat_id/bookings(.:format)      bookings#create
# new_cat_booking GET    /cats/:cat_id/bookings/new(.:format)  bookings#new
#             cat GET    /cats/:id(.:format)                  cats#show
