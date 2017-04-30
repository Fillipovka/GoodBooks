class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else 
      render 'new'
    end
  end
  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_url
  end

  def show
    @books = @category.books
  end

  private
    def category_params
      params.require(:category).permit(:genre)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end