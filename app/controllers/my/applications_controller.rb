module My
  
  class ApplicationsController < ApplicationController
  
    make_resourceful do
      actions :new, :create
    end
  
  end
end