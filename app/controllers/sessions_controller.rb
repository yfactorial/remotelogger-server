class SessionsController < ApplicationController
  
  make_resourceful do
    
    actions :new, :create, :destroy
    
    response_for :create do |wants|
      wants.html do
        flash[:notice] = "You've successfully logged in."
        redirect_back_or dashboard_path
      end
    end
    
    response_for :create_fails do |wants|
      wants.html do
        flash[:error] = "Could not find a user with that email and password.  Please try again or register as a new user."
        render :action => 'new'
      end
    end
    
    response_for :destroy do |wants|
      wants.html do
        flash[:notice] = "You've successfully logged out."
        redirect_to root_path
      end
    end
  end
  
  def new; end
  
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      login(@user)
      response_for :create
    else 
      response_for :create_fails
    end
  end
  
  def destroy
    logout
    response_for :destroy
  end
end
