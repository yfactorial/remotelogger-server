module Api
  class ApiController < ApplicationController
    
    # Turn off CSR/forgery protection
    skip_before_filter :verify_authenticity_token
    
    # All API requests must be authenticated
    before_filter :basic_app_authenticate, :require_app_authentication    
  
    #-- Authentication/Authorization helpers
    
    def current_application
      @application
    end
    
    def current_device_id
      @device_id
    end
  
    def basic_app_authenticate
      authenticate_or_request_with_http_basic("Remote Logger API") do |device_id, app_token|
        @application = Application.find_by_token(app_token)
        @device_id = device_id
      end
    end  
  
    #-- Authentication/Authorization filters
  
    def require_app_authentication
      if !current_application or !current_device_id
        respond_to do |wants|
          message = 'Application token or device identifier were missing and/or invalid'
          wants.html { render :text => message, :status => 401 }
          wants.xml { render :xml => { :errors => { :error => message }}, :status => 401 }
          wants.json { render :json => { :errors => { :error => message }}, :status => 401 }
        end
      end
    end
  end
end