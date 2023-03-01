module FoodStore
  module V1
    class Carts < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :carts do
        desc 'list of carts'
        get do
          carts = Cart.all
          present carts
        end


        desc 'create a new cart'
        params do
         optional :id
        end
        post 'create/new' do
          cart = Cart.create!({ user_id:params[:user_id]})
          present cart
        end


        # desc "calculate total"
        # params do
        #  optional :id
        # end
        # get "/total_price" do
        #   carts = Cart.all
        #   total = 0
        #   carts.each do |cart|
        #     cart.items.each do |item|
        #       total += item.price * item.quantity
        #     end
        #   end
        #   present total
        # end



        desc "calculate total for single cart"
        params do
          requires :cart_id, type: Integer
        end
        get "/single_total_price" do
          cart = Cart.find_by(id: params[:cart_id])
          error!({errors: ["cart not found"]}, 422) unless cart
          total = 0
          cart.items.each do |item|
            total += item.price * item.quantity
          end
          cart.update(total: total)
          present cart,
                  with: FoodStore::Entities::Cart
        end



        desc 'Delete cart'
        params do
          requires :id, type: Integer
        end
        delete '/delete' do
          cart = Cart.find(params[:id]).destroy!
          present cart
        end


        desc 'Update Cart'
        params do
          optional :id
        end
        put '/update' do
          cart = Cart.find_by(id: params[:id])
          error!({errors: ["record not found"]}, 422) unless cart
           # Rails.logger.info("============#{params.inspect}============")
          cart.update(user_id:params[:user_id], total:params[:total])
          present cart
        end



        desc "calculate total for single cart"
        params do
          requires :id, type: Integer
          requires :restaurant_id, type: Integer
          requires :item_id, type: Integer
        end
        put "/restaurant/price" do
          cart = Cart.find_by(id:params[:id])
          error!({errors: ["record not found"]}, 422) unless cart
          restraunt = Restaurant.find_by(id: params[:restaurant_id])
          error!({errors: ["restraunt not found"]}, 422) unless restraunt
          item = restraunt.items.find_by(id: params[:item_id])
          error!({errors: ["item not found"]}, 422) unless item
          # Food.create!(item_id:params[:item_id], cart_id: params[:id])
          total = 0
          cart.items.each do |item|
            total += item.price * item.quantity
          end
          cart.update(total: total)
          present cart,
                  with: FoodStore::Entities::Cart
          end



        desc 'check restaurant quantity'
        params do
          requires :id, type: Integer
          requires :restaurant_id, type: Integer
          requires :quantity, type: Integer
          requires :restaurant_quantity, type: Integer
          requires :restaurant_id, type: Integer
          # requires :location_id, type: Integer
        end
        put "/food/quantity" do
        cart = Cart.find_by(id:params[:id])
        error!({errors: ["record not found"]}, 422) unless cart

        restaurant = Restaurant.find_by(id: params[:restaurant_id])
        error!({errors: ["restaurent not found"]}, 422) unless restaurant

        restaurant = Restaurant.find_by(id:params[:id])
        restaurant.update(restaurant_quantity: params[:restaurant_quantity])

        # error!({errors: ["Insufficent quantity"]}, 422) unless restaurant
        # Food.create!(item_id:params[:item_id], cart_id: params[:id])
        total = 0
        cart.items.each do |item|
          total += item.price * item.quantity
        end
        cart.update(total: total)
        present cart,
                with: FoodStore::Entities::Cart
        end

        

        # desc 'update carts'
        # params do
        #   optional :id
        # end
        # put '/update/test' do
        #   cart = Cart.find_by(id: params[:id])
        #   cart.update(user_id: params[:user_id])
        #   # error!({errors: ["Not found"]}, 422) unless cart
        #   # Rails.logger.info("=========#{params.inspect}==========")
        #
        #   present cart, with: FoodStore::Entities::Cart
        # end
      end
    end
  end
end