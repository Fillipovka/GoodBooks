class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    if @author.update_attributes(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to author_url
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:fName, :lName, :biography, :birthplace, :dateOfBirth,
                                     :photo_author, :category_ids => [])
    end
end