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
  
  private
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(12) if token.nil?
  end
  
  # Create stub account for now until we have full account support
  def generate_account
    self.account = Account.create(:name => self.email)
  end
end
