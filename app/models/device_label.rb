class DeviceLabel < ActiveRecord::Base
  
  belongs_to :account
  
  validates_presence_of :account, :label, :device_id
  validates_uniqueness_of :label, :scope => :account_id
  validates_uniqueness_of :device_id, :scope => :account_id
  
  named_scope :for, lambda { |device_id| { :conditions => { :device_id => device_id }} }
end