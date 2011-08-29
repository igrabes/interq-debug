class UsersController < ApplicationController
  
  before_filter :current_user_nil
  before_filter :authorize, :except => [:show]
  
  def index
    @user = User.all
  end
  
  def show
    #first find the user
    @user = current_user
  end
end

