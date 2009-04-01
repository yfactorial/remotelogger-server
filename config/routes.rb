ActionController::Routing::Routes.draw do |map|
  
  # Initial version of API
  map.namespace :api do |api|
    api.namespace :v1 do |v1|    
      v1.resources :statements, :only => [:show, :create]
    end
  end
end
