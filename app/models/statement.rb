class Statement < ActiveRecord::Base
  
  belongs_to :application
  
  validates_presence_of :application, :device_id, :level, :message
  
  before_validation_on_create :normalize_level
  before_create :generate_logged_at
  
  # TODO: Having a 'recent' named scope to do this barfs when paginated
  # default_scope :order => 'logged_at DESC, created_at DESC'
  
  private
  
  def normalize_level
    self.level = level.upcase if level
  end
  
  def generate_logged_at
    self.logged_at = Time.now unless logged_at
  end
end