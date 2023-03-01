module FoodStore
  module Entities
    class Order < Grape::Entity
      expose :status
      expose :user_id
      expose :cart_id


      expose(:cart_id) do |s|
        s.cart
      end

      expose(:item_id) do |s|
        s.item
      end
    end
  end
end