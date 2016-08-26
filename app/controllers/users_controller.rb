class UsersController < ApplicationController

  def new
    @user = User.new
    render :homepage
  end

  def create
    @user = User.new(user_params)
    #byebug
    if @user.save
      session[:username] = @user.name
      redirect_to new_game_path
    else
      #say you need to enter a name
      redirect_to '/'
    end
  end

  # def show #profile page???
  #   @user = User.find(params[:id])
  #   @game = Game.new
  # end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
