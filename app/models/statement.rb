class Statement < ActiveRecord::Base
  
  belongs_to :application
  
  validates_presence_of :application, :device_id, :level, :message
  
  before_validation_on_create :normalize_level
  before_create :generate_logged_at
  
  private
  
  def normalize_level
    self.level = level.upcase if level
  end
  
  def generate_logged_at
    self.logged_at = Time.now unless logged_at
  end
end