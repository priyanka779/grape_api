module FoodStore
  module V1
    class Foods < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :foods do
        desc 'list of foods'
        get do
          foods = Food.all
          present foods
        end
      end


      desc 'Create food'
      params do
        optional :id
      end
      post 'foods/new' do
       food = Food.create!({item_id:params[:item_id], cart_id:params[:cart_id]})
       present food, with: FoodStore::Entities::Food
      end


      desc 'Update food'
      params do
        optional :id
      end
      put 'foods/update' do
        food = Food.find_by(id:params[:id])
        food.update({item_id:params[:item_id], cart_id:params[:cart_id]})
        present food
      end


      desc 'specific food'
      params do
        optional :item_id
        requires :id,
                 type: Integer
      end
      get 'foods/:id' do
        food = Food.find(params[:id])
        present food
      end


      desc 'create new food'
      params do
        optional :id
      end
      post 'foods/create'do
        food = Food.new(item_id: params[:item_id], cart_id: params[:cart_id])
        error!({error: ["food not found!"]}, 422)unless food
        if food.save
          present food, with: FoodStore::Entities::Food
        end
      end


      desc 'delete food'
      params do
       optional :id
      end
      delete 'foods/destroy' do
        food = Food.find_by(id:params[:id]).destroy!
        present food
      end
    end
  end
end
