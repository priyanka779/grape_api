class BooksController < ApplicationController
  def index
    books = Book.includes(:books).all
    render json: Panko::ArraySerializer.new(books, each_serializer: BookSerializer).to_json
  end
end
