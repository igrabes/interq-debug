class PagesController < ApplicationController
  
  def home
    @home = "Home"
  end
  
  def index
    if user_signed_in?
      redirect_to :controller => 'pages', :action => 'home'
    else 
      @index = "Index"
      render :layout => false
    end
  end
  
  def about
    @about = "About"
  end

  def contact
    @contact = "Contact"
  end

end
