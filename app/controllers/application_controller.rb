class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def user_object
  #   User.find_by(name: session[:username])
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end
end
