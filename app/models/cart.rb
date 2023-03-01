class Cart < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :items, :through => :foods



  # before_create :calculate_total
  # def calculate_total
  #   self.cart.total += self.item.quantity * self.item.price
  # end


  # before_create do
  #    self.cart.total += self.item.quantity * self.item.price
  # end


  # before_commit :update_total, on: :update
  #
  # def update_total
  #    self.total += self.item.quantity * self.item.price
  # end
end