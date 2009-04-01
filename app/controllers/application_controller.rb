class ApplicationController < ActionController::Base
  
  include ExceptionNotifiable
  
  helper :all
  protect_from_forgery

end
