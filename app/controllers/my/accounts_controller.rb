module My
  class AccountsController < MyController
    
    make_resourceful do
      
      actions :show, :edit, :update
      
      response_for :update do |wants|
        wants.html do
          flash[:notice] = "Your account has been updated"
          redirect_back_or my_account_path
        end
      end
    end
    
    private
    
    #-- Make resourceful overrides
    
    def current_object; current_user; end
    def current_model_name; 'User'; end
    def instance_variable_name; 'users'; end
  end
end