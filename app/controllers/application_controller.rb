class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize
  
  def authorize
    false # Or use code here to check if user is admin or not
  end
end

