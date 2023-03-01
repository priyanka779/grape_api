class ItemsController < ApplicationController
  def index
    items = Items.includes(:items).all
  end
end
