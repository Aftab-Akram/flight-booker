class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.belongs_to :from_airport, null: false, index: true, foreign_key: {to_table: :airports}
      t.belongs_to :to_airport, null: false, index: true, foreign_key: {to_table: :airports}
      t.datetime :flight_date, null: false
      t.string :duration

      t.timestamps
    end
  end
end
