class ApplicationController < ActionController::Base
  # Methods you build in controllers do not permeate to your ActionView part of the code
  # We need to explicity define it as a helper method like so
  helper_method :current_user

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login_required
    if !logged_in?
      redirect_to login_path
    end
  end
end
