class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.float :bill
      t.belongs_to :user
      t.belongs_to :cart
      t.belongs_to :item

      t.timestamps
    end
  end
end
