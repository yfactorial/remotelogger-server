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
  map.root :controller => 'root'
  map.register 'register', :controller => 'users', :action => 'new'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :delete }
  map.dashboard 'dashboard', :controller => 'my/statements'
  
  # Standard resources
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :users, :only => [:new, :create]
  
  # When logged in, everything happens under the 'my' namespace
  map.namespace :my do |my|
    my.resource :account, :only => [:show, :edit, :update] do |account|
      account.resources :statements, :only => [:index]
    end
    my.resources :applications, :only => [:index, :show, :new, :create],
      :member => { :setup => :get } do |application|
      application.resources :devices, :except => :all do |device|
        device.resources :statements, :only => [:index]
      end
      application.resources :statements, :only => [:index]
    end
  end
end
