class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :followers, :following]
  before_action :create_post, only: [:show, :feed]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user  
    else
      render 'edit'
    end
  end

  def feed
    @feed_items = current_user.feed
  end

  def new_release
    @favorite_categories = current_user.categories.build(:category_ids => [])
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation,
                                   :photo_user, :dateOfBirth, :gender, :city, :country, :aboutMe, :interests,
                                   :category_ids => [])
    end

    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless logged_in?
        redirect_to root_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def create_post
      @post = current_user.posts.build if logged_in?
    end
end