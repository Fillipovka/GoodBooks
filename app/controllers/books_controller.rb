class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @genres = @book.categories
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to book_url
  end

  def add_category
    @book = Book.find(params[:id])
    @categories = Category.all
    @book.categories << @categories
  end
  
  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:category_id, :title, :description, :photo_book, :yearPublication, :author_id, :category_ids => [])
    end
end
