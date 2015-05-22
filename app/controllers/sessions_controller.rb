class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    p params
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end