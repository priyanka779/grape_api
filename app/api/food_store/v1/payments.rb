module FoodStore
  module V1
    class Payments < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :payments do
        desc 'list of payment'
        get do
          payment = Payment.all
          present payment 
        end


        desc 'specific payment'
        get ':id' do
          payment = Payment.find(params[:id])
          present payment
        end

        desc 'Delete payment'
        params do
          requires :id, type: String
        end
        delete ':id' do
          payment = Payment.find(params[:id]).destroy!
        end
      end
    end
  end
end