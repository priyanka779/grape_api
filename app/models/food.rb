class Food < ApplicationRecord
  belongs_to :item
  belongs_to :cart


  before_create :calculate_total

  def calculate_total
    self.cart.total = self.item.quantity * self.item.price
  end
end