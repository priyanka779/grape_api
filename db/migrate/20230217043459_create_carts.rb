class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :total
      t.belongs_to :user

      t.timestamps
    end
  end
end
