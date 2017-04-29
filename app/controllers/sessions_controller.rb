class SessionsController < ApplicationController
  def new
  end

  def create
    @login = true if logged_in?
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	if logged_in?
  		forget(current_user)
  		session.delete(:user_id)
  		@current_user = nil
  	end
  	redirect_to root_url
  end
end
