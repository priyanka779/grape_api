module FoodStore
  module Entities
    class Cart < Grape::Entity
      expose(:total) do |cart|
        cart.total
      end

      expose :items, with: FoodStore::Entities::Item

    end
  end
end