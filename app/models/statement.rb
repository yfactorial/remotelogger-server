class Statement < ActiveRecord::Base
  
  belongs_to :application
  
  validates_presence_of :application, :device_id, :level, :message
  
  before_validation_on_create :normalize_level
  
  private
  
  def normalize_level
    self.level = level.upcase if level
  end
end