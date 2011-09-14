class PagesController < ApplicationController
  
  def home
    @home = "Home"
  end
  
  def index
    @index = "Index"
    render :layout => false
  end
  
  def about
    @about = "About"
  end

  def contact
    @contact = "Contact"
  end

end
