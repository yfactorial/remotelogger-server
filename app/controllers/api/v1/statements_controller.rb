module Api
  module V1
    
    class StatementsController < V1Controller
      
      make_resourceful do
        
        actions :create, :show

        response_for(:show) do |format|
          format.html { render :text => current_object }
          format.xml { render :xml => current_object }
          format.js { render :json => current_object }
          format.json { render :json => current_object }
        end

        response_for(:create) do |format|
          format.html { render :text => 'Statement successfully created', :status => :created }
          format.xml { render :xml => current_object, :status => :created, :location => api_v1_statement_url(current_object, :format => :xml) }
          format.js { render :json => current_object, :status => :created, :location => api_v1_statement_url(current_object, :format => :json) }
          format.json { render :json => current_object, :status => :created, :location => api_v1_statement_url(current_object, :format => :json) }
        end
        
        response_for(:create_fails) do |format|
          format.html { render :text => current_object.errors.full_messages.join('\n'), :status => 400 }
          format.xml { render :xml => current_object.errors, :status => 400 }
          format.js { render :json => current_object.errors, :status => 400 }
          format.json { render :json => current_object.errors, :status => 400 }
        end
      end
      
      #-- Make resourceful overrides
      
      def build_object
        @current_object ||= current_application.statements.build(object_parameters)
      end
      
      def object_parameters
        (params[current_model_name.underscore] || {}).merge(:device_id => current_device_id)
      end
    end
  end
end