class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :country

      t.timestamps
    end
  end
end
