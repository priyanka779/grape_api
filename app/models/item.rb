class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :orders, dependent: :destroy
  has_many :foods
  has_many :carts, :through => :foods
end
