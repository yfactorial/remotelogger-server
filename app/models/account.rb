class Account < ActiveRecord::Base
  
  has_many :users, :dependent => :delete_all
  has_many :applications, :dependent => :destroy
  has_many :statements, :through => :applications, :order => 'statements.logged_at DESC, statements.created_at DESC, id DESC'
  
  validates_presence_of :name
end