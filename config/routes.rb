ActionController::Routing::Routes.draw do |map|
  
  # Initial version of API
  map.namespace :api do |api|
    api.namespace :v1 do |v1|    
      v1.resources :statements, :only => [:show, :create]
    end
  end
  
  # Convenience paths
  map.register 'register', :controller => 'users', :action => 'new'
  
  # Standard resources
  map.resources :users, :only => [:new, :create]
  
  # When logged in, everything happens under the 'my' namespace
  map.namespace :my do |my|
    my.resources :applications, :only => [:new]
  end
end
