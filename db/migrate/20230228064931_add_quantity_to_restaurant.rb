class AddQuantityToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :restaurant_quantity, :integer
  end
end
