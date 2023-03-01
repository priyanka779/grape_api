class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :item
  has_many :payments


  before_create :calculate_total

  def calculate_total
    self.cart.total = self.item.quantity * self.item.price
  end
end
