module FoodStore
  module V1
    class Orders < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :orders do
        desc 'list of orders'
        get do
          orders = Order.all
          present orders
        end



        desc 'return new order'
        params do
          optional :id
        end
        post 'abc/tgf' do
          order = Order.create!({status:params[:status], bill:params[:bill], user_id:params[:user_id], cart_id:params[:cart_id], item_id:params[:item_id]})
          a = order.item
          present order,
                  with: FoodStore::Entities::Order
        end


        # desc 'create a new order'
        # params do
        #   optional :id
        # end
        # post '/:id' do
        #   order = Order.find(params[:id])
        #   a = order.item
        #   # a = order.user.first.orders.first.cart.total
        #   present order, with: FoodStore::Entities::Order
        # Order.create!({status:params[:status], bill:params[:bill], user_id:params[:user_id], cart_id:params[:cart_id], item_id:params[:item_id]})
        # end





        desc 'delete order'
        params do
          requires :id, type: String
        end
        delete ':id' do
          order = Order.find(params[:id]).destroy!
        end
      end
    end
  end
end