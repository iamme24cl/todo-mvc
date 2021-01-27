class UsersController < ApplicationController

  def index
    redirect_to new_user_path
  end

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
