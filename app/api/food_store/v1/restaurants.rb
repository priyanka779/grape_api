module FoodStore
  module V1
    class Restaurants < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :restaurants do
        desc 'list of restaurants'
        get do
          restaurants = Restaurant.all
          present restaurants
        end

        desc 'create a new restaurant'
        params do
          requires :restaurants_name, type: String
        end
        post do
          Restaurant.create!({restaurants_name:params[:restaurants_name], location_id:params[:location_id]})
        end

        desc 'Delete restaurant'
        params do
          requires :id, type: String
        end
        delete ':id' do
          restaurant = Restaurant.find(params[:id]).destroy!
        end
      end
    end
  end
end