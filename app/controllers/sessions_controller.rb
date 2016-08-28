class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    session[:user_id] = params[:user][:id].to_i
    redirect_to user_path(current_user)
  end

end
