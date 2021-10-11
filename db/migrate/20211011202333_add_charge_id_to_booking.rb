class AddChargeIdToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :stripe_charge_id, :string
  end
end
