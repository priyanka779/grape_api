module FoodStore
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'list of locations'
        get do
          locations = Location.all
          present locations
        end


        # desc 'specific location'
        # params do
        #   requires :id, type: Integer
        # end
        # get ':id' do
        #   location = Location.find(params[:id])
        #   present params[:id]
        # end


        desc 'create a new location'
        params do
          requires :address, type: String
        end
        post do
          Location.create!({address:params[:address]})
        end


        desc 'delete loaction'
        params do
          requires :id, type: String
        end
        delete ':id' do
          location = Location.find(params[:id]).destroy!
        end
      end
    end
  end
end