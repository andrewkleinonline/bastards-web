class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    #byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      #say you need to enter a name
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    #@games = Game.where(user_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
