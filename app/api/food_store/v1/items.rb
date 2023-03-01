module FoodStore
  module V1
    class Items < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :items do
        desc 'Return list of items'
        get do
          items = Item.all #current_user.items
          present items
        end


        # desc 'Nil items'
        #  route_param :id  do
        #
        #   get 'hi/:ui' do
        #   end
        #  end


        desc 'Return new item'
        get 'new/:id' do
          item = Item.find(params[:id])
          puts "gfhnfgh"
        end


        # desc 'New params'
        # params do
        #   optional :id
        # end
        # get 'sdsadsadsa/dsadsasad' do
        #   # item = Item.find(params[:id])
        #   present params[:id]
        # end


        desc 'New params'
        params do
          optional :id
        end
        post 'sdsadsadsa/dsadsasad' do
          item = Item.find(params[:id])
          a= item.restaurant.restaurants_name
          present item.restaurant,with: FoodStore::Entities::Item
        end


        #   desc 'Return a specific Items'
        #   route_param :id do
        #     get do
        #       item = Item.find(params[:id])
        #       present item, with: FoodStore::Entities::Item
        #     end
        #   end
        #
          desc 'create a new item'
          params do
            requires :name, type: String
            requires :description, type: String
            requires :price, type: Integer
          end
          post do
            Item.create!({name:params[:name], description:params[:description],price:params[:price], quantity:params[:quantity], restaurant_id:params[:restaurant_id]})
          end

          desc 'Destroy Item'
          params do
            requires :id, type: String
          end
          delete ':id' do
            item = Item.find(params[:id]).destroy!
          end
      end
    end
  end
end