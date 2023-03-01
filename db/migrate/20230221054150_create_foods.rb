class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.belongs_to :item
      t.belongs_to :cart

      t.timestamps
    end
  end
end
