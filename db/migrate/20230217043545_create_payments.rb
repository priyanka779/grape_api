class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :order

      t.timestamps
    end
  end
end
