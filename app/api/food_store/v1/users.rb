module FoodStore
  module V1
    class Users < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :users do
        desc 'list of users'
        get do
          users = User.all
          present users
        end

        desc 'create a new user'
        params do
          requires :name, type: String
          requires :phone, type: String
          requires :address, type: Integer
        end
        post do
          User.create!({name:params[:name], phone:params[:phone],address:params[:address]})
        end

        desc 'Delete user'
        params do
          requires :id, type: String
        end
        delete ':id' do
          user = User.find(params[:id]).destroy!
        end
      end
    end
  end
end