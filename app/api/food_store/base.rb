module FoodStore
  class Base < Grape::API
    mount FoodStore::V1::Items
    mount FoodStore::V1::Users
    mount FoodStore::V1::Carts
    mount FoodStore::V1::Orders
    mount FoodStore::V1::Locations
    mount FoodStore::V1::Restaurants
    mount FoodStore::V1::Payments
    mount FoodStore::V1::Foods
  end
end