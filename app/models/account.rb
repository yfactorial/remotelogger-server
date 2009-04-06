class Account < ActiveRecord::Base
  
  has_many :users, :dependent => :delete_all
  has_many :applications, :dependent => :destroy
  has_many :statements, :through => :applications, :order => 'statements.logged_at DESC, statements.created_at DESC, id DESC'
  has_many :device_labels, :dependent => :delete_all
  
  validates_presence_of :name
  
  # Does this account have a user-supplied labelf for this
  # device?
  def label?(device_id)
    device_label = device_labels.for(device_id).first
    !device_label.nil?
  end
  
  # Get the label for this device.  Use device id if no
  # label has been set
  def label(device_id)
    device_label = device_labels.for(device_id).first
    device_label ? device_label.label : device_id
  end
end