require 'support/user_auth'

class User < ActiveRecord::Base
  
  extend Authentication::User::ClassMethods
  include Authentication::User::InstanceMethods
  
  attr_accessor :password, :password_confirmation
  
  belongs_to :account
  
  validates_presence_of :email, :token, :crypted_password, :salt, :account
  
  before_validation :hash_password, :generate_token
  before_validation_on_create :generate_account
  
  def to_s; email; end
  
  # Is this user allowed to access this app?
  def access?(application)
    applications.include?(application)
  end
  
  # Get all the apps I can access
  def applications
    Application.for(self)
  end
  
  private
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(12) unless token
  end
  
  # Create stub account for now until we have full account support
  def generate_account
    self.account = Account.create(:name => self.email) unless account
  end
end
