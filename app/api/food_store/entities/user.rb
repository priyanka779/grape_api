module FoodStore
  module Entities
    class User <Grape::Entity
      expose :name
      expose :address
      expose :phone
    end
  end
end