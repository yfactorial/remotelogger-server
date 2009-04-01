require 'support/user_auth'

class User < ActiveRecord::Base
  
  extend Authentication::User::ClassMethods
  include Authentication::User::InstanceMethods
  
  attr_accessor :password, :password_confirmation
  
  belongs_to :account
  
  validates_presence_of :email, :token, :crypted_password, :salt
  
  before_validation :hash_password
  before_validation :generate_token
  
  def to_s; email; end
  
  private
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(12) if token.nil?
  end
end
