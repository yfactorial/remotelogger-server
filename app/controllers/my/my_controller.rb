module My
  
  class MyController < ApplicationController
    
    before_filter :require_logged_in
  
  end
end