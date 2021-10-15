class AddPriceToFlight < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :price, :integer
  end
end
