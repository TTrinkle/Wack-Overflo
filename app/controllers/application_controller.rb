class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in, :logged_in?

  def current_user
    current_user ||= User.find_by id: session[:user_id]
  end

  def log_in user
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

end
