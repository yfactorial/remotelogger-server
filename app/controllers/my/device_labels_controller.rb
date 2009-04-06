module My
  class DeviceLabelsController < MyController
    
    make_resourceful do
      
      actions :create, :destroy
      
      response_for :create do |wants|
        wants.html do
          flash[:notice] = "Device #{current_object.device_id} will now be labeled as #{current_object.label}"
          redirect_back_or my_applications_path
        end
      end
      
      response_for :create_fails do |wants|
        wants.html do
          flash[:error] = "Was unable to label device #{current_object.device_id} as #{current_object.label}"
          redirect_back_or my_applications_path
        end
      end
      
      response_for :destroy do |wants|
        wants.html do
          flash[:notice] = "Removed label for device #{current_object.device_id}"
          redirect_back_or my_applications_path
        end
      end
    end
    
    private
    
    #-- Make resourceful overrides
    
    # Current label is found by device_id
    def current_object
      @current_object ||= current_account.device_labels.find_by_device_id(params[:id])
    end
    def parent?; true; end
    def parent_object; current_account; end
  end
end