class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = current_user.bookings.includes(flight: [:from_airport, :to_airport])
  end

  def new
    @flight = Flight.find_by(id: params[:flight_id])
    if @flight.blank?
      redirect_to flights_path
    end
    @booking = Booking.new
    @booking.passengers.build
  end

  def create
    @booking = current_user.bookings.build(bookings_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email, :_destroy])
  end

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end
end
