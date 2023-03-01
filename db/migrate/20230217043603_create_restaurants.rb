class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurants_name
      t.belongs_to :location

      t.timestamps
    end
  end
end
