class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :flight, null: false, index: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
