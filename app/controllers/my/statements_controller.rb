module My
  class StatementsController < MyController
    
    make_resourceful do      
      actions :index
      belongs_to :application      
    end
    
    private
    
    #-- Make resourceful overrides
    
    # Get most recent statements for this account
    def current_objects
      @current_objects ||= parent_object.statements.with(:application).paginate(paging_params)
    end
    
    # Parent can either be account (implied) or application (explicit)
    def parent_object
      if not params[:application_id].blank?
        @parent_object ||= Application.find(params[:application_id])
      else
        @parent_object ||= current_account
      end
    end
  end
end