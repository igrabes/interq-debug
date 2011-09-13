class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?, :current_user_nil, :require_user  
  
  protected

  def current_user_nil
    if current_user.nil?
      return false
    elsif
      current_user.email == "ian.grabill@gmail.com" || current_user.admin == true
    end
  end

  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end

  def admin?
    if current_user.nil?
      return false
    else
    current_user.email == "ian.grabill@gmail.com"
    end
  end

end
  

