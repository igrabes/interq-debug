class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    #first find the user
    @user = current_user
  end
end

