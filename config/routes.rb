ActionController::Routing::Routes.draw do |map|
  
  #-- API ---
  
  # Initial version
  map.namespace :api do |api|
    api.namespace :v1 do |v1|    
      v1.resources :statements, :only => [:show, :create]
    end
  end
  
  #-- APP ---
  
  # Convenience paths
  map.root :controller => 'sessions', :action => 'new'
  map.register 'register', :controller => 'users', :action => 'new'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :delete }
  
  # Standard resources
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :users, :only => [:new, :create]
  
  # When logged in, everything happens under the 'my' namespace
  map.namespace :my do |my|
    my.resources :applications, :only => [:index, :new, :create],
      :member => { :setup => :get }
    my.resource :dashboard, :only => [:show]
  end
end
