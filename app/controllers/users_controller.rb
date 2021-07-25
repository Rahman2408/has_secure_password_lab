class UsersController < ApplicationController
  def new
  end

  def home 
    @user = User.find(session[:user_id]) 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]  = @user.id
      redirect_to users_home_path
    else 
      redirect_to users_new_path 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
