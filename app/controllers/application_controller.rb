class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
private
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) rescue nil
    end
  end

  helper_method :current_user
  
  def current_cart
    current_user.cart
  end
  
  def authorize
  	redirect_to new_session_path, alert: "Nao autorizado" if current_user.nil?
  end
  
  def authorize_admin
  	redirect_to new_session_path, alert: "Area limitada a administradores" if current_user.nil? || !current_user.admin
  end
end
