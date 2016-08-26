class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_object
    User.find_by(name: session[:username])
  end
end
