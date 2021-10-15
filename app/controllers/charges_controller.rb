class ChargesController < ApplicationController
  before_action :set_booking

  def create
    customer_id = current_user.stripe_customer_id
    ActiveRecord::Base.transaction do
      customer_id = create_stripe_customer(params) if customer_id.nil?
      pay_booking_charges(customer_id)
    end

    redirect_to @booking
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def show
    @charge = Stripe::Charge.retrieve(@booking.stripe_charge_id)
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def create_stripe_customer
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    current_user.update(stripe_customer_id: customer.id)
    customer.id
  end

  def pay_booking_charges(customer_id)
    charge = Stripe::Charge.create(
      customer: customer_id,
      amount: @booking.flight.price,
      description: 'Flight Booking customer',
      currency: 'usd'
    )
    @booking.update(stripe_charge_id: charge.id)
  end
end
