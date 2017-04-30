class FavoriteBooksController < ApplicationController
  before_action :logged_in_user

  def create
    @book = Book.find(params[:book_id])
    current_user.favorite(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    @book = FavoriteBook.find(params[:id]).book
    current_user.unfavorite(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end
end
