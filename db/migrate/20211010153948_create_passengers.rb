class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.belongs_to :booking, null: false, index: true

      t.timestamps
    end
  end
end
