class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_id])
  end
  helper_method :current_user
  
  def signed_in?
    current_user
  end
  helper_method :signed_in?
  
  def authenticate
    redirect_to(sign_in_path, notice: "You must be signed in") unless signed_in?
  end
  
end
