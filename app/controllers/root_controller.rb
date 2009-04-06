class RootController < ApplicationController
  
  make_resourceful do
    response_for :index do |wants|
      wants.html do
        logged_in? ?
          redirect_to(dashboard_path) :
          redirect_to(login_path)
      end
    end
  end
  
  def index
    response_for :index
  end
    
end