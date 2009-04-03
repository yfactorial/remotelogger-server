class UsersController < ApplicationController
  
  make_resourceful do
    
    actions :new, :create
    
    response_for :create do |wants|
      wants.html do
        flash[:notice] = "Thank you for registering"
        redirect_to new_my_application_path
      end
    end
  end
  
  def create
    build_object
    load_object
    if current_object.save
      login(current_object)
      response_for :create
    else
      response_for :create_fails
    end
  end
  
end
    