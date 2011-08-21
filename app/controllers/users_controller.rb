class UsersController < ApplicationController
  
  def show
    #first find the user
    @user = current_user
  end
end

