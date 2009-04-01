class Account < ActiveRecord::Base
  
  has_many :users, :dependent => :delete_all
  has_many :applications, :dependent => :destroy
  
  validates_presence_of :name
end