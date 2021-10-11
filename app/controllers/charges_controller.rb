class ChargesController < ApplicationController
  before_action :set_booking

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    current_user.update(stripe_customer_id: customer.id)

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @booking.flight.price,
      description: 'Flight Booking customer',
      currency: 'usd'
    )
    @booking.update(stripe_charge_id: charge.id)
    redirect_to @booking

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def show
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
