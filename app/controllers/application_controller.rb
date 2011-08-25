class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?
  helper_method :current_user_nil
  
  protected
  
  def admin?
    if current_user.nil?
      redirect_to new_user_session_path
    else
    current_user.email == "ian.grabill@gmail.com"
    end
  end
  
  def current_user_nil
    if current_user.nil?
      redirect_to new_user_session_path
    elsif
      current_user.email == "ian.grabill@gmail.com" || current_user.admin? == true
    end
  end
  
  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end
  
  
end

