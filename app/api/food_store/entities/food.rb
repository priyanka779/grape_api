module FoodStore
  module Entities
    class Food < Grape::Entity
      expose(:item_id) do |s|
        # Rails.logger.info("============#{s.inspect}============")
        s.item
      end

      expose(:cart_id) do |s|
        s.cart
      end
    end
  end
end