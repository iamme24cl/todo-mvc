class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  # def create
  #   # raise params.inspect
  #   @user = User.find_by(email: params[:email])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_url
  #   else
  #     flash[:error] = "Authentication Failed! Invalid Credentials!"
  #     render 'sessions/new'
  #   end
  # end

  def create
    # raise "stop".inspect
    if auth
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.name = auth['info']['name']
        u.password = SecureRandom.hex
      end
      # binding.pry
      session[:user_id] = @user.id
      redirect_to root_url
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_url
      else
        flash[:error] = "Authentication Failed! Invalid Credentials!"
        render 'sessions/new'
      end
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
