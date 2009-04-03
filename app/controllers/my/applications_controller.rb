module My
  
  class ApplicationsController < MyController
    
    before_filter :require_authorized_app, :only => [:show, :edit, :update, :destroy]
  
    make_resourceful do
      
      actions :index, :new, :create
      
      response_for :create do |wants|
        wants.html do
          flash[:notice] = "You've successfully created the \"#{current_object}\" application"
          redirect_back_or setup_my_application_path(current_object)
        end
      end
    end
    
    # Display setup instructions
    def setup
      load_object
      response_for :setup
    end
    
    private
    
    #-- Make resourceful overrides
    
    # Applications are always nested under the account
    def parent?; true; end
    def parent_object; current_account; end
    
    #-- Filters
    
    def require_authorized_app
      if not current_user.access?(current_object)
        respond_to do |wants|
          wants.html do
            flash[:notice] = "You do not have the appropriate permissions to access that application"
            redirect_back_or my_applications_path
          end
        end
      end
    end
  
  end
end