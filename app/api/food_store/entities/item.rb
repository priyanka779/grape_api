module FoodStore
  module Entities
    class Item < Grape::Entity
      expose :name
      expose :price
      expose :quantity

      expose(:restaurant_quantity) do |item|
        item.restaurant.restaurant_quantity
      end
    end
  end
end